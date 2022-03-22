import Foundation
import ApolloModels

protocol BaseMagicData {
  var id: String { get }
  var name: String? { get }
  var image: String? { get }
  var description: String? { get }
}

protocol SpellData {
  var slots: Int? { get }
  var cost: Int? { get }
  var effects: String? { get }
  var requieredData: [GQL.AttributeEntryData]? { get }
}

protocol AshOfWarData {
  var affinity: String? { get }
  var skill: String? { get }
}

protocol SpriritData {
  var hpCost: String? { get }
  var fpCost: String? { get }
  var effect: String? { get }
}

extension GQL.SorceryData: BaseMagicData, SpellData {
  var requieredData: [GQL.AttributeEntryData]? {
    requires?.compactMap{ $0?.fragments.attributeEntryData }
  }
}

extension GQL.IncantationData: BaseMagicData, SpellData {
  var requieredData: [GQL.AttributeEntryData]? {
    requires?.compactMap{ $0?.fragments.attributeEntryData }
  }
}

extension GQL.AshOfWarData: BaseMagicData, AshOfWarData {}
extension GQL.SpiritData: BaseMagicData, SpriritData {}


let previewMagic: GQL.BaseItemData =  .init(id: "preview",
                                       image: nil,
                                       name: "preview item",
                                       description: "preview item description")
