import SwiftUI
import Foundation
import ApolloModels
import Networking

@MainActor
class ItemDetailViewModel: ObservableObject {
  @Published var item: BaseItemData?
  
  private let baseItem: BaseItemData
  
  init(baseItem: BaseItemData) {
    self.baseItem = baseItem
  }
  
  func fetchItemData() async {
    do {
      switch baseItem.itemType {
      case .item:
        let query = GQL.GetItemQuery(id: baseItem.id)
        self.item = try await GQLClient.shared.fetch(query: query).getItem.fragments.itemData
      case .armor:
        let query = GQL.GetArmorQuery(id: baseItem.id)
        self.item = try await GQLClient.shared.fetch(query: query).getArmor.fragments.armorData
      case .weapon:
        let query = GQL.GetWeaponQuery(id: baseItem.id)
        self.item = try await GQLClient.shared.fetch(query: query).getWeapon.fragments.weaponData
      case .talisman:
        let query = GQL.GetTalismanQuery(id: baseItem.id)
        self.item = try await GQLClient.shared.fetch(query: query).getTalisman.fragments.talismanData
      }
    } catch {
  
    }
  }
}
