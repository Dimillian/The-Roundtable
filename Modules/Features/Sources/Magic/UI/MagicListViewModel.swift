import Foundation
import SwiftUI
import ApolloModels
import Networking

@MainActor
class MagicListViewModel: ObservableObject {
  enum Constant {
    static let magicPerPage = 100
  }
  enum State {
    case loading, error, data(magic: [MagicTab: [BaseMagicData]])
  }
  
  @Published var state: State = .loading
  @Published var isLoadingNextPage = false
  @Published var selectedTab: MagicTab = .sorcery
  
  var currentPage = 0
  private var data: [MagicTab: [BaseMagicData]] = [:] {
    didSet {
      self.state = .data(magic: data)
    }
  }
  
  func fetchNextMagic() async {
    let query = GQL.GetMagicQuery(page: currentPage, limit: Constant.magicPerPage)
    do {
      let results = try await GQLClient.shared.fetch(query: query)
      let sorceries = results.sorcery?.compactMap{ $0?.fragments.sorceryData } ?? []
      let incantion = results.incantation?.compactMap{ $0?.fragments.incantationData } ?? []
      let ashOfWar = results.ashOfWar?.compactMap{ $0?.fragments.ashOfWarData } ?? []
      let spirit =  results.spirit?.compactMap{ $0?.fragments.spiritData } ?? []
      if currentPage == 0 {
        data = [.sorcery: sorceries,
                .incantation: incantion,
                .ashOfWar: ashOfWar,
                .spirit: spirit]
      } else {
        var currentData = data
        currentData[.sorcery]?.append(contentsOf: sorceries)
        currentData[.incantation]?.append(contentsOf: incantion)
        currentData[.ashOfWar]?.append(contentsOf: ashOfWar)
        currentData[.spirit]?.append(contentsOf: spirit)
        data = currentData
      }
      currentPage += 1
    } catch {
      state = .error
    }
  }
}
