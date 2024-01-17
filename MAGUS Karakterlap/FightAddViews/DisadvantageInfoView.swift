//
//  DisadvantageInfoView.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 19/11/2022.
//

import SwiftUI

struct DisadvantageInfoView: View {
    let item: Disadvantage
    
    @Binding var selectDisadvantage: Bool
    
//    let character: Character
    
//    @EnvironmentObject var equipmentViewModel: EquipmentViewModel
//    @Environment(\.managedObjectContext) var moc
//    @Environment(\.dismiss) var dismiss
    
//    @State private var showAddAlert: Bool = false
    
    
    var body: some View {
        VStack{
            HStack (alignment: .center, spacing: 0){
                Text("Harcérték csökkenés:")
                    .headerStyle()
                Spacer()
            }
            HStack{
                Button{
                    selectDisadvantage = false
                }label:{
                    Text("\(item.disadvantage)")
                        .buttonStyleDisabled(isValid: selectDisadvantage == true)
                }
                .disabled(selectDisadvantage == false)
                Text("TÉ,")
                    .titleInfoStyle()
                Spacer()
                Button{
                    selectDisadvantage = true
                }label:{
                    Text("\(item.disadvantage)")
                        .buttonStyleDisabled(isValid: selectDisadvantage == false)
                }
                .disabled(selectDisadvantage == true)
                Text("VÉ")
                    .titleInfoStyle()
            }
            .frame(maxWidth: .infinity)
            .charInfoStyleBg()
        }
    }
}

