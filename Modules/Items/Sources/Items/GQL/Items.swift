import Foundation
import ApolloModels

extension GQL.ItemData: Identifiable {}

let previewItem: GQL.ItemData =  .init(id: "preview",
                                       image: nil,
                                       name: "preview item",
                                       description: "preview item description",
                                       effect: "preview item effect")
