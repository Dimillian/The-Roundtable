import SwiftUI

public struct SectionTitle: View {
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

struct SectionTitle_Previews: PreviewProvider {
  static var previews: some View {
    List {
      SectionTitle(title: "Test")
    }
  }
}
