//
//  TargetInfoView.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 19/11/2022.
//

import SwiftUI

struct TargetInfoView: View {
    let item: Target
    
//    let character: Character
    
//    @EnvironmentObject var equipmentViewModel: EquipmentViewModel
//    @Environment(\.managedObjectContext) var moc
//    @Environment(\.dismiss) var dismiss
    
//    @State private var showAddAlert: Bool = false
    
    
    var body: some View {
        HStack (alignment: .center, spacing: 0){
            Text("\(item.wrappedTargetDesc)")
                .titleInfoStyle()
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .charInfoStyleBg()

        HStack (alignment: .center, spacing: 0){
            Text("Célzó érték módosító: \(item.targetValue) CÉ")
                .titleInfoStyle()
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .charInfoStyleBg()
    }
}

