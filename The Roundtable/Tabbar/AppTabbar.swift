import SwiftUI
import SharedUI

struct AppTabbar: View {  
  @State private var selectedTab: Tabs = .items
  
  var body: some View {
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

struct AppTabbar_Previews: PreviewProvider {
  static var previews: some View {
    AppTabbar()
  }
}
