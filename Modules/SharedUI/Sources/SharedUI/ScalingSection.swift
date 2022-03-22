import SwiftUI
import ApolloModels

public struct ScalingSection: View {
  public let title: String
  public let data: [GQL.ScallingEntryData]
  
  public init(title: String, data: [GQL.ScallingEntryData]) {
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
            Text(attribute.scalling ?? "")
          }
          Divider()
        }
      }
      .listRowBackground(Color.sky)
    } header: {
      SharedSectionTitle(title: title)
    }
  }
}
