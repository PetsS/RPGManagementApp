//
//  ArmorInfoView.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 19/11/2022.
//

import SwiftUI

struct ArmorInfoView: View {
    let armor: Armor
    
    var body: some View {
            HStack (alignment: .center, spacing: 0){
                Text("\(armor.wrappedArmorDescription)")
                    .titleInfoStyle()
                }
                .frame(maxWidth: .infinity)
                .charInfoStyleBg()
            
            VStack (alignment: .trailing, spacing: 4){
                LazyVGrid (
                    columns: [
                        GridItem(.flexible(minimum: 180)),
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ]
                ){
                    Text("Típus")
                    
                    Text("MGT")
                    
                    Text("SFE")
                }
                .font(.system(size: 12).smallCaps().weight(.light))
                
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 0.5, alignment: .center)
                    .foregroundColor(Color.primary.opacity(0.2))
                
                LazyVGrid (
                    columns: [
                        GridItem(.flexible(minimum: 180)),
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ]
                ){
                    
                    Text("\(armor.wrappedArmorType)")
                    
                    Text("\(armor.armorMGT)")
                    
                    Text("\(armor.armorSFE)")                    
                }
                .font(.system(size: 14).smallCaps().weight(.light))
            }
            .padding(.horizontal)
            .padding(.vertical, 5)
            .charInfoStyleBg()
    }
}

