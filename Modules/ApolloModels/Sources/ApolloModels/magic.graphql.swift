// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// GQL namespace
public extension GQL {
  final class GetMagicQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      query GetMagic($page: Int!, $limit: Int!) {
        sorcery(page: $page, limit: $limit) {
          __typename
          ...SorceryData
        }
        incantation(page: $page, limit: $limit) {
          __typename
          ...IncantationData
        }
        ashOfWar(page: $page, limit: $limit) {
          __typename
          ...AshOfWarData
        }
        spirit(page: $page, limit: $limit) {
          __typename
          ...SpiritData
        }
      }
      """

    public let operationName: String = "GetMagic"

    public var queryDocument: String {
      var document: String = operationDefinition
      document.append("\n" + SorceryData.fragmentDefinition)
      document.append("\n" + AttributeEntryData.fragmentDefinition)
      document.append("\n" + IncantationData.fragmentDefinition)
      document.append("\n" + AshOfWarData.fragmentDefinition)
      document.append("\n" + SpiritData.fragmentDefinition)
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
          GraphQLField("sorcery", arguments: ["page": GraphQLVariable("page"), "limit": GraphQLVariable("limit")], type: .list(.object(Sorcery.selections))),
          GraphQLField("incantation", arguments: ["page": GraphQLVariable("page"), "limit": GraphQLVariable("limit")], type: .list(.object(Incantation.selections))),
          GraphQLField("ashOfWar", arguments: ["page": GraphQLVariable("page"), "limit": GraphQLVariable("limit")], type: .list(.object(AshOfWar.selections))),
          GraphQLField("spirit", arguments: ["page": GraphQLVariable("page"), "limit": GraphQLVariable("limit")], type: .list(.object(Spirit.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(sorcery: [Sorcery?]? = nil, incantation: [Incantation?]? = nil, ashOfWar: [AshOfWar?]? = nil, spirit: [Spirit?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Query", "sorcery": sorcery.flatMap { (value: [Sorcery?]) -> [ResultMap?] in value.map { (value: Sorcery?) -> ResultMap? in value.flatMap { (value: Sorcery) -> ResultMap in value.resultMap } } }, "incantation": incantation.flatMap { (value: [Incantation?]) -> [ResultMap?] in value.map { (value: Incantation?) -> ResultMap? in value.flatMap { (value: Incantation) -> ResultMap in value.resultMap } } }, "ashOfWar": ashOfWar.flatMap { (value: [AshOfWar?]) -> [ResultMap?] in value.map { (value: AshOfWar?) -> ResultMap? in value.flatMap { (value: AshOfWar) -> ResultMap in value.resultMap } } }, "spirit": spirit.flatMap { (value: [Spirit?]) -> [ResultMap?] in value.map { (value: Spirit?) -> ResultMap? in value.flatMap { (value: Spirit) -> ResultMap in value.resultMap } } }])
      }

      public var sorcery: [Sorcery?]? {
        get {
          return (resultMap["sorcery"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Sorcery?] in value.map { (value: ResultMap?) -> Sorcery? in value.flatMap { (value: ResultMap) -> Sorcery in Sorcery(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Sorcery?]) -> [ResultMap?] in value.map { (value: Sorcery?) -> ResultMap? in value.flatMap { (value: Sorcery) -> ResultMap in value.resultMap } } }, forKey: "sorcery")
        }
      }

      public var incantation: [Incantation?]? {
        get {
          return (resultMap["incantation"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Incantation?] in value.map { (value: ResultMap?) -> Incantation? in value.flatMap { (value: ResultMap) -> Incantation in Incantation(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Incantation?]) -> [ResultMap?] in value.map { (value: Incantation?) -> ResultMap? in value.flatMap { (value: Incantation) -> ResultMap in value.resultMap } } }, forKey: "incantation")
        }
      }

      public var ashOfWar: [AshOfWar?]? {
        get {
          return (resultMap["ashOfWar"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [AshOfWar?] in value.map { (value: ResultMap?) -> AshOfWar? in value.flatMap { (value: ResultMap) -> AshOfWar in AshOfWar(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [AshOfWar?]) -> [ResultMap?] in value.map { (value: AshOfWar?) -> ResultMap? in value.flatMap { (value: AshOfWar) -> ResultMap in value.resultMap } } }, forKey: "ashOfWar")
        }
      }

      public var spirit: [Spirit?]? {
        get {
          return (resultMap["spirit"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Spirit?] in value.map { (value: ResultMap?) -> Spirit? in value.flatMap { (value: ResultMap) -> Spirit in Spirit(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Spirit?]) -> [ResultMap?] in value.map { (value: Spirit?) -> ResultMap? in value.flatMap { (value: Spirit) -> ResultMap in value.resultMap } } }, forKey: "spirit")
        }
      }

      public struct Sorcery: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Sorcery"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(SorceryData.self),
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

          public var sorceryData: SorceryData {
            get {
              return SorceryData(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct Incantation: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Incantation"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(IncantationData.self),
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

          public var incantationData: IncantationData {
            get {
              return IncantationData(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct AshOfWar: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["AshOfWar"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(AshOfWarData.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String? = nil, image: String? = nil, description: String? = nil, affinity: String? = nil, skill: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "AshOfWar", "id": id, "name": name, "image": image, "description": description, "affinity": affinity, "skill": skill])
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

          public var ashOfWarData: AshOfWarData {
            get {
              return AshOfWarData(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct Spirit: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Spirit"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(SpiritData.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String? = nil, image: String? = nil, description: String? = nil, fpCost: String? = nil, hpCost: String? = nil, effect: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Spirit", "id": id, "name": name, "image": image, "description": description, "fpCost": fpCost, "hpCost": hpCost, "effect": effect])
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

          public var spiritData: SpiritData {
            get {
              return SpiritData(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }

  struct IncantationData: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment IncantationData on Incantation {
        __typename
        id
        name
        description
        effects
        image
        slots
        cost
        requires {
          __typename
          ...AttributeEntryData
        }
      }
      """

    public static let possibleTypes: [String] = ["Incantation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("effects", type: .scalar(String.self)),
        GraphQLField("image", type: .scalar(String.self)),
        GraphQLField("slots", type: .scalar(Int.self)),
        GraphQLField("cost", type: .scalar(Int.self)),
        GraphQLField("requires", type: .list(.object(Require.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, name: String? = nil, description: String? = nil, effects: String? = nil, image: String? = nil, slots: Int? = nil, cost: Int? = nil, requires: [Require?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Incantation", "id": id, "name": name, "description": description, "effects": effects, "image": image, "slots": slots, "cost": cost, "requires": requires.flatMap { (value: [Require?]) -> [ResultMap?] in value.map { (value: Require?) -> ResultMap? in value.flatMap { (value: Require) -> ResultMap in value.resultMap } } }])
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

    public var effects: String? {
      get {
        return resultMap["effects"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "effects")
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

    public var slots: Int? {
      get {
        return resultMap["slots"] as? Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "slots")
      }
    }

    public var cost: Int? {
      get {
        return resultMap["cost"] as? Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "cost")
      }
    }

    public var requires: [Require?]? {
      get {
        return (resultMap["requires"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Require?] in value.map { (value: ResultMap?) -> Require? in value.flatMap { (value: ResultMap) -> Require in Require(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Require?]) -> [ResultMap?] in value.map { (value: Require?) -> ResultMap? in value.flatMap { (value: Require) -> ResultMap in value.resultMap } } }, forKey: "requires")
      }
    }

    public struct Require: GraphQLSelectionSet {
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

  struct SorceryData: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment SorceryData on Sorcery {
        __typename
        id
        name
        description
        effects
        image
        slots
        cost
        requires {
          __typename
          ...AttributeEntryData
        }
      }
      """

    public static let possibleTypes: [String] = ["Sorcery"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("effects", type: .scalar(String.self)),
        GraphQLField("image", type: .scalar(String.self)),
        GraphQLField("slots", type: .scalar(Int.self)),
        GraphQLField("cost", type: .scalar(Int.self)),
        GraphQLField("requires", type: .list(.object(Require.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, name: String? = nil, description: String? = nil, effects: String? = nil, image: String? = nil, slots: Int? = nil, cost: Int? = nil, requires: [Require?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Sorcery", "id": id, "name": name, "description": description, "effects": effects, "image": image, "slots": slots, "cost": cost, "requires": requires.flatMap { (value: [Require?]) -> [ResultMap?] in value.map { (value: Require?) -> ResultMap? in value.flatMap { (value: Require) -> ResultMap in value.resultMap } } }])
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

    public var effects: String? {
      get {
        return resultMap["effects"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "effects")
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

    public var slots: Int? {
      get {
        return resultMap["slots"] as? Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "slots")
      }
    }

    public var cost: Int? {
      get {
        return resultMap["cost"] as? Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "cost")
      }
    }

    public var requires: [Require?]? {
      get {
        return (resultMap["requires"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Require?] in value.map { (value: ResultMap?) -> Require? in value.flatMap { (value: ResultMap) -> Require in Require(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Require?]) -> [ResultMap?] in value.map { (value: Require?) -> ResultMap? in value.flatMap { (value: Require) -> ResultMap in value.resultMap } } }, forKey: "requires")
      }
    }

    public struct Require: GraphQLSelectionSet {
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

  struct AshOfWarData: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment AshOfWarData on AshOfWar {
        __typename
        id
        name
        image
        description
        affinity
        skill
      }
      """

    public static let possibleTypes: [String] = ["AshOfWar"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("image", type: .scalar(String.self)),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("affinity", type: .scalar(String.self)),
        GraphQLField("skill", type: .scalar(String.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, name: String? = nil, image: String? = nil, description: String? = nil, affinity: String? = nil, skill: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "AshOfWar", "id": id, "name": name, "image": image, "description": description, "affinity": affinity, "skill": skill])
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

    public var name: String? {
      get {
        return resultMap["name"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "name")
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

    public var description: String? {
      get {
        return resultMap["description"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "description")
      }
    }

    public var affinity: String? {
      get {
        return resultMap["affinity"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "affinity")
      }
    }

    public var skill: String? {
      get {
        return resultMap["skill"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "skill")
      }
    }
  }

  struct SpiritData: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment SpiritData on Spirit {
        __typename
        id
        name
        image
        description
        fpCost
        hpCost
        effect
      }
      """

    public static let possibleTypes: [String] = ["Spirit"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("image", type: .scalar(String.self)),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("fpCost", type: .scalar(String.self)),
        GraphQLField("hpCost", type: .scalar(String.self)),
        GraphQLField("effect", type: .scalar(String.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, name: String? = nil, image: String? = nil, description: String? = nil, fpCost: String? = nil, hpCost: String? = nil, effect: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Spirit", "id": id, "name": name, "image": image, "description": description, "fpCost": fpCost, "hpCost": hpCost, "effect": effect])
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

    public var name: String? {
      get {
        return resultMap["name"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "name")
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

    public var description: String? {
      get {
        return resultMap["description"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "description")
      }
    }

    public var fpCost: String? {
      get {
        return resultMap["fpCost"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "fpCost")
      }
    }

    public var hpCost: String? {
      get {
        return resultMap["hpCost"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "hpCost")
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
}
