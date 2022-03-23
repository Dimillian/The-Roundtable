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
        Section {
          switch viewModel.state {
          case .loading:
            loadingStateView
          case let .data(items):
            makeItemsList(items: items)
          case .error:
            errorView
          }
        } header: {
          tabSelectorView
        }
      }
      .searchable(text: $viewModel.searchText)
      .listStyle(.plain)
      .navigationTitle(Text("ITEMS"))
      .background(Color.sky)
      .task {
        await viewModel.fetchNextBaseItems()
      }
      .refreshable {
        viewModel.currentPage = 0
        await viewModel.fetchNextBaseItems()
      }
    }
  }
  
  private var tabSelectorView: some View {
    Picker("selection", selection: $viewModel.selectedTab) {
      ForEach(ItemTab.allCases) { tab in
        Text(tab.title).tag(tab)
      }
    }
    .pickerStyle(.segmented)
  }
  
  private var loadingStateView: some View {
    Text("Loading...")
      .foregroundColor(.white)
      .listRowBackground(Color.sky)
  }
  
  private var errorView: some View {
    Text("Error...")
      .foregroundColor(.white)
      .listRowBackground(Color.sky)
  }
  
  @ViewBuilder
  private func makeItemsList(items: [BaseItemData]) -> some View {
    ForEach(items, id: \.id) { item in
      NavigationLink(destination: ItemDetailView(baseItem: item)) {
        ItemsListRowView(item: item)
      }
      .listRowBackground(Color.sky)
    }
    if !viewModel.isLoadingNextPage {
      Rectangle()
        .listRowBackground(Color.sky)
        .task {
        await viewModel.fetchNextBaseItems()
      }
    }
  }
}

struct ItemsListView_Previews: PreviewProvider {
  static var previews: some View {
    ItemsListView()
  }
}
