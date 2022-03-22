import SwiftUI

public struct SharedSection: View {
  public let title: String
  public let content: String
  
  public init(title: String, content: String) {
    self.title = title
    self.content = content
  }
  
  public var body: some View {
    Section {
      Text(content)
        .font(.body)
        .foregroundColor(.white)
        .listRowBackground(Color.sky)
    } header: {
      SharedSectionTitle(title: title)
    }
  }
}

struct SharedSection_Previews: PreviewProvider {
  static var previews: some View {
    List {
      SharedSection(title: "Test", content: "Test")
    }
  }
}
