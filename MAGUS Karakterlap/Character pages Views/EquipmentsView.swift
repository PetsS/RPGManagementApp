//
//  EquipmentsView.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 05/11/2022.
//

import SwiftUI

//extension Int: Identifiable {
//    public var id: Int { self }
//}

struct EquipmentsView: View {
    @StateObject var character = Character()
    
    @Environment(\.managedObjectContext) var moc
    
    @State private var selected : UUID?
    
    @FocusState private var keyboardIsFocused: Bool

    @State private var selectedWeaponInfo : String?
    @State private var selectedEquipmentInfo : String?
    @State private var selectedArmorInfo : String?
    @State private var showSheetAddWeapons = false
    @State private var showSheetAddEquipments = false
    @State private var showSheetAddArmors = false
    @State private var showSheetEditEquipmentItem = false
    @State private var showSheetNotes = false
    @State private var toBeDeleted = false
    @State private var addNotes = ""
    
    var body: some View {
        ScrollView {
            Group{
                HStack {
                    Text("Fegyverlista")
                    Spacer()
                }
                .headerStyle()
                .padding(.top, 8)
                
                if !character.weaponsArray.isEmpty {
                    VStack {
                        ForEach(character.weaponsArray, id: \.weaponId) { item in
                            HStack (alignment: .center, spacing: 0) {
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
                                        toBeDeleted = false
                                        if selectedWeaponInfo != item.wrappedWeaponName {
                                            selectedWeaponInfo = item.wrappedWeaponName
                                        } else {
                                            selectedWeaponInfo = nil
                                        }
                                    }
                                }
                                Spacer()
                                
                                if selectedWeaponInfo == item.wrappedWeaponName {
                                    Button{
                                        withAnimation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 1)){
                                            if toBeDeleted != true {
                                                toBeDeleted = true
                                            } else {
                                                toBeDeleted = false
                                            }
                                        }
                                    }label: {
                                        Image(systemName: "trash")
                                            .foregroundColor(.primary)
                                    }
                                }
                            }
                            .padding(.vertical, 1)
                            
                            Group {
                                if selectedWeaponInfo == item.wrappedWeaponName {
                                    VStack {
                                        if toBeDeleted {
                                            HStack {
                                                Text("Törlés?")
                                                    .titleStyle()
                                                Spacer()
                                                Button{
                                                    withAnimation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 1)){
                                                        toBeDeleted = false
                                                    }
                                                }label:{
                                                    Image(systemName: "x.circle")
                                                        .titleStyle()
                                                }
                                                Button{
                                                    withAnimation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 1)){
                                                        deleteWeaponItem(item: item)
                                                    }
                                                }label:{
                                                    Image(systemName: "checkmark.circle")
                                                        .titleStyle()
                                                }
                                            }
                                            .frame(maxWidth: .infinity)
                                            .background(.red)
                                            .charInfoStyleBg()
                                        }
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
                    .titleStyle()
                    .charInfoStyleBg()
                }
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 0.5, alignment: .center)
                    .foregroundColor(Color.primary.opacity(0.2))
                    .padding(.horizontal)
                HStack {
                    Button {
                        showSheetAddWeapons.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .buttonStyleOn()
                    }
                    .sheet(isPresented: $showSheetAddWeapons) {
                        AddWeaponsView(character: character, showSheetAddWeapons: $showSheetAddWeapons)
                    }
                    Text("Új fegyver hozzáadása")
                        .font(.system(size: 14).smallCaps().weight(.light))
                        .padding(.horizontal, 4)
                    Spacer()
                }
                .charInfoStyleBg()
            }
            
            Image(systemName: "circle.grid.cross.left.filled")
                .padding()
                .foregroundColor(.gray)
            
            Group {
                HStack {
                    Text("Vértezetek")
                    Spacer()
                }
                .headerStyle()
                .padding(.top, 8)
            
                if !character.armorsArray.isEmpty {
                    VStack {
                        ForEach(character.armorsArray, id: \.armorId) { item in
                            HStack (alignment: .center, spacing: 0) {
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
                                        toBeDeleted = false
                                        if selectedArmorInfo != item.wrappedArmorName {
                                            selectedArmorInfo = item.wrappedArmorName
                                        } else {
                                            selectedArmorInfo = nil
                                        }
                                    }
                                }
                                Spacer()

                                if selectedArmorInfo == item.wrappedArmorName {
                                    Button{
                                        withAnimation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 1)){
                                            if toBeDeleted != true {
                                                toBeDeleted = true
                                            } else {
                                                toBeDeleted = false
                                            }
                                        }
                                    }label: {
                                        Image(systemName: "trash")
                                            .foregroundColor(.primary)
                                    }
                                }
                            }
                            .padding(.vertical, 1)

                            Group {
                                if selectedArmorInfo == item.wrappedArmorName {
                                    VStack {
                                        if toBeDeleted {
                                            HStack {
                                                Text("Törlés?")
                                                    .titleStyle()
                                                Spacer()
                                                Button{
                                                    withAnimation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 1)){
                                                        toBeDeleted = false
                                                    }
                                                }label:{
                                                    Image(systemName: "x.circle")
                                                        .titleStyle()
                                                }
                                                Button{
                                                    withAnimation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 1)){
                                                        deleteArmorItem(item: item)
                                                        toBeDeleted = false
                                                        selectedArmorInfo = nil
                                                    }
                                                }label:{
                                                    Image(systemName: "checkmark.circle")
                                                        .titleStyle()
                                                }
                                            }
                                            .frame(maxWidth: .infinity)
                                            .background(.red)
                                            .charInfoStyleBg()
                                        }
                                        ArmorInfoView(armor: item)
                                    }
                                    .padding(.leading)
                                    .padding(.bottom)
                                }
                            }
                        }
                    }
                    .titleStyle()
                    .charInfoStyleBg()
                }
            }
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 0.5, alignment: .center)
                .foregroundColor(Color.primary.opacity(0.2))
                .padding(.horizontal)
            HStack {
                Button {
                    showSheetAddArmors.toggle()
                } label: {
                    Image(systemName: "plus")
                    .buttonStyleOn()
                }
                .sheet(isPresented: $showSheetAddArmors) {
                    AddArmorsView(character: character, showSheetAddArmors: $showSheetAddArmors)
                }
                Text("Új vért hozzáadása")
                    .font(.system(size: 14).smallCaps().weight(.light))
                    .padding(.horizontal, 4)
                Spacer()
            }
            .charInfoStyleBg()
            
            Image(systemName: "circle.grid.cross.up.filled")
                .padding()
                .foregroundColor(.gray)
            
            Group {
                HStack {
                    Text("Felszerelés")
                    Spacer()
                }
                .headerStyle()
                if !character.equipmentsArray.isEmpty {
                    VStack {
                        ForEach(character.equipmentsArray, id: \.self) { item in
                            HStack (alignment: .center, spacing: 0) {
                                HStack {
                                    if selectedEquipmentInfo == item.equipmentName {
                                        Image(systemName: "circle.fill")
                                            .foregroundColor(.orange.opacity(0.6))
                                    } else {
                                        Image(systemName: "circle")
                                            .foregroundColor(.gray.opacity(0.5))
                                    }
                                    Text(item.wrappedEquipmentName)
                                    Text("(\(item.equipmentQty))")
                                }
                                .onTapGesture {
                                    withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                        toBeDeleted = false
                                        if selectedEquipmentInfo != item.equipmentName {
                                            selectedEquipmentInfo = item.equipmentName
                                        } else {
                                            selectedEquipmentInfo = nil
                                        }
                                    }
                                }
                                Spacer()
                                
                                if selectedEquipmentInfo == item.equipmentName {
                                    Button{
                                        withAnimation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 1)){
                                            if toBeDeleted != true {
                                                toBeDeleted = true
                                            } else {
                                                toBeDeleted = false
                                            }
                                        }
                                    }label: {
                                        Image(systemName: "trash")
                                            .foregroundColor(.primary)
                                    }
                                }
                            }
                            .padding(.vertical, 1)
                            
                            Group {
                                if selectedEquipmentInfo == item.equipmentName {
                                    VStack (alignment: .leading, spacing: 0) {
                                        if toBeDeleted {
                                            HStack {
                                                Text("Törlés?")
                                                    .titleStyle()
                                                Spacer()
                                                Button{
                                                    withAnimation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 1)){
                                                        toBeDeleted = false
                                                    }
                                                }label:{
                                                    Image(systemName: "x.circle")
                                                        .titleStyle()
                                                }
                                                Button{
                                                    withAnimation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 1)){
                                                        deleteEquipmentItem(item: item)
                                                    }
                                                }label:{
                                                    Image(systemName: "checkmark.circle")
                                                        .titleStyle()
                                                }
                                            }
                                            .frame(maxWidth: .infinity)
                                            .background(.red)
                                            .charInfoStyleBg()
                                        }
                                        
                                        VStack (alignment: .leading, spacing: 0){
                                            HStack {
                                                Text(item.wrappedEquipmentDesc)
                                                    .titleInfoStyle()
                                            }
                                            
                                            if item.wrappedEquipmentComm > "" {
                                                
                                                Rectangle()
                                                    .frame(maxWidth: .infinity, maxHeight: 0.5, alignment: .center)
                                                    .foregroundColor(Color.primary.opacity(0.2))
                                                    .padding(.horizontal)
                                                
                                                HStack {
                                                    Text(item.wrappedEquipmentComm)
                                                        .titleInfoStyle()
                                                }
                                            }
                                        }
                                        .frame(maxWidth: .infinity)
                                        .charInfoStyleBg()
                                        
                                        HStack {
                                            Text("Db: \(item.equipmentQty)")
                                                .titleInfoStyle()
                                            Spacer()
                                            Button{
                                                showSheetEditEquipmentItem = true
                                            }label:{
                                                Image(systemName: "square.and.pencil")
                                                    .buttonStyleOn()
                                            }
                                            .sheet(isPresented: $showSheetEditEquipmentItem) {
                                                EditEquipmentItemView(equipment: item, showSheetEditEquipmentItem: $showSheetEditEquipmentItem)
                                            }
                                        }
                                        .charInfoStyleBg()
                                        
                                    }
                                    .padding(.leading)
                                    .padding(.bottom)
                                    
                                }
                            }
                        }
                    }
                    .titleStyle()
                    .charInfoStyleBg()
                }
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 0.5, alignment: .center)
                    .foregroundColor(Color.primary.opacity(0.2))
                    .padding(.horizontal)
                HStack {
                    Button {
                        showSheetAddEquipments.toggle()
                    } label: {
                        Image(systemName: "plus")
                        .buttonStyleOn()
                    }
                    .sheet(isPresented: $showSheetAddEquipments) {
                        AddEquipmentsView(character: character, showSheetAddEquipments: $showSheetAddEquipments)
                    }
                    Text("Új felszerelés hozzáadása")
                        .font(.system(size: 14).smallCaps().weight(.light))
                        .padding(.horizontal, 4)
                    Spacer()
                }
                .charInfoStyleBg()
            }
            
            Group {
                Image(systemName: "circle.grid.cross.right.filled")
                    .padding()
                    .foregroundColor(.gray)

                HStack {
                    Text("Jegyzetek")
                    Spacer()
                }
                .headerStyle()
                VStack (alignment: .leading) {
                    HStack {
                        Text(character.wrappedNotes.count == 0 ? "ÚJ jegyzet..." : "Ezt írtad...")
                            .foregroundColor(.gray.opacity(0.6))
                            .titleInfoStyle()
                        Spacer()
                        Button{
                            addNotes = character.wrappedNotes
                            showSheetNotes = true
                        }label:{
                            Image(systemName: character.wrappedNotes.count == 0 ? "plus": "square.and.pencil")
                                .buttonStyleOn()
                        }
                        .sheet(isPresented: $showSheetNotes) {
                            AddNotesView(character: character, showSheetNotes: $showSheetNotes, addNotes: $addNotes)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    if character.wrappedNotes.count != 0 {
                        Text(character.wrappedNotes)
                            .titleInfoStyle()
                            .padding(.bottom)
                    }
                }
                .charInfoStyleBg()
            }
            Spacer()
        }
    }
    
    func deleteWeaponItem(item: Weapon) {
        character.removeFromWeapons(item)
        moc.delete(item)
        try? moc.save()
    }
    
    func deleteEquipmentItem(item: Equipment) {
        character.removeFromEquipments(item)
        moc.delete(item)
        try? moc.save()
    }
    
    func deleteArmorItem(item: Armor) {
        character.removeFromArmors(item)
        moc.delete(item)
        try? moc.save()
    }
    
}

//struct EquipmentsView_Previews: PreviewProvider {
//    static var previews: some View {
//        EquipmentsView()
//    }
//}
