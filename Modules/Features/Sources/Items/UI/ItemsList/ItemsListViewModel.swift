import SwiftUI
import Foundation
import Networking
import ApolloModels
import Apollo

@MainActor
class ItemsListViewModel: ObservableObject {
  enum Constants {
    static let itemsPerPage = 100
  }
  
  enum State {
    case loading, data(items: [BaseItemData]), searchData(items: [SearchResultData]), error
  }
    
  @Published var state: State = .loading
  @Published var isLoadingNextPage = false
  @Published var searchText: String = "" {
    didSet{
      if searchText.isEmpty {
        selectedTab = .items
      } else {
        state = .loading
        currentPage = 0
        Task {
          await fetchSearchItem(query: searchText)
        }
      }
    }
  }
  
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
  var currentPage = 0
  
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
  
  func fetchSearchItem(query: String) async {
    state = .loading
    let query = GQL.GetSearchItemsQuery(query: query, page: 0, limit: 15)
    do {
      var searchResults: [SearchResultData] = []
      let results = try await GQLClient.shared.fetch(query: query, cachePolicy: .returnCacheDataElseFetch)
      searchResults.append(contentsOf: results.item?.compactMap{ $0 } ?? [])
      searchResults.append(contentsOf: results.armor?.compactMap{ $0 } ?? [])
      searchResults.append(contentsOf: results.weapon?.compactMap{ $0 } ?? [])
      searchResults.append(contentsOf: results.talisman?.compactMap{ $0 } ?? [])
      state = .searchData(items: searchResults)
    } catch {
      state = .error
    }
  }
  
  private func fetchNextItems() async {
    let query = GQL.GetItemsQuery(page: currentPage, limit: Constants.itemsPerPage)
    processItems(items: await processQuery(query: query)?.item?.compactMap{ $0?.fragments.baseItemData } )
  }
  
  private func fetchNextArmors() async {
    let query = GQL.GetArmorsQuery(page: currentPage, limit: Constants.itemsPerPage)
    processItems(items: await processQuery(query: query)?.armor?.compactMap{ $0?.fragments.baseArmorData } )
  }
  
  private func fetchNextWeapons() async {
    let query = GQL.GetWeaponsQuery(page: currentPage, limit: Constants.itemsPerPage)
    processItems(items: await processQuery(query: query)?.weapon?.compactMap{ $0?.fragments.baseWeaponData } )
  }
  
  private func fetchNextTalismans() async {
    let query = GQL.GetTalismansQuery(page: currentPage, limit: Constants.itemsPerPage)
    processItems(items: await processQuery(query: query)?.talisman?.compactMap{ $0?.fragments.baseTalismanData } )
  }
  
  private func processQuery<Query>(query: Query) async -> Query.Data? where Query: GraphQLQuery {
    do {
      return try await GQLClient.shared.fetch(query: query)
    } catch {
      self.state = .error
      return nil
    }
  }
  
  private func processItems(items: [BaseItemData]?) {
    guard let items = items else {
      state = .error
      return
    }
    
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
