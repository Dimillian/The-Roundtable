import SwiftUI
import Foundation
import Networking
import ApolloModels
import Apollo

@MainActor
class ItemsListViewModel: ObservableObject {
  enum Constants {
    static let itemsPerPage = 20
  }
  
  enum State {
    case loading, data(items: [BaseItemData]), error
  }
    
  @Published var state: State = .loading
  @Published var isLoadingNextPage = false
  @Published var searchText: String = ""
  
  @Published var selectedTab: ItemTab = .items {
    didSet {
      state = .loading
      currentPage = 0
      Task {
        await fetchNextBaseItems()
      }
    }
  }
  
  private var datasource: [BaseItemData] = []
  private var currentPage = 0
  
  func fetchNextBaseItems() async {
    if currentPage > 0 {
      isLoadingNextPage = true
    }
    switch selectedTab {
    case .items:
      await fetchNextItems()
    case .armor:
      await fetchNextArmors()
    case .weapon:
      await fetchNextWeapons()
    case .talisman:
      await fetchNextTalismans()
    }
  }
  
  private func fetchNextItems() async {
    let query = GQL.GetItemsQuery(page: currentPage, limit: Constants.itemsPerPage)
    guard let data = await processQuery(query: query)?.item else {
      state = .error
      return
    }
    let items = data.compactMap{ $0?.fragments.baseItemData }
    processItems(items: items)
  }
  
  private func fetchNextArmors() async {
    let query = GQL.GetArmorsQuery(page: currentPage, limit: Constants.itemsPerPage)
    guard let data = await processQuery(query: query)?.armor else {
      state = .error
      return
    }
    let items = data.compactMap{ $0?.fragments.baseArmorData }
    processItems(items: items)
  }
  
  private func fetchNextWeapons() async {
    let query = GQL.GetWeaponsQuery(page: currentPage, limit: Constants.itemsPerPage)
    guard let data = await processQuery(query: query)?.weapon else {
      state = .error
      return
    }
    let items = data.compactMap{ $0?.fragments.baseWeaponData }
    processItems(items: items)
  }
  
  private func fetchNextTalismans() async {
    let query = GQL.GetTalismansQuery(page: currentPage, limit: Constants.itemsPerPage)
    guard let data = await processQuery(query: query)?.talisman else {
      state = .error
      return
    }
    let items = data.compactMap{ $0?.fragments.baseTalismanData }
    processItems(items: items)
  }
  
  private func processQuery<Query>(query: Query) async -> Query.Data? where Query: GraphQLQuery {
    do {
      return try await GQLClient.shared.fetch(query: query)
    } catch {
      self.state = .error
      return nil
    }
  }
  
  private func processItems(items: [BaseItemData]) {
    if currentPage == 0 {
      datasource = items
    } else {
      datasource.append(contentsOf: items)
    }
    state = .data(items: datasource)
    isLoadingNextPage = false
    currentPage += 1
  }
}
