import SwiftUI
import SharedUI

public struct Tabbar: View {
  @State private var selectedTab: Tabs = .items
  
  public init() {}
  
  public var body: some View {
    TabView(selection: $selectedTab) {
      ForEach(Tabs.allCases) { tab in
        tab.contentView.tabItem {
          Label {
            Text(tab.title.uppercased())
          } icon: {
            Image(systemName: tab.iconName)
          }
        }
      }
    }.accentColor(.edtree)
  }
}

struct Tabbar_Previews: PreviewProvider {
  static var previews: some View {
    Tabbar()
  }
}
