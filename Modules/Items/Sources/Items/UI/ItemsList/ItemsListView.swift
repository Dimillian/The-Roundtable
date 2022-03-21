import SwiftUI
import SharedUI

public struct ItemsListView: View {
  @StateObject private var viewModel: ItemsListViewModel
  
  
  public init() {
    _viewModel = StateObject(wrappedValue: .init())
  }
  
  public var body: some View {
    NavigationView {
      List {
        switch viewModel.state {
        case .loading:
          Text("Loading...")
            .foregroundColor(.white)
            .listRowBackground(Color.sky)
        case let .data(items):
          ForEach(items) { item in
            NavigationLink(destination: ItemDetailView(item: item)) {
              ItemsListRowView(item: item)
            }
            .listRowBackground(Color.sky)
          }
          if !viewModel.isLoadingNextPage {
            Rectangle()
              .listRowBackground(Color.sky)
              .task {
              await viewModel.fetchNextItems()
            }
          }
        case .error:
          Text("Error...")
            .foregroundColor(.white)
            .listRowBackground(Color.sky)
        }
      }
      .searchable(text: $viewModel.searchText)
      .listStyle(.plain)
      .navigationTitle(Text("ITEMS"))
      .background(Color.sky)
      .task {
        await viewModel.fetchNextItems()
      }
    }
  }
}

struct ItemsListView_Previews: PreviewProvider {
  static var previews: some View {
    ItemsListView()
  }
}
