import SwiftUI
import ApolloModels
import Kingfisher
import SharedUI

struct ItemDetailView: View {
  @StateObject private var viewModel: ItemDetailViewModel
  
  init(baseItem: BaseItemData) {
    _viewModel = StateObject(wrappedValue: .init(baseItem: baseItem))
  }
  
  var body: some View {
    List {
      if let item = viewModel.item {
        HStack {
          Spacer()
          KFImage(URL(string: item.image ?? ""))
            .resizable()
            .frame(width: 150, height: 150)
          Spacer()
        }
        .listRowBackground(Color.black)
        if let type = item.type {
          makeSection(title: "Type", content: type)
        }
        makeSection(title: "Description", content: item.description ?? "")
        if let effect = item.effect {
          makeSection(title: "Effect", content: effect)
        }
        if let resistance = item.resistanceData {
          makeAttributeDataSection(title: "Resistance", data: resistance)
        }
        if let dmgNegation = item.resistanceData {
          makeAttributeDataSection(title: "Damage negation", data: dmgNegation)
        }
      } else {
        Text("Loading...")
      }
    }
    .task {
      await viewModel.fetchItemData()
    }
    .listStyle(.insetGrouped)
    .navigationTitle(viewModel.item?.name?.uppercased() ?? "")
  }
  
  private func makeSectionTitle(title: String) -> some View {
    Text(title.uppercased())
      .font(.mantinia(size: 14))
      .foregroundColor(.white)
  }
  
  private func makeSection(title: String, content: String) -> some View {
    Section {
      Text(content)
        .font(.body)
        .foregroundColor(.white)
        .listRowBackground(Color.sky)
    } header: {
      makeSectionTitle(title: title)
    }
  }
  
  private func makeAttributeDataSection(title: String, data: [GQL.AttributeEntryData]) -> some View {
    Section {
      VStack {
        ForEach(data, id: \.name) { attribute in
          HStack {
            Text(attribute.name ?? "")
            Spacer()
            Text("\(attribute.amount ?? 0)")
          }
          Divider()
        }
      }
      .listRowBackground(Color.sky)
    } header: {
      makeSectionTitle(title: title)
    }
  }
}

struct SwiftUIView_Previews: PreviewProvider {
  static var previews: some View {
    ItemDetailView(baseItem: previewItem)
  }
}
