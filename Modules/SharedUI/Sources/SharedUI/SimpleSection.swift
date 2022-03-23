import SwiftUI

public struct SimpleSection: View {
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
      SectionTitle(title: title)
    }
  }
}

struct SimpleSection_Previews: PreviewProvider {
  static var previews: some View {
    List {
      SimpleSection(title: "Test", content: "Test")
    }
  }
}
