//
//  ModifierInfoView.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 19/11/2022.
//

import SwiftUI

struct ModifierInfoView: View {
    let item: Modifier
    
//    let character: Character
    
//    @EnvironmentObject var equipmentViewModel: EquipmentViewModel
//    @Environment(\.managedObjectContext) var moc
//    @Environment(\.dismiss) var dismiss
    
//    @State private var showAddAlert: Bool = false
    
    
    var body: some View {
        HStack (alignment: .center, spacing: 0){
            Text("\(item.wrappedModifierDescription)")
                .titleInfoStyle()
        }
        .frame(maxWidth: .infinity)
        .charInfoStyleBg()

        VStack (alignment: .trailing, spacing: 4){
            LazyVGrid (
                columns: [

                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible())

                ]
            ){

                Text("KÉ")

                Text("TÉ")

                Text("VÉ")

                Text("CÉ")

            }
            .font(.system(size: 12).smallCaps().weight(.light))

            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 0.5, alignment: .center)
                .foregroundColor(Color.primary.opacity(0.2))

            LazyVGrid (
                columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ]
            ){

                Text("\(item.modifierKe)")

                Text("\(item.modifierTe)")

                Text("\(item.modifierVe)")

                Text("\(item.modifierCe)")

            }
            .font(.system(size: 14).smallCaps().weight(.light))
        }
        .padding(.horizontal)
        .padding(.vertical, 5)
        .charInfoStyleBg()
    }
}

