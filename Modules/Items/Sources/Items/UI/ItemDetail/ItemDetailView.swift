import SwiftUI
import ApolloModels
import Kingfisher
import SharedUI

struct ItemDetailView: View {
  let item: GQL.ItemData
  
  var body: some View {
    List {
      HStack {
        Spacer()
        KFImage(URL(string: item.image ?? ""))
          .resizable()
          .frame(width: 100, height: 100)
        Spacer()
      }
      .listRowBackground(Color.black)
      makeSection(title: "Type", content: item.type ?? "")
      makeSection(title: "Description", content: item.description ?? "")
      makeSection(title: "Effect", content: item.effect ?? "")
    }
    .listStyle(.insetGrouped)
    .navigationTitle(item.name?.uppercased() ?? "")
  }
  
  func makeSection(title: String, content: String) -> some View {
    Section {
      Text(content)
        .font(.body)
        .foregroundColor(.white)
        .listRowBackground(Color.sky)
    } header: {
      Text(title.uppercased())
        .font(.mantinia(size: 14))
        .foregroundColor(.white)
    }
  }
}

struct SwiftUIView_Previews: PreviewProvider {
  static var previews: some View {
    ItemDetailView(item: previewItem)
  }
}
