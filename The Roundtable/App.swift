import SwiftUI
import SharedUI
import Tabbar

@main
struct MainApp: App {
  init() {
    Font.registerFonts()
  }
  
  var body: some Scene {
    WindowGroup {
      Tabbar()
        .preferredColorScheme(.dark)
    }
  }
}
