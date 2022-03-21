import Foundation
import ApolloModels

enum ItemType {
  case item, armor, weapon, talisman
}

protocol BaseItemData {
  var id: String { get }
  var name: String? { get }
  var image: String? { get }
  var description: String? { get }
  var itemType: ItemType { get }
}

protocol ItemData {
  var id: String { get }
  var name: String? { get }
  var image: String? { get }
  var description: String? { get }
  var itemType: ItemType { get }
  var effect: String? { get }
  var type: String? { get }
  var weight: Int? { get }
  var resistanceData: [GQL.AttributeEntryData]? { get }
  var dmgNegationData: [GQL.AttributeEntryData]? { get }
}

extension GQL.BaseItemData: BaseItemData {
  var itemType: ItemType {
    .item
  }
}

extension GQL.ItemData: BaseItemData, ItemData {
  var weight: Int? {
    nil
  }
  
  var resistanceData: [GQL.AttributeEntryData]? {
    nil
  }
  
  var dmgNegationData: [GQL.AttributeEntryData]? {
    nil
  }
  
  var itemType: ItemType {
    .item
  }
}

extension GQL.BaseArmorData: BaseItemData {
  var itemType: ItemType {
    .armor
  }
}

extension GQL.ArmorData: BaseItemData, ItemData {
  var itemType: ItemType {
    .armor
  }
  
  var effect: String? {
    nil
  }
  
  var type: String? {
    nil
  }
  
  var resistanceData: [GQL.AttributeEntryData]? {
    resistance?.compactMap{ $0?.fragments.attributeEntryData }
  }
  
  var dmgNegationData: [GQL.AttributeEntryData]? {
    dmgNegation?.compactMap{ $0?.fragments.attributeEntryData }
  }
  
  
}

extension GQL.BaseWeaponData: BaseItemData {
  var itemType: ItemType {
    .weapon
  }
}

extension GQL.BaseTalismanData: BaseItemData {
  var itemType: ItemType {
    .talisman
  }
}

let previewItem: GQL.BaseItemData =  .init(id: "preview",
                                       image: nil,
                                       name: "preview item",
                                       description: "preview item description")
