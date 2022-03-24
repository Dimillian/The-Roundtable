import SwiftUI
import SharedUI
import Kingfisher

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
            if viewModel.searchText.isEmpty {
              makeItemsList(items: items)
            } else {
              EmptyView()
            }
          case let .searchData(items):
            makeSearchResultsList(items: items)
          case .error:
            errorView
          }
        } header: {
          if viewModel.searchText.isEmpty {
            tabSelectorView
          }
        }
      }
      .searchable(text: $viewModel.searchText, prompt: "Search for an item")
      .listStyle(.plain)
      .navigationTitle(Text("ITEMS"))
      .background(Color.sky)
      .task {
        if viewModel.searchText.isEmpty {
          await viewModel.fetchNextBaseItems()
        }
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
  
  private func makeSearchResultsList(items: [SearchResultData]) -> some View {
    ForEach(items, id: \.id) { item in
      NavigationLink {
        if let item = item as? BaseItemData {
          ItemDetailView(baseItem: item)
        }
      } label: {
        HStack {
          if let imageString = item.image, let imageURL = URL(string: imageString) {
            KFImage(imageURL)
              .resizable()
              .frame(width: 30, height: 30)
          }
          Text(item.name ?? "")
            .foregroundColor(.edtree)
        }
      }.listRowBackground(Color.sky)
    }
  }
}

struct ItemsListView_Previews: PreviewProvider {
  static var previews: some View {
    ItemsListView()
  }
}
