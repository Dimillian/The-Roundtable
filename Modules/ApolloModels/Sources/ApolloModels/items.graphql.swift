// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// GQL namespace
public extension GQL {
  final class GetItemsQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      query GetItems($page: Int!, $limit: Int!) {
        item(page: $page, limit: $limit) {
          __typename
          ...BaseItemData
        }
      }
      """

    public let operationName: String = "GetItems"

    public var queryDocument: String {
      var document: String = operationDefinition
      document.append("\n" + BaseItemData.fragmentDefinition)
      return document
    }

    public var page: Int
    public var limit: Int

    public init(page: Int, limit: Int) {
      self.page = page
      self.limit = limit
    }

    public var variables: GraphQLMap? {
      return ["page": page, "limit": limit]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Query"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("item", arguments: ["page": GraphQLVariable("page"), "limit": GraphQLVariable("limit")], type: .list(.object(Item.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(item: [Item?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Query", "item": item.flatMap { (value: [Item?]) -> [ResultMap?] in value.map { (value: Item?) -> ResultMap? in value.flatMap { (value: Item) -> ResultMap in value.resultMap } } }])
      }

      public var item: [Item?]? {
        get {
          return (resultMap["item"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Item?] in value.map { (value: ResultMap?) -> Item? in value.flatMap { (value: ResultMap) -> Item in Item(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Item?]) -> [ResultMap?] in value.map { (value: Item?) -> ResultMap? in value.flatMap { (value: Item) -> ResultMap in value.resultMap } } }, forKey: "item")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Item"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(BaseItemData.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, image: String? = nil, name: String? = nil, description: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Item", "id": id, "image": image, "name": name, "description": description])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var baseItemData: BaseItemData {
            get {
              return BaseItemData(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }

  final class GetItemQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      query GetItem($id: String!) {
        getItem(id: $id) {
          __typename
          ...ItemData
        }
      }
      """

    public let operationName: String = "GetItem"

    public var queryDocument: String {
      var document: String = operationDefinition
      document.append("\n" + ItemData.fragmentDefinition)
      return document
    }

    public var id: String

    public init(id: String) {
      self.id = id
    }

    public var variables: GraphQLMap? {
      return ["id": id]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Query"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("getItem", arguments: ["id": GraphQLVariable("id")], type: .nonNull(.object(GetItem.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(getItem: GetItem) {
        self.init(unsafeResultMap: ["__typename": "Query", "getItem": getItem.resultMap])
      }

      public var getItem: GetItem {
        get {
          return GetItem(unsafeResultMap: resultMap["getItem"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "getItem")
        }
      }

      public struct GetItem: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Item"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(ItemData.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, image: String? = nil, name: String? = nil, description: String? = nil, type: String? = nil, effect: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Item", "id": id, "image": image, "name": name, "description": description, "type": type, "effect": effect])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var itemData: ItemData {
            get {
              return ItemData(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }

  final class GetArmorsQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      query GetArmors($page: Int!, $limit: Int!) {
        armor(page: $page, limit: $limit) {
          __typename
          ...BaseArmorData
        }
      }
      """

    public let operationName: String = "GetArmors"

    public var queryDocument: String {
      var document: String = operationDefinition
      document.append("\n" + BaseArmorData.fragmentDefinition)
      return document
    }

    public var page: Int
    public var limit: Int

    public init(page: Int, limit: Int) {
      self.page = page
      self.limit = limit
    }

    public var variables: GraphQLMap? {
      return ["page": page, "limit": limit]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Query"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("armor", arguments: ["page": GraphQLVariable("page"), "limit": GraphQLVariable("limit")], type: .list(.object(Armor.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(armor: [Armor?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Query", "armor": armor.flatMap { (value: [Armor?]) -> [ResultMap?] in value.map { (value: Armor?) -> ResultMap? in value.flatMap { (value: Armor) -> ResultMap in value.resultMap } } }])
      }

      public var armor: [Armor?]? {
        get {
          return (resultMap["armor"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Armor?] in value.map { (value: ResultMap?) -> Armor? in value.flatMap { (value: ResultMap) -> Armor in Armor(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Armor?]) -> [ResultMap?] in value.map { (value: Armor?) -> ResultMap? in value.flatMap { (value: Armor) -> ResultMap in value.resultMap } } }, forKey: "armor")
        }
      }

      public struct Armor: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Armor"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(BaseArmorData.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, image: String? = nil, name: String? = nil, description: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Armor", "id": id, "image": image, "name": name, "description": description])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var baseArmorData: BaseArmorData {
            get {
              return BaseArmorData(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }

  final class GetArmorQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      query GetArmor($id: String!) {
        getArmor(id: $id) {
          __typename
          ...ArmorData
        }
      }
      """

    public let operationName: String = "GetArmor"

    public var queryDocument: String {
      var document: String = operationDefinition
      document.append("\n" + ArmorData.fragmentDefinition)
      document.append("\n" + AttributeEntryData.fragmentDefinition)
      return document
    }

    public var id: String

    public init(id: String) {
      self.id = id
    }

    public var variables: GraphQLMap? {
      return ["id": id]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Query"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("getArmor", arguments: ["id": GraphQLVariable("id")], type: .nonNull(.object(GetArmor.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(getArmor: GetArmor) {
        self.init(unsafeResultMap: ["__typename": "Query", "getArmor": getArmor.resultMap])
      }

      public var getArmor: GetArmor {
        get {
          return GetArmor(unsafeResultMap: resultMap["getArmor"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "getArmor")
        }
      }

      public struct GetArmor: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Armor"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(ArmorData.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var armorData: ArmorData {
            get {
              return ArmorData(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }

  final class GetWeaponsQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      query GetWeapons($page: Int!, $limit: Int!) {
        weapon(page: $page, limit: $limit) {
          __typename
          ...BaseWeaponData
        }
      }
      """

    public let operationName: String = "GetWeapons"

    public var queryDocument: String {
      var document: String = operationDefinition
      document.append("\n" + BaseWeaponData.fragmentDefinition)
      return document
    }

    public var page: Int
    public var limit: Int

    public init(page: Int, limit: Int) {
      self.page = page
      self.limit = limit
    }

    public var variables: GraphQLMap? {
      return ["page": page, "limit": limit]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Query"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("weapon", arguments: ["page": GraphQLVariable("page"), "limit": GraphQLVariable("limit")], type: .list(.object(Weapon.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(weapon: [Weapon?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Query", "weapon": weapon.flatMap { (value: [Weapon?]) -> [ResultMap?] in value.map { (value: Weapon?) -> ResultMap? in value.flatMap { (value: Weapon) -> ResultMap in value.resultMap } } }])
      }

      public var weapon: [Weapon?]? {
        get {
          return (resultMap["weapon"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Weapon?] in value.map { (value: ResultMap?) -> Weapon? in value.flatMap { (value: ResultMap) -> Weapon in Weapon(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Weapon?]) -> [ResultMap?] in value.map { (value: Weapon?) -> ResultMap? in value.flatMap { (value: Weapon) -> ResultMap in value.resultMap } } }, forKey: "weapon")
        }
      }

      public struct Weapon: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Weapon"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(BaseWeaponData.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, image: String? = nil, name: String? = nil, description: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Weapon", "id": id, "image": image, "name": name, "description": description])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var baseWeaponData: BaseWeaponData {
            get {
              return BaseWeaponData(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }

  final class GetWeaponQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      query GetWeapon($id: String!) {
        getWeapon(id: $id) {
          __typename
          ...WeaponData
        }
      }
      """

    public let operationName: String = "GetWeapon"

    public var queryDocument: String {
      var document: String = operationDefinition
      document.append("\n" + WeaponData.fragmentDefinition)
      document.append("\n" + AttributeEntryData.fragmentDefinition)
      document.append("\n" + ScallingEntryData.fragmentDefinition)
      return document
    }

    public var id: String

    public init(id: String) {
      self.id = id
    }

    public var variables: GraphQLMap? {
      return ["id": id]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Query"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("getWeapon", arguments: ["id": GraphQLVariable("id")], type: .nonNull(.object(GetWeapon.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(getWeapon: GetWeapon) {
        self.init(unsafeResultMap: ["__typename": "Query", "getWeapon": getWeapon.resultMap])
      }

      public var getWeapon: GetWeapon {
        get {
          return GetWeapon(unsafeResultMap: resultMap["getWeapon"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "getWeapon")
        }
      }

      public struct GetWeapon: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Weapon"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(WeaponData.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var weaponData: WeaponData {
            get {
              return WeaponData(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }

  final class GetTalismansQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      query GetTalismans($page: Int!, $limit: Int!) {
        talisman(page: $page, limit: $limit) {
          __typename
          ...BaseTalismanData
        }
      }
      """

    public let operationName: String = "GetTalismans"

    public var queryDocument: String {
      var document: String = operationDefinition
      document.append("\n" + BaseTalismanData.fragmentDefinition)
      return document
    }

    public var page: Int
    public var limit: Int

    public init(page: Int, limit: Int) {
      self.page = page
      self.limit = limit
    }

    public var variables: GraphQLMap? {
      return ["page": page, "limit": limit]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Query"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("talisman", arguments: ["page": GraphQLVariable("page"), "limit": GraphQLVariable("limit")], type: .list(.object(Talisman.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(talisman: [Talisman?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Query", "talisman": talisman.flatMap { (value: [Talisman?]) -> [ResultMap?] in value.map { (value: Talisman?) -> ResultMap? in value.flatMap { (value: Talisman) -> ResultMap in value.resultMap } } }])
      }

      public var talisman: [Talisman?]? {
        get {
          return (resultMap["talisman"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Talisman?] in value.map { (value: ResultMap?) -> Talisman? in value.flatMap { (value: ResultMap) -> Talisman in Talisman(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Talisman?]) -> [ResultMap?] in value.map { (value: Talisman?) -> ResultMap? in value.flatMap { (value: Talisman) -> ResultMap in value.resultMap } } }, forKey: "talisman")
        }
      }

      public struct Talisman: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Talisman"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(BaseTalismanData.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, image: String? = nil, name: String? = nil, description: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Talisman", "id": id, "image": image, "name": name, "description": description])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var baseTalismanData: BaseTalismanData {
            get {
              return BaseTalismanData(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }

  final class GetTalismanQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      query GetTalisman($id: String!) {
        getTalisman(id: $id) {
          __typename
          ...TalismanData
        }
      }
      """

    public let operationName: String = "GetTalisman"

    public var queryDocument: String {
      var document: String = operationDefinition
      document.append("\n" + TalismanData.fragmentDefinition)
      return document
    }

    public var id: String

    public init(id: String) {
      self.id = id
    }

    public var variables: GraphQLMap? {
      return ["id": id]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Query"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("getTalisman", arguments: ["id": GraphQLVariable("id")], type: .nonNull(.object(GetTalisman.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(getTalisman: GetTalisman) {
        self.init(unsafeResultMap: ["__typename": "Query", "getTalisman": getTalisman.resultMap])
      }

      public var getTalisman: GetTalisman {
        get {
          return GetTalisman(unsafeResultMap: resultMap["getTalisman"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "getTalisman")
        }
      }

      public struct GetTalisman: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Talisman"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(TalismanData.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, image: String? = nil, name: String? = nil, description: String? = nil, effect: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Talisman", "id": id, "image": image, "name": name, "description": description, "effect": effect])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var talismanData: TalismanData {
            get {
              return TalismanData(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }

  struct BaseItemData: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment BaseItemData on Item {
        __typename
        id
        image
        name
        description
      }
      """

    public static let possibleTypes: [String] = ["Item"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("image", type: .scalar(String.self)),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("description", type: .scalar(String.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, image: String? = nil, name: String? = nil, description: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Item", "id": id, "image": image, "name": name, "description": description])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return resultMap["id"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }

    public var image: String? {
      get {
        return resultMap["image"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "image")
      }
    }

    public var name: String? {
      get {
        return resultMap["name"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "name")
      }
    }

    public var description: String? {
      get {
        return resultMap["description"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "description")
      }
    }
  }

  struct BaseArmorData: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment BaseArmorData on Armor {
        __typename
        id
        image
        name
        description
      }
      """

    public static let possibleTypes: [String] = ["Armor"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("image", type: .scalar(String.self)),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("description", type: .scalar(String.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, image: String? = nil, name: String? = nil, description: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Armor", "id": id, "image": image, "name": name, "description": description])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return resultMap["id"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }

    public var image: String? {
      get {
        return resultMap["image"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "image")
      }
    }

    public var name: String? {
      get {
        return resultMap["name"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "name")
      }
    }

    public var description: String? {
      get {
        return resultMap["description"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "description")
      }
    }
  }

  struct BaseWeaponData: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment BaseWeaponData on Weapon {
        __typename
        id
        image
        name
        description
      }
      """

    public static let possibleTypes: [String] = ["Weapon"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("image", type: .scalar(String.self)),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("description", type: .scalar(String.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, image: String? = nil, name: String? = nil, description: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Weapon", "id": id, "image": image, "name": name, "description": description])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return resultMap["id"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }

    public var image: String? {
      get {
        return resultMap["image"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "image")
      }
    }

    public var name: String? {
      get {
        return resultMap["name"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "name")
      }
    }

    public var description: String? {
      get {
        return resultMap["description"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "description")
      }
    }
  }

  struct BaseTalismanData: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment BaseTalismanData on Talisman {
        __typename
        id
        image
        name
        description
      }
      """

    public static let possibleTypes: [String] = ["Talisman"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("image", type: .scalar(String.self)),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("description", type: .scalar(String.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, image: String? = nil, name: String? = nil, description: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Talisman", "id": id, "image": image, "name": name, "description": description])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return resultMap["id"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }

    public var image: String? {
      get {
        return resultMap["image"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "image")
      }
    }

    public var name: String? {
      get {
        return resultMap["name"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "name")
      }
    }

    public var description: String? {
      get {
        return resultMap["description"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "description")
      }
    }
  }

  struct ItemData: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment ItemData on Item {
        __typename
        id
        image
        name
        description
        type
        effect
      }
      """

    public static let possibleTypes: [String] = ["Item"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("image", type: .scalar(String.self)),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("type", type: .scalar(String.self)),
        GraphQLField("effect", type: .scalar(String.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, image: String? = nil, name: String? = nil, description: String? = nil, type: String? = nil, effect: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Item", "id": id, "image": image, "name": name, "description": description, "type": type, "effect": effect])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return resultMap["id"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }

    public var image: String? {
      get {
        return resultMap["image"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "image")
      }
    }

    public var name: String? {
      get {
        return resultMap["name"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "name")
      }
    }

    public var description: String? {
      get {
        return resultMap["description"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "description")
      }
    }

    public var type: String? {
      get {
        return resultMap["type"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "type")
      }
    }

    public var effect: String? {
      get {
        return resultMap["effect"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "effect")
      }
    }
  }

  struct ArmorData: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment ArmorData on Armor {
        __typename
        id
        image
        name
        description
        weight
        resistance {
          __typename
          ...AttributeEntryData
        }
        dmgNegation {
          __typename
          ...AttributeEntryData
        }
      }
      """

    public static let possibleTypes: [String] = ["Armor"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("image", type: .scalar(String.self)),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("weight", type: .scalar(Int.self)),
        GraphQLField("resistance", type: .list(.object(Resistance.selections))),
        GraphQLField("dmgNegation", type: .list(.object(DmgNegation.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, image: String? = nil, name: String? = nil, description: String? = nil, weight: Int? = nil, resistance: [Resistance?]? = nil, dmgNegation: [DmgNegation?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Armor", "id": id, "image": image, "name": name, "description": description, "weight": weight, "resistance": resistance.flatMap { (value: [Resistance?]) -> [ResultMap?] in value.map { (value: Resistance?) -> ResultMap? in value.flatMap { (value: Resistance) -> ResultMap in value.resultMap } } }, "dmgNegation": dmgNegation.flatMap { (value: [DmgNegation?]) -> [ResultMap?] in value.map { (value: DmgNegation?) -> ResultMap? in value.flatMap { (value: DmgNegation) -> ResultMap in value.resultMap } } }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return resultMap["id"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }

    public var image: String? {
      get {
        return resultMap["image"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "image")
      }
    }

    public var name: String? {
      get {
        return resultMap["name"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "name")
      }
    }

    public var description: String? {
      get {
        return resultMap["description"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "description")
      }
    }

    public var weight: Int? {
      get {
        return resultMap["weight"] as? Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "weight")
      }
    }

    public var resistance: [Resistance?]? {
      get {
        return (resultMap["resistance"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Resistance?] in value.map { (value: ResultMap?) -> Resistance? in value.flatMap { (value: ResultMap) -> Resistance in Resistance(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Resistance?]) -> [ResultMap?] in value.map { (value: Resistance?) -> ResultMap? in value.flatMap { (value: Resistance) -> ResultMap in value.resultMap } } }, forKey: "resistance")
      }
    }

    public var dmgNegation: [DmgNegation?]? {
      get {
        return (resultMap["dmgNegation"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [DmgNegation?] in value.map { (value: ResultMap?) -> DmgNegation? in value.flatMap { (value: ResultMap) -> DmgNegation in DmgNegation(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [DmgNegation?]) -> [ResultMap?] in value.map { (value: DmgNegation?) -> ResultMap? in value.flatMap { (value: DmgNegation) -> ResultMap in value.resultMap } } }, forKey: "dmgNegation")
      }
    }

    public struct Resistance: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["AttributeEntry"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(AttributeEntryData.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String? = nil, amount: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "AttributeEntry", "name": name, "amount": amount])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var attributeEntryData: AttributeEntryData {
          get {
            return AttributeEntryData(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }

    public struct DmgNegation: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["AttributeEntry"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(AttributeEntryData.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String? = nil, amount: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "AttributeEntry", "name": name, "amount": amount])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var attributeEntryData: AttributeEntryData {
          get {
            return AttributeEntryData(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }

  struct WeaponData: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment WeaponData on Weapon {
        __typename
        id
        image
        name
        description
        weight
        category
        attack {
          __typename
          ...AttributeEntryData
        }
        defence {
          __typename
          ...AttributeEntryData
        }
        scalesWith {
          __typename
          ...ScallingEntryData
        }
        requiredAttributes {
          __typename
          ...AttributeEntryData
        }
      }
      """

    public static let possibleTypes: [String] = ["Weapon"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("image", type: .scalar(String.self)),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("weight", type: .scalar(Int.self)),
        GraphQLField("category", type: .scalar(String.self)),
        GraphQLField("attack", type: .list(.object(Attack.selections))),
        GraphQLField("defence", type: .list(.object(Defence.selections))),
        GraphQLField("scalesWith", type: .list(.object(ScalesWith.selections))),
        GraphQLField("requiredAttributes", type: .list(.object(RequiredAttribute.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, image: String? = nil, name: String? = nil, description: String? = nil, weight: Int? = nil, category: String? = nil, attack: [Attack?]? = nil, defence: [Defence?]? = nil, scalesWith: [ScalesWith?]? = nil, requiredAttributes: [RequiredAttribute?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Weapon", "id": id, "image": image, "name": name, "description": description, "weight": weight, "category": category, "attack": attack.flatMap { (value: [Attack?]) -> [ResultMap?] in value.map { (value: Attack?) -> ResultMap? in value.flatMap { (value: Attack) -> ResultMap in value.resultMap } } }, "defence": defence.flatMap { (value: [Defence?]) -> [ResultMap?] in value.map { (value: Defence?) -> ResultMap? in value.flatMap { (value: Defence) -> ResultMap in value.resultMap } } }, "scalesWith": scalesWith.flatMap { (value: [ScalesWith?]) -> [ResultMap?] in value.map { (value: ScalesWith?) -> ResultMap? in value.flatMap { (value: ScalesWith) -> ResultMap in value.resultMap } } }, "requiredAttributes": requiredAttributes.flatMap { (value: [RequiredAttribute?]) -> [ResultMap?] in value.map { (value: RequiredAttribute?) -> ResultMap? in value.flatMap { (value: RequiredAttribute) -> ResultMap in value.resultMap } } }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return resultMap["id"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }

    public var image: String? {
      get {
        return resultMap["image"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "image")
      }
    }

    public var name: String? {
      get {
        return resultMap["name"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "name")
      }
    }

    public var description: String? {
      get {
        return resultMap["description"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "description")
      }
    }

    public var weight: Int? {
      get {
        return resultMap["weight"] as? Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "weight")
      }
    }

    public var category: String? {
      get {
        return resultMap["category"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "category")
      }
    }

    public var attack: [Attack?]? {
      get {
        return (resultMap["attack"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Attack?] in value.map { (value: ResultMap?) -> Attack? in value.flatMap { (value: ResultMap) -> Attack in Attack(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Attack?]) -> [ResultMap?] in value.map { (value: Attack?) -> ResultMap? in value.flatMap { (value: Attack) -> ResultMap in value.resultMap } } }, forKey: "attack")
      }
    }

    public var defence: [Defence?]? {
      get {
        return (resultMap["defence"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Defence?] in value.map { (value: ResultMap?) -> Defence? in value.flatMap { (value: ResultMap) -> Defence in Defence(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Defence?]) -> [ResultMap?] in value.map { (value: Defence?) -> ResultMap? in value.flatMap { (value: Defence) -> ResultMap in value.resultMap } } }, forKey: "defence")
      }
    }

    public var scalesWith: [ScalesWith?]? {
      get {
        return (resultMap["scalesWith"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [ScalesWith?] in value.map { (value: ResultMap?) -> ScalesWith? in value.flatMap { (value: ResultMap) -> ScalesWith in ScalesWith(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [ScalesWith?]) -> [ResultMap?] in value.map { (value: ScalesWith?) -> ResultMap? in value.flatMap { (value: ScalesWith) -> ResultMap in value.resultMap } } }, forKey: "scalesWith")
      }
    }

    public var requiredAttributes: [RequiredAttribute?]? {
      get {
        return (resultMap["requiredAttributes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [RequiredAttribute?] in value.map { (value: ResultMap?) -> RequiredAttribute? in value.flatMap { (value: ResultMap) -> RequiredAttribute in RequiredAttribute(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [RequiredAttribute?]) -> [ResultMap?] in value.map { (value: RequiredAttribute?) -> ResultMap? in value.flatMap { (value: RequiredAttribute) -> ResultMap in value.resultMap } } }, forKey: "requiredAttributes")
      }
    }

    public struct Attack: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["AttributeEntry"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(AttributeEntryData.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String? = nil, amount: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "AttributeEntry", "name": name, "amount": amount])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var attributeEntryData: AttributeEntryData {
          get {
            return AttributeEntryData(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }

    public struct Defence: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["AttributeEntry"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(AttributeEntryData.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String? = nil, amount: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "AttributeEntry", "name": name, "amount": amount])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var attributeEntryData: AttributeEntryData {
          get {
            return AttributeEntryData(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }

    public struct ScalesWith: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ScallingEntry"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(ScallingEntryData.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String? = nil, scalling: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "ScallingEntry", "name": name, "scalling": scalling])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var scallingEntryData: ScallingEntryData {
          get {
            return ScallingEntryData(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }

    public struct RequiredAttribute: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["AttributeEntry"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(AttributeEntryData.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String? = nil, amount: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "AttributeEntry", "name": name, "amount": amount])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var attributeEntryData: AttributeEntryData {
          get {
            return AttributeEntryData(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }

  struct TalismanData: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment TalismanData on Talisman {
        __typename
        id
        image
        name
        description
        effect
      }
      """

    public static let possibleTypes: [String] = ["Talisman"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("image", type: .scalar(String.self)),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("effect", type: .scalar(String.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, image: String? = nil, name: String? = nil, description: String? = nil, effect: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Talisman", "id": id, "image": image, "name": name, "description": description, "effect": effect])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return resultMap["id"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }

    public var image: String? {
      get {
        return resultMap["image"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "image")
      }
    }

    public var name: String? {
      get {
        return resultMap["name"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "name")
      }
    }

    public var description: String? {
      get {
        return resultMap["description"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "description")
      }
    }

    public var effect: String? {
      get {
        return resultMap["effect"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "effect")
      }
    }
  }

  struct AttributeEntryData: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment AttributeEntryData on AttributeEntry {
        __typename
        name
        amount
      }
      """

    public static let possibleTypes: [String] = ["AttributeEntry"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("amount", type: .scalar(Int.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(name: String? = nil, amount: Int? = nil) {
      self.init(unsafeResultMap: ["__typename": "AttributeEntry", "name": name, "amount": amount])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var name: String? {
      get {
        return resultMap["name"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "name")
      }
    }

    public var amount: Int? {
      get {
        return resultMap["amount"] as? Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "amount")
      }
    }
  }

  struct ScallingEntryData: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment ScallingEntryData on ScallingEntry {
        __typename
        name
        scalling
      }
      """

    public static let possibleTypes: [String] = ["ScallingEntry"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("scalling", type: .scalar(String.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(name: String? = nil, scalling: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "ScallingEntry", "name": name, "scalling": scalling])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var name: String? {
      get {
        return resultMap["name"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "name")
      }
    }

    public var scalling: String? {
      get {
        return resultMap["scalling"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "scalling")
      }
    }
  }
}
