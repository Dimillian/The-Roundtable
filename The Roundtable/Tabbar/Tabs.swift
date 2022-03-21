import SwiftUI
import Items

enum Tabs: Int, CaseIterable, Identifiable {
  case items, equipments, magic, locations, notes
  
  var id: Int {
    self.rawValue
  }
  
  @ViewBuilder
  var contentView: some View {
    switch self {
    case .items:
      ItemsListView()
    case .equipments:
      Color.red
    case .magic:
      Color.blue
    case .locations:
      Color.brown
    case .notes:
      Color.cyan
    }
  }
  
  var title: String {
    switch self {
    case .items:
      return "Items"
    case .equipments:
      return "Equipments"
    case .magic:
      return "Magic"
    case .locations:
      return "Locations"
    case .notes:
      return "Notes"
    }
  }
  
  var iconName: String {
    switch self {
    case .items:
      return "bag"
    case .equipments:
      return "person"
    case .magic:
      return "wand.and.stars"
    case .locations:
      return "map"
    case .notes:
      return "note.text"
    }
  }
}
