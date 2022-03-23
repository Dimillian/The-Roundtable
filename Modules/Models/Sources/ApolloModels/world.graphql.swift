// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// GQL namespace
public extension GQL {
  final class GetWorldQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      query GetWorld($page: Int!, $limit: Int!) {
        npc(page: $page, limit: $limit) {
          __typename
          ...NPCData
        }
        boss(page: $page, limit: $limit) {
          __typename
          ...BossData
        }
        creature(page: $page, limit: $limit) {
          __typename
          ...CreatureData
        }
      }
      """

    public let operationName: String = "GetWorld"

    public var queryDocument: String {
      var document: String = operationDefinition
      document.append("\n" + NpcData.fragmentDefinition)
      document.append("\n" + BossData.fragmentDefinition)
      document.append("\n" + CreatureData.fragmentDefinition)
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
          GraphQLField("npc", arguments: ["page": GraphQLVariable("page"), "limit": GraphQLVariable("limit")], type: .list(.object(Npc.selections))),
          GraphQLField("boss", arguments: ["page": GraphQLVariable("page"), "limit": GraphQLVariable("limit")], type: .list(.object(Boss.selections))),
          GraphQLField("creature", arguments: ["page": GraphQLVariable("page"), "limit": GraphQLVariable("limit")], type: .list(.object(Creature.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(npc: [Npc?]? = nil, boss: [Boss?]? = nil, creature: [Creature?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Query", "npc": npc.flatMap { (value: [Npc?]) -> [ResultMap?] in value.map { (value: Npc?) -> ResultMap? in value.flatMap { (value: Npc) -> ResultMap in value.resultMap } } }, "boss": boss.flatMap { (value: [Boss?]) -> [ResultMap?] in value.map { (value: Boss?) -> ResultMap? in value.flatMap { (value: Boss) -> ResultMap in value.resultMap } } }, "creature": creature.flatMap { (value: [Creature?]) -> [ResultMap?] in value.map { (value: Creature?) -> ResultMap? in value.flatMap { (value: Creature) -> ResultMap in value.resultMap } } }])
      }

      public var npc: [Npc?]? {
        get {
          return (resultMap["npc"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Npc?] in value.map { (value: ResultMap?) -> Npc? in value.flatMap { (value: ResultMap) -> Npc in Npc(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Npc?]) -> [ResultMap?] in value.map { (value: Npc?) -> ResultMap? in value.flatMap { (value: Npc) -> ResultMap in value.resultMap } } }, forKey: "npc")
        }
      }

      public var boss: [Boss?]? {
        get {
          return (resultMap["boss"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Boss?] in value.map { (value: ResultMap?) -> Boss? in value.flatMap { (value: ResultMap) -> Boss in Boss(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Boss?]) -> [ResultMap?] in value.map { (value: Boss?) -> ResultMap? in value.flatMap { (value: Boss) -> ResultMap in value.resultMap } } }, forKey: "boss")
        }
      }

      public var creature: [Creature?]? {
        get {
          return (resultMap["creature"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Creature?] in value.map { (value: ResultMap?) -> Creature? in value.flatMap { (value: ResultMap) -> Creature in Creature(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Creature?]) -> [ResultMap?] in value.map { (value: Creature?) -> ResultMap? in value.flatMap { (value: Creature) -> ResultMap in value.resultMap } } }, forKey: "creature")
        }
      }

      public struct Npc: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Npc"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(NpcData.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String? = nil, location: String? = nil, role: String? = nil, image: String? = nil, quote: String? = nil, description: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Npc", "id": id, "name": name, "location": location, "role": role, "image": image, "quote": quote, "description": description])
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

          public var npcData: NpcData {
            get {
              return NpcData(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct Boss: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Boss"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(BossData.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String? = nil, location: String? = nil, description: String? = nil, healthPoints: String? = nil, drops: [String?]? = nil, image: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Boss", "id": id, "name": name, "location": location, "description": description, "healthPoints": healthPoints, "drops": drops, "image": image])
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

          public var bossData: BossData {
            get {
              return BossData(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct Creature: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Creature"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(CreatureData.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String? = nil, location: String? = nil, image: String? = nil, drops: [String?]? = nil, description: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Creature", "id": id, "name": name, "location": location, "image": image, "drops": drops, "description": description])
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

          public var creatureData: CreatureData {
            get {
              return CreatureData(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }

  struct NpcData: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment NPCData on Npc {
        __typename
        id
        name
        location
        role
        image
        quote
        description
      }
      """

    public static let possibleTypes: [String] = ["Npc"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("location", type: .scalar(String.self)),
        GraphQLField("role", type: .scalar(String.self)),
        GraphQLField("image", type: .scalar(String.self)),
        GraphQLField("quote", type: .scalar(String.self)),
        GraphQLField("description", type: .scalar(String.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, name: String? = nil, location: String? = nil, role: String? = nil, image: String? = nil, quote: String? = nil, description: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Npc", "id": id, "name": name, "location": location, "role": role, "image": image, "quote": quote, "description": description])
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

    public var location: String? {
      get {
        return resultMap["location"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "location")
      }
    }

    public var role: String? {
      get {
        return resultMap["role"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "role")
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

    public var quote: String? {
      get {
        return resultMap["quote"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "quote")
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

  struct BossData: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment BossData on Boss {
        __typename
        id
        name
        location
        description
        healthPoints
        drops
        image
      }
      """

    public static let possibleTypes: [String] = ["Boss"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("location", type: .scalar(String.self)),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("healthPoints", type: .scalar(String.self)),
        GraphQLField("drops", type: .list(.scalar(String.self))),
        GraphQLField("image", type: .scalar(String.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, name: String? = nil, location: String? = nil, description: String? = nil, healthPoints: String? = nil, drops: [String?]? = nil, image: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Boss", "id": id, "name": name, "location": location, "description": description, "healthPoints": healthPoints, "drops": drops, "image": image])
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

    public var location: String? {
      get {
        return resultMap["location"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "location")
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

    public var healthPoints: String? {
      get {
        return resultMap["healthPoints"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "healthPoints")
      }
    }

    public var drops: [String?]? {
      get {
        return resultMap["drops"] as? [String?]
      }
      set {
        resultMap.updateValue(newValue, forKey: "drops")
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
  }

  struct CreatureData: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment CreatureData on Creature {
        __typename
        id
        name
        location
        image
        drops
        description
      }
      """

    public static let possibleTypes: [String] = ["Creature"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("location", type: .scalar(String.self)),
        GraphQLField("image", type: .scalar(String.self)),
        GraphQLField("drops", type: .list(.scalar(String.self))),
        GraphQLField("description", type: .scalar(String.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, name: String? = nil, location: String? = nil, image: String? = nil, drops: [String?]? = nil, description: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Creature", "id": id, "name": name, "location": location, "image": image, "drops": drops, "description": description])
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

    public var location: String? {
      get {
        return resultMap["location"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "location")
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

    public var drops: [String?]? {
      get {
        return resultMap["drops"] as? [String?]
      }
      set {
        resultMap.updateValue(newValue, forKey: "drops")
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
}
