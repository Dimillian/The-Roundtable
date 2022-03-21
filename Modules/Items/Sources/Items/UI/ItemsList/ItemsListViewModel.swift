import SwiftUI
import Foundation
import Networking
import ApolloModels

@MainActor
class ItemsListViewModel: ObservableObject {
  enum Constants {
    static let itemsPerPage = 20
  }
  
  enum State {
    case loading, data(items: [GQL.ItemData]), error
  }
  
  @Published var state: State = .loading
  @Published var isLoadingNextPage = false
  @Published var searchText: String = ""
  
  private var datasource: [GQL.ItemData] = []
  private var currentPage = 0
  
  func fetchNextItems() async {
    let query = GQL.GetItemsQuery(page: currentPage, limit: Constants.itemsPerPage)
    if currentPage > 0 {
      isLoadingNextPage = true
    }
    do {
      guard let data = try await GQLClient.shared.fetch(query: query).item else {
        state = .error
        return
      }
      let items = data.compactMap{ $0?.fragments.itemData }
      if currentPage == 0 {
        datasource = items
      } else {
        datasource.append(contentsOf: items)
      }
      state = .data(items: datasource)
      isLoadingNextPage = false
      currentPage += 1
    } catch {
      self.state = .error
    }
  }
}
