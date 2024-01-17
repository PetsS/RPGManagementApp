//
//  WeaponShieldInfoView.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 19/11/2022.
//

import SwiftUI

struct WeaponShieldInfoView: View {
    let weapon: Weapon
    
    var body: some View {
            HStack (alignment: .center, spacing: 0){
                Text("\(weapon.wrappedWeaponDescription)")
                    .titleInfoStyle()
                }
                .frame(maxWidth: .infinity)
                .charInfoStyleBg()
            
            VStack (alignment: .trailing, spacing: 4){
                LazyVGrid (
                    columns: [
                        GridItem(.flexible(minimum: 50)),
                        GridItem(.flexible()),
                        GridItem(.flexible()),
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ]
                ){
                    Text("Seb")
                    
                    Text("KÉ")
                    
                    Text("MGT")
                    
                    Text("VÉ")
                    
                    Text("T/k")
                }
                .font(.system(size: 12).smallCaps().weight(.light))
                
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 0.5, alignment: .center)
                    .foregroundColor(Color.primary.opacity(0.2))
                
                LazyVGrid (
                    columns: [
                        GridItem(.flexible(minimum: 50)),
                        GridItem(.flexible()),
                        GridItem(.flexible()),
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ]
                ){
                    
                    Text("\(weapon.wrappedWeaponDamageShow)")
                    
                    Text("\(weapon.weaponKe)")
                    
                    Text("\(weapon.weaponMGT)")
                    
                    Text("\(weapon.weaponVe)")
                    
                    Text("\(weapon.weaponAttack)")
                    
                }
                .font(.system(size: 14).smallCaps().weight(.light))
            }
            .padding(.horizontal)
            .padding(.vertical, 5)
            .charInfoStyleBg()
    }
}

