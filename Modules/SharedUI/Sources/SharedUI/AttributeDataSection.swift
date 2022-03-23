import SwiftUI
import ApolloModels

public struct AttributeDataSection: View {
  public let title: String
  public let data: [GQL.AttributeEntryData]
  
  public init(title: String, data: [GQL.AttributeEntryData]) {
    self.title = title
    self.data = data
  }
  
  public var body: some View {
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
      SectionTitle(title: title)
    }
  }
}
