import SwiftUI
import ApolloModels
import SharedUI
import Kingfisher

struct MagicRowView: View {
  let magic: BaseMagicData
  
  var body: some View {
    VStack(alignment: .leading, spacing: 8) {
      HStack {
        if let urlString = magic.image,
            let url = URL(string: urlString) {
          KFImage(url)
            .resizable()
            .frame(width: 50, height: 50)
        }
        Text(magic.name?.uppercased() ?? "")
          .font(.mantinia(size: 14))
      }
      Text(magic.description ?? "")
        .font(.body)
        .lineLimit(2)
    }
    .foregroundColor(.white)
  }
}
