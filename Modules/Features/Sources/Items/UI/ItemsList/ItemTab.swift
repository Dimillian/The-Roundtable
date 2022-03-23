import SwiftUI

enum ItemTab: Int, Identifiable, CaseIterable, Equatable {
  case items, armor, weapon, talisman
  
  var id: Int {
    rawValue
  }
  
  var title: String {
    switch self {
    case .items:
      return "Items"
    case .weapon:
      return "Weapons"
    case .armor:
      return "Armors"
    case .talisman:
      return "Talismans"
    }
  }
}
