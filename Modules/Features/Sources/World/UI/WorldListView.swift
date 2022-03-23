import SwiftUI

public struct WorldListView: View {
  public init() { }
  
  public var body: some View {
    List {
      Text("Loading....")
    }
  }
}

struct WorldListView_Previews: PreviewProvider {
  static var previews: some View {
    WorldListView()
  }
}
