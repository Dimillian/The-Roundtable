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
        makeSection(title: "Description", content: item.description ?? "")
        if let item = item as? ItemPouchData {
          if let type = item.type {
            makeSection(title: "Type", content: type)
          }
          if let effect = item.effect {
            makeSection(title: "Effect", content: effect)
          }
        } else if let item = item as? ArmorItemData {
          if let resistance = item.resistanceData {
            makeAttributeDataSection(title: "Resistance", data: resistance)
          }
          if let dmgNegation = item.resistanceData {
            makeAttributeDataSection(title: "Damage negation", data: dmgNegation)
          }
        } else if let item = item as? WeaponItemData {
          if let scalling = item.scallingData {
            makeScallingSection(title: "Scalling", data: scalling)
          }
          if let attributes = item.requiredAttributesData {
            makeScallingSection(title: "Requiered attributes", data: attributes)
          }
          if let attack = item.attackData {
            makeAttributeDataSection(title: "Attack", data: attack)
          }
          if let defence = item.defenceData {
            makeAttributeDataSection(title: "Defence", data: defence)
          }
        } else if let item = item as? TalismanItemData {
          if let effect = item.effect {
            makeSection(title: "Effect", content: effect)
          }
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
  
  private func makeScallingSection(title: String, data: [GQL.ScallingEntryData]) -> some View {
    Section {
      VStack {
        ForEach(data, id: \.name) { attribute in
          HStack {
            Text(attribute.name ?? "")
            Spacer()
            Text(attribute.scalling ?? "")
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
