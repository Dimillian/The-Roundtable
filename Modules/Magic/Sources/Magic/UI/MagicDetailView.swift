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
      SharedSection(title: "Description", content: magic.description ?? "")
      if let magic = magic as? SpellData {
        SharedSection(title: "Cost", content: "\(magic.cost ?? 0) FP")
        SharedSection(title: "Slots", content: "\(magic.slots ?? 0)")
        if let effect = magic.effects {
          SharedSection(title: "Effects", content: effect)
        }
        if let requiered = magic.requieredData {
          AttributeDataSection(title: "Requiere", data: requiered)
        }
      }
      if let magic = magic as? AshOfWarData {
        SharedSection(title: "Affinity", content: magic.affinity ?? "")
        SharedSection(title: "Skill", content: magic.skill ?? "")
      }
      if let magic = magic as? SpriritData {
        SharedSection(title: "Effect", content: magic.effect ?? "")
        if let hPCost = magic.hpCost, Int(hPCost)! > 0 {
          SharedSection(title: "HP Cost", content: hPCost)
        }
        if let fpCost = magic.fpCost, Int(fpCost)! > 0 {
          SharedSection(title: "FP Cost", content: fpCost)
        }
      }
    }
    .listStyle(.insetGrouped)
    .navigationTitle(magic.name?.uppercased() ?? "")
  }
}
