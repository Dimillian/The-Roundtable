import SwiftUI
import SharedUI

public struct MagicListView: View {
  @StateObject var viewModel: MagicListViewModel
  
  public init() {
    _viewModel = StateObject(wrappedValue: .init())
  }
  
  public var body: some View {
    NavigationView {
      List {
        Section {
          switch viewModel.state {
          case .loading:
            Text("Loading...")
              .listRowBackground(Color.sky)
          case .error:
            Text("Error....")
              .listRowBackground(Color.sky)
          case let .data(magic):
            if let currentData = magic[viewModel.selectedTab] {
             makeMagicList(magic: currentData)
            }
          }
        } header: {
          tabSelectorView
        }
      }
      .listStyle(.plain)
      .background(Color.sky)
      .navigationTitle("MAGIC")
      .task {
        viewModel.currentPage = 0
        await viewModel.fetchNextMagic()
      }
    }
  }
  
  private var tabSelectorView: some View {
    Picker("selection", selection: $viewModel.selectedTab) {
      ForEach(MagicTab.allCases) { tab in
        Text(tab.title).tag(tab)
      }
    }
    .pickerStyle(.segmented)
  }
  
  private func makeMagicList(magic: [BaseMagicData]) -> some View {
    ForEach(magic, id: \.id) { item in
      NavigationLink {
        MagicDetailView(magic: item)
      } label: {
        MagicRowView(magic: item)
      }.listRowBackground(Color.sky)
    }
  }
}

struct MagicListView_Previews: PreviewProvider {
  static var previews: some View {
    MagicListView()
  }
}
