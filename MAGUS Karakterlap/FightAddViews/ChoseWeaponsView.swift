//
//  ChoseWeaponsView.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 05/11/2022.
//

import SwiftUI

struct ChoseWeaponsView: View {
//    @StateObject var character = Character()
    let character: Character
//    @FetchRequest(sortDescriptors: [], animation: .default) var weapons: FetchedResults<Weapon>
    
//    @EnvironmentObject var listViewModel: ListViewModel
//    @EnvironmentObject var equipmentViewModel: EquipmentViewModel
    @Environment(\.managedObjectContext) var moc
    
    @Binding var showSheetChoseWeapons: Bool
    @State private var selected : UUID?
    @State private var selected2 : UUID?
    @State private var selectedWeaponInfo : String?
    
    var body: some View {
        ScrollView {
            HStack {
                Text("Új fegyver választása")
                Spacer()
            }
            .headerStyle()
            .padding(.top)
            VStack {
                ForEach(character.weaponsArray, id: \.weaponId) { item in
                    HStack (alignment: .center, spacing: 0){
                        HStack {
                            if selectedWeaponInfo == item.wrappedWeaponName {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.orange.opacity(0.6))
                            } else {
                                Image(systemName: "circle")
                                    .foregroundColor(.gray.opacity(0.5))
                            }
                            Text(item.wrappedWeaponName)
                        }
                        .onTapGesture {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                if selectedWeaponInfo != item.wrappedWeaponName {
                                    selectedWeaponInfo = item.wrappedWeaponName
                                } else {
                                    selectedWeaponInfo = nil
                                }
                            }
                        }
                        .titleStyle()
                        Spacer()
                    
                        Button {
                            if selected != item.weaponId {
                                selected = item.weaponId

                                character.weaponEquipped = item.wrappedWeaponName
                                character.weaponKe = item.weaponKe
                                character.weaponTe = item.weaponTe
                                character.weaponVe = item.weaponVe
                                character.weaponCe = item.weaponCe
                                character.weaponDamage = item.weaponDamage
                                character.weaponDamageShow = item.weaponDamageShow
                                character.weaponAttack = item.weaponAttack
                                character.weaponDistance = item.weaponDistance
                                character.weaponId = item.weaponId

                            } else if selected == item.weaponId {
                                selected = UUID()
                                character.weaponEquipped = "Puszta kéz"
                                character.weaponKe = 0
                                character.weaponTe = 0
                                character.weaponCe = 0
                                character.weaponDamage = 0
                                character.weaponDamageShow = "k3"
                                character.weaponAttack = 1
                                character.weaponDistance = 0
                                character.weaponId = selected
                            }

                            if moc.hasChanges {
                                try? moc.save()
                            }
                        }label:{
                            if selected == item.weaponId {
                                Image(systemName: "1.circle")
                                    .buttonStyleDisabled(isValid: selected != item.weaponId)
                            } else if selected2 == item.weapon2Id {
                                Image(systemName: "2.circle")
                                    .buttonStyleDisabled(isValid: selected2 != item.weapon2Id)
                            } else {
                                Image(systemName: "circle")
                                    .buttonStyleOn()
                            }
                        }
                        .disabled(selected2 == item.weapon2Id)
                    }
                    
                    Group {
                        if selectedWeaponInfo == item.wrappedWeaponName {
                            VStack {
                                if item.wrappedWeaponName.contains("pajzs") {
                                    WeaponShieldInfoView(weapon: item)
                                } else {
                                    WeaponInfoView(weapon: item)
                                }
                            }
                            .padding(.leading)
                            .padding(.bottom)
                        }
                    }
                }
            }
            .charInfoStyleBg()
            
            HStack {
                Button {
                    showSheetChoseWeapons.toggle()
                } label: {
                    Image(systemName: "arrow.left")
                    .buttonStyleOn()
                }
                Spacer()
            }
            .padding(.horizontal)
        }
        .onAppear{
            selected = character.weaponId
            selected2 = character.weapon2Id
        }
    }
    
    func deleteItem(item: Weapon) {
        character.removeFromWeapons(item)
        moc.delete(item)
        try? moc.save()
    }
    
}

