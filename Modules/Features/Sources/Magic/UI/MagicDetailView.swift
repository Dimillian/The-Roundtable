import SwiftUI
import ApolloModels
import Kingfisher
import SharedUI

struct MagicDetailView: View {
  let magic: BaseMagicData
  
  init(magic: BaseMagicData) {
    self.magic = magic
  }
  
  var body: some View {
    List {
      HStack {
        Spacer()
        KFImage(URL(string: magic.image ?? ""))
          .resizable()
          .frame(width: 150, height: 150)
        Spacer()
      }
      .listRowBackground(Color.black)
      SimpleSection(title: "Description", content: magic.description ?? "")
      if let magic = magic as? SpellData {
        SimpleSection(title: "Cost", content: "\(magic.cost ?? 0) FP")
        SimpleSection(title: "Slots", content: "\(magic.slots ?? 0)")
        if let effect = magic.effects {
          SimpleSection(title: "Effects", content: effect)
        }
        if let requiered = magic.requieredData {
          AttributeDataSection(title: "Requiere", data: requiered)
        }
      }
      if let magic = magic as? AshOfWarData {
        SimpleSection(title: "Affinity", content: magic.affinity ?? "")
        SimpleSection(title: "Skill", content: magic.skill ?? "")
      }
      if let magic = magic as? SpriritData {
        SimpleSection(title: "Effect", content: magic.effect ?? "")
        if let hPCost = magic.hpCost, Int(hPCost)! > 0 {
          SimpleSection(title: "HP Cost", content: hPCost)
        }
        if let fpCost = magic.fpCost, Int(fpCost)! > 0 {
          SimpleSection(title: "FP Cost", content: fpCost)
        }
      }
    }
    .listStyle(.insetGrouped)
    .navigationTitle(magic.name?.uppercased() ?? "")
  }
}
