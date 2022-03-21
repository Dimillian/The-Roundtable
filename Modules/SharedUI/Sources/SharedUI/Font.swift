import Foundation
import SwiftUI
import UIKit

extension Font {
  public static func registerFonts() {
    _ = UIFont.registerFont(bundle: .module, fontName: "Mantinia Regular", fontExtension: "otf")
  }
  
  public static func mantinia(size: CGFloat) -> Font {
    return .custom("Mantinia", size: size)
  }
}

extension UIFont {
  public static func mantinia(size: CGFloat) -> UIFont {
    return UIFont(name: "Mantinia", size: size)!
  }
  
  static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) -> Bool {
    guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension) else {
      fatalError("Couldn't find font \(fontName)")
    }
    guard let fontDataProvider = CGDataProvider(url: fontURL as CFURL) else {
      fatalError("Couldn't load data from the font \(fontName)")
    }
    guard let font = CGFont(fontDataProvider) else {
      fatalError("Couldn't create font from data")
    }
    var error: Unmanaged<CFError>?
    return CTFontManagerRegisterGraphicsFont(font, &error)
  }
}
