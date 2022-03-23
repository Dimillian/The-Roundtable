import SwiftUI
import Items
import Magic
import World

enum Tabs: Int, CaseIterable, Identifiable {
  case items, magic, world, locations, notes
  
  var id: Int {
    self.rawValue
  }
  
  @ViewBuilder
  var contentView: some View {
    switch self {
    case .items:
      ItemsListView()
    case .magic:
      MagicListView()
    case .world:
      WorldListView()
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
    case .magic:
      return "Magic"
    case .world:
      return "World"
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
    case .magic:
      return "wand.and.stars"
    case .world:
      return "globe.europe.africa"
    case .locations:
      return "map"
    case .notes:
      return "note.text"
    }
  }
}
