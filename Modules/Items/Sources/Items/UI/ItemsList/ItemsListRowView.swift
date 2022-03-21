import SwiftUI
import ApolloModels
import SharedUI
import Kingfisher

struct ItemsListRowView: View {
  let item: GQL.ItemData
  
  var body: some View {
    VStack(alignment: .leading, spacing: 8) {
      HStack {
        if let urlString = item.image,
            let url = URL(string: urlString) {
          KFImage(url)
            .resizable()
            .frame(width: 50, height: 50)
        }
        Text(item.name?.uppercased() ?? "")
          .font(.mantinia(size: 14))
      }
      Text(item.description ?? "")
        .font(.body)
        .lineLimit(2)
    }
    .foregroundColor(.white)
  }
}

struct ItemsListRowView_Previews: PreviewProvider {
  static var previews: some View {
    ItemsListRowView(item: previewItem)
  }
}
