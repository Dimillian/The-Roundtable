import SwiftUI

public struct SharedSectionTitle: View {
  public let title: String
  
  public init(title: String) {
    self.title = title
  }
  
  public var body: some View {
    Text(title.uppercased())
      .font(.mantinia(size: 14))
      .foregroundColor(.white)
  }
}

struct SharedSectionTitle_Previews: PreviewProvider {
  static var previews: some View {
    List {
      SharedSectionTitle(title: "Test")
    }
  }
}
