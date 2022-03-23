import SwiftUI
import SharedUI
import Tabbar

@main
struct MainApp: App {
  init() {
    Font.registerFonts()
    setupAppearance()
  }
  
  var body: some Scene {
    WindowGroup {
      Tabbar()
        .preferredColorScheme(.dark)
    }
  }
  
  private func setupAppearance() {
     UITabBarItem
       .appearance()
       .setTitleTextAttributes([.font: UIFont.mantinia(size: 11)],for: .normal)
     UITabBar
       .appearance()
       .barTintColor = UIColor(.sky)
     UINavigationBar.appearance().largeTitleTextAttributes = [.font: UIFont.mantinia(size: 24),
                                                              .foregroundColor: UIColor.white]
     UINavigationBar.appearance().titleTextAttributes = [.font: UIFont.mantinia(size: 16),
                                                         .foregroundColor: UIColor.white]
     UINavigationBar.appearance().barTintColor = UIColor(.sky)
   }
}
