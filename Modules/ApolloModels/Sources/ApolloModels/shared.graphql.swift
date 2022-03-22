// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// GQL namespace
public extension GQL {
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
