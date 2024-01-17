//
//  AddArmorsView.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 06/11/2022.
//

import SwiftUI

struct AddArmorsView: View {
    let character: Character
    
    @EnvironmentObject var equipmentViewModel: EquipmentViewModel
    @Environment(\.managedObjectContext) var moc
    
    @FocusState private var keyboardIsFocused: Bool
    
    @Binding var showSheetAddArmors: Bool
    
    @State private var selectedArmorInfo : String?
    @State private var showAddAlert: Bool = false
    
    var body: some View {
        ScrollView {
            
            HStack {
                Text("Teljesvértek")
                    .headerStyle()
                Spacer()
            }
            
            VStack (alignment: .leading, spacing: 0){
                ForEach(Array(equipmentViewModel.armorData.armorCat1.enumerated()), id: \.offset) { index, item in
                    HStack {
                        HStack {
                            if selectedArmorInfo == item.name {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.orange.opacity(0.6))
                            } else {
                                Image(systemName: "circle")
                                    .foregroundColor(.gray.opacity(0.5))
                            }
                            Text(item.name)
                        }
                        .titleStyle()
                        .onTapGesture {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                if selectedArmorInfo != item.name {
                                    selectedArmorInfo = item.name
                                } else {
                                    selectedArmorInfo = nil
                                }
                            }
                        }
                        Spacer()
                        
                        Button{
                            equipmentViewModel.armorData.armorName = item.name
                            equipmentViewModel.armorData.armorType = item.type
                            equipmentViewModel.armorData.armorMGT = item.mgt
                            equipmentViewModel.armorData.armorSFE = item.sfe
                            equipmentViewModel.armorData.armorDescription = item.desc
                            
                            saveMoc()
                            showAddAlert = true
                        }label: {
                            Image(systemName: "plus")
                                .buttonStyleDisabled(isValid: !character.armorsArray.contains(where: { $0.wrappedArmorName == item.name }))
                        }
                        .disabled(character.armorsArray.contains(where: { $0.wrappedArmorName == item.name }))
                        
                    }
                    .charInfoStyleBg()
                    .alert("\(equipmentViewModel.armorData.armorName) hozzáadva!", isPresented: $showAddAlert){
                        Button("OK") {
                            showSheetAddArmors.toggle()
                        }
                    }
                    
                    Group {
                        if selectedArmorInfo == item.name {
                            VStack {
                                HStack (alignment: .center, spacing: 0){
                                    Text("\(item.desc)")
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

                                        Text("\(item.type)")

                                        Text("\(item.mgt)")

                                        Text("\(item.sfe)")

                                    }
                                    .font(.system(size: 14).smallCaps().weight(.light))
                                }
                                .padding(.horizontal)
                                .padding(.vertical, 5)
                                .charInfoStyleBg()
                            }
                            .padding(.leading)
                            .padding(.bottom)
                        }
                    }
                }
            }
            Spacer()
        }
        .padding(.top)
        
        //bottom bar
        HStack {
            Button {
                showSheetAddArmors.toggle()
            } label: {
                Image(systemName: "arrow.left")
                    .buttonStyleOn()
            }
            Spacer()
            Text("Vért hozzáadása")
                .titleStyle()
            Spacer()
            Button {
                
            } label: {
                Text("OK")
                    .buttonStyleOn()
            }
            .opacity(0)
            
        }
        .padding()
    }
    
    func saveMoc() {
        let addArmor = Armor(context: moc)
        addArmor.armorId = UUID()
        addArmor.armorName = equipmentViewModel.armorData.armorName
        addArmor.armorSFE = Int16(equipmentViewModel.armorData.armorSFE)
        addArmor.armorMGT = Int16(equipmentViewModel.armorData.armorMGT)
        addArmor.armorDescription = equipmentViewModel.armorData.armorDescription
        addArmor.armorType = equipmentViewModel.armorData.armorType
        
        character.addToArmors(addArmor)
        
        if moc.hasChanges {
            try? moc.save()
        }
    }
}
//struct AddWeaponsView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddWeaponsView()
//    }
//}

