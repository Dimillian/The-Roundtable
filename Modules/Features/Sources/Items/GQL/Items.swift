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

protocol ItemPouchData {
  var effect: String? { get }
  var type: String? { get }
}

protocol ArmorItemData {
  var weight: Int? { get }
  var resistanceData: [GQL.AttributeEntryData]? { get }
  var dmgNegationData: [GQL.AttributeEntryData]? { get }
}

protocol WeaponItemData {
  var weight: Int? { get }
  var category: String? { get }
  var attackData: [GQL.AttributeEntryData]? { get }
  var defenceData: [GQL.AttributeEntryData]? { get }
  var scallingData: [GQL.ScallingEntryData]? { get }
  var requiredAttributesData: [GQL.ScallingEntryData]? { get }
}

protocol TalismanItemData {
  var effect: String? { get }
}

extension GQL.BaseItemData: BaseItemData {
  var itemType: ItemType {
    .item
  }
}

extension GQL.ItemData: BaseItemData, ItemPouchData {
  var itemType: ItemType {
    .item
  }
}

extension GQL.BaseArmorData: BaseItemData {
  var itemType: ItemType {
    .armor
  }
}

extension GQL.ArmorData: BaseItemData, ArmorItemData {
  var itemType: ItemType {
    .armor
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

extension GQL.WeaponData: BaseItemData, WeaponItemData {
  var itemType: ItemType {
    .weapon
  }
  
  var attackData: [GQL.AttributeEntryData]? {
    attack?.compactMap{ $0?.fragments.attributeEntryData }
  }
  
  var defenceData: [GQL.AttributeEntryData]? {
    defence?.compactMap{ $0?.fragments.attributeEntryData }
  }
  
  var scallingData: [GQL.ScallingEntryData]? {
    scalesWith?.compactMap{ $0?.fragments.scallingEntryData }
  }
  
  var requiredAttributesData: [GQL.ScallingEntryData]? {
    scalesWith?.compactMap{ $0?.fragments.scallingEntryData }
  }
}

extension GQL.BaseTalismanData: BaseItemData {
  var itemType: ItemType {
    .talisman
  }
}

extension GQL.TalismanData: BaseItemData, TalismanItemData {
  var itemType: ItemType {
    .talisman
  }
}

let previewItem: GQL.BaseItemData =  .init(id: "preview",
                                       image: nil,
                                       name: "preview item",
                                       description: "preview item description")
