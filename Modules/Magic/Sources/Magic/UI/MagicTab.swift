import Foundation

enum MagicTab: Int, Identifiable, CaseIterable, Equatable {
  case sorcery, incantation, ashOfWar, spirit
  
  var id: Int {
    rawValue
  }
  
  var title: String {
    switch self {
    case .sorcery:
      return "Sorcery"
    case .incantation:
      return "Incantation"
    case .ashOfWar:
      return "Ash of War"
    case .spirit:
      return "Spirit"
    }
  }
}
