//
//  ChoseArmorsView.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 05/11/2022.
//

import SwiftUI

struct ChoseArmorsView: View {
    let character: Character
    
    @Environment(\.managedObjectContext) var moc
    
    @Binding var showSheetChoseArmors: Bool
    @State private var selected : UUID?
    @State private var selectedArmorInfo : String?
    @State private var storedAgility = 0
    @State private var storedSpeed = 0
    
    
    var body: some View {
        ScrollView {
            HStack {
                Text("Új vért választása")
                Spacer()
            }
            .headerStyle()
            .padding(.top)
            VStack {
                ForEach(character.armorsArray, id: \.armorId) { item in
                    HStack (alignment: .center, spacing: 0){
                        HStack {
                            if selectedArmorInfo == item.wrappedArmorName {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.orange.opacity(0.6))
                            } else {
                                Image(systemName: "circle")
                                    .foregroundColor(.gray.opacity(0.5))
                            }
                            Text(item.wrappedArmorName)
                        }
                        .onTapGesture {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                if selectedArmorInfo != item.wrappedArmorName {
                                    selectedArmorInfo = item.wrappedArmorName
                                } else {
                                    selectedArmorInfo = nil
                                }
                            }
                        }
                        .titleStyle()
                        Spacer()
                        Button {
                            if selected != item.armorId {
                                selected = item.armorId
                                
                                character.armorId = item.armorId
                                character.armorEquipped = item.wrappedArmorName
                                character.armorMGT = item.armorMGT
                                character.armorSFE = item.armorSFE

                                character.agilityModified = character.agility - item.armorMGT
                                    if character.agilityModified < 5 {
                                        character.agilityModified = 5
                                    }
                                character.speedModified = character.speed - item.armorMGT
                                    if character.speedModified < 5 {
                                        character.speedModified = 5
                                    }
                                
                                character.te -= item.armorMGT * 2
                                character.ve -= item.armorMGT * 2
                            } else if selected == item.armorId {
                                
                                selected = UUID()
                                character.armorEquipped = "Nincs vértezet"
                                character.armorMGT = 0
                                character.armorSFE = 0
                                character.armorId = selected
                                
                                if character.agilityModified == 5 {
                                    character.agility = 5 + item.armorMGT - (5 - (character.agility - item.armorMGT))
                                } else if character.agilityModified > 5 {
                                    character.agility = character.agilityModified + item.armorMGT
                                }
                                if character.speedModified == 5 {
                                    character.speed = 5 + item.armorMGT - (5 - (character.speed - item.armorMGT))
                                } else if character.speedModified > 5 {
                                    character.speed = character.speedModified + item.armorMGT
                                }
                                
                                character.te += item.armorMGT * 2
                                character.ve += item.armorMGT * 2
                            }
                            
                            if moc.hasChanges {
                                try? moc.save()
                            }
                        }label:{
                            Image(systemName: selected == item.armorId ? "checkmark.circle" : "circle")
                                .buttonStyleDisabled(isValid: selected != item.armorId)
                        }
                    }
                    
                    Group {
                        if selectedArmorInfo == item.wrappedArmorName {
                            VStack {
                                ArmorInfoView(armor: item)
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
                    showSheetChoseArmors.toggle()
                } label: {
                    Image(systemName: "arrow.left")
                    .buttonStyleOn()
                }
                Spacer()
            }
            .padding(.horizontal)
        }
        .onAppear{
            selected = character.armorId
        }
    }
    
   
//    func deleteItem(item: Weapon) {
//        character.removeFromWeapons(item)
//        moc.delete(item)
//        try? moc.save()
//    }
    
}

