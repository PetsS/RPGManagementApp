//
//  AddEquipmentsView.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 06/11/2022.
//

import SwiftUI

struct AddEquipmentsView: View {
    let character: Character
    
    @EnvironmentObject var equipmentViewModel: EquipmentViewModel
    @Environment(\.managedObjectContext) var moc
    
    @FocusState private var keyboardIsFocused: Bool
    
    @Binding var showSheetAddEquipments: Bool
    
    @State private var selectedEquipmentInfo : String?
    @State private var showAddAlert: Bool = false
    @State private var addQty = 1
    @State private var addComm = ""
    
//    @State private var addCustomWeaponName = ""
//    @State private var addCustomWeaponDamage = ""
//    @State private var addMultiplier = 1
//    @State private var addDie = "k3"
//    @State private var addNumber = 0
//    @State private var addKe = 0
//    @State private var addTe = 0
//    @State private var addVe = 0
//    @State private var addCe = 0
//    @State private var addAtk = 1
//    @State private var addDist = 0
//    @State private var addDesc = ""
//    @State private var customWeaponNameOkPressed = false
//    @State private var customWeaponDamageOkPressed = false
//    @State private var keOkPressed = false
//    @State private var teOkPressed = false
//    @State private var veOkPressed = false
//    @State private var ceOkPressed = false
//    @State private var atkOkPressed = false
//    @State private var distOkPressed = false
//    @State private var descOkPressed = false
//
//    let customDamageList = ["k3", "k6", "k10"]
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("Új Felszerelés hozzáadása")
                        .headerStyle()
                    Spacer()
                }
//                Group {
//                    HStack {
//                        TextField("Felszerelés név...", text: $addCustomWeaponName)
//                            .onChange(of: addCustomWeaponName) { newValue in
//                                addCustomWeaponName = String(newValue.prefix(18))
//                            }
//                            .focused($keyboardIsFocused)
//                            .onSubmit {
//                                keyboardIsFocused = false
//                            }
//                            .titleStyle()
//                        Button() {
//                                keyboardIsFocused = false
//                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
//                                customWeaponNameOkPressed = true
//                            }
//                        } label: {
//                            Text("OK")
//                                .buttonStyleDisabled(isValid: addCustomWeaponName != "")
//                        }
//                        .disabled(addCustomWeaponName == "" )
//                    }
//                    .charInfoStyleBg()
//
//                    if customWeaponNameOkPressed && addCustomWeaponName != "" {
//                        HStack {
//                            Text("Sebzés")
//                                .titleStyle()
//                                .frame(maxWidth: 85)
//                            Spacer()
//
//                            HStack {
//                                Picker("Multiplier", selection: $addMultiplier) {
//                                    ForEach(1...6, id: \.self) {
//                                        Text("\($0)").tag($0)
//                                    }
//                                }
//                                .frame(maxWidth: 20)
//                                Text("*")
//                                    .padding(.horizontal)
//                                Picker("Die", selection: $addDie) {
//                                    ForEach(customDamageList, id: \.self) {
//                                        Text($0)
//                                    }
//                                }
//                                .frame(maxWidth: 20)
//                                Text("+")
//                                    .padding(.horizontal)
//                                Picker("Number", selection: $addNumber) {
//                                    ForEach(0...10, id: \.self) {
//                                        Text("\($0)").tag($0)
//                                    }
//                                }
//                                .frame(maxWidth: 20)
//                            }
//
//                            Spacer()
//                            Button {
//                                addCustomWeaponDamage = (addMultiplier > 1 ? String(addMultiplier) : "") + addDie + (addNumber == 0 ? "" : ("+" + String(addNumber)))
//                                withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
//                                    customWeaponDamageOkPressed = true
//                                }
//                            } label: {
//                                Text("OK")
//                                    .buttonStyleOn()
//                            }
//                        }
//                        .charInfoStyleBg()
//
//                    }
//
//                    if customWeaponDamageOkPressed && addCustomWeaponName != "" {
//                        HStack {
//                            Text("KÉ")
//                                .titleStyle()
//                            Spacer()
//                            TextField("KÉ", value: $addKe, format: .number)
//                                .frame(maxHeight: .infinity)
//                                .padding(.horizontal, 10)
//                                .background(addKe == 0 ? Color.red.opacity(0.6) : Color.primary)
//                                .cornerRadius(6)
//                                .frame(maxWidth: 50)
//                                .focused($keyboardIsFocused)
//                                .keyboardType(.numberPad)
//                                .padding(.horizontal, 8)
//                            Button {
//                                withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
//                                    keOkPressed = true
//                                }
//                                keyboardIsFocused = false
//                            } label: {
//                                Text("OK")
//                                    .buttonStyleOn()
//                            }
//                        }
//                        .charInfoStyleBg()
//                    }
//
//                    if keOkPressed && addCustomWeaponName != "" {
//                        HStack {
//                            Text("TÉ")
//                                .titleStyle()
//                            Spacer()
//                            TextField("TÉ", value: $addTe, format: .number)
//                                .frame(maxHeight: .infinity)
//                                .padding(.horizontal, 10)
//                                .background(addTe == 0 ? Color.red.opacity(0.6) : Color.primary)
//                                .cornerRadius(6)
//                                .frame(maxWidth: 50)
//                                .focused($keyboardIsFocused)
//                                .keyboardType(.numberPad)
//                                .padding(.horizontal, 8)
//                            Button {
//                                withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
//                                    teOkPressed = true
//                                }
//                                keyboardIsFocused = false
//                            } label: {
//                                Text("OK")
//                                    .buttonStyleOn()
//                            }
//                        }
//                        .charInfoStyleBg()
//                    }
//
//                    if teOkPressed && addCustomWeaponName != "" {
//                        HStack {
//                            Text("VÉ")
//                                .titleStyle()
//                            Spacer()
//                            TextField("VÉ", value: $addVe, format: .number)
//                                .frame(maxHeight: .infinity)
//                                .padding(.horizontal, 10)
//                                .background(addVe == 0 ? Color.red.opacity(0.6) : Color.primary)
//                                .cornerRadius(6)
//                                .frame(maxWidth: 50)
//                                .focused($keyboardIsFocused)
//                                .keyboardType(.numberPad)
//                                .padding(.horizontal, 8)
//                            Button {
//                                withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
//                                    veOkPressed = true
//                                }
//                                keyboardIsFocused = false
//                            } label: {
//                                Text("OK")
//                                    .buttonStyleOn()
//                            }
//                        }
//                        .charInfoStyleBg()
//                    }
//
//                    if veOkPressed && addCustomWeaponName != "" {
//                        HStack {
//                            Text("CÉ")
//                                .titleStyle()
//                            Spacer()
//                            TextField("CÉ", value: $addCe, format: .number)
//                                .frame(maxHeight: .infinity)
//                                .padding(.horizontal, 10)
//                                .background(addCe == 0 ? Color.red.opacity(0.6) : Color.primary)
//                                .cornerRadius(6)
//                                .frame(maxWidth: 50)
//                                .focused($keyboardIsFocused)
//                                .keyboardType(.numberPad)
//                                .padding(.horizontal, 8)
//                            Button {
//                                withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
//                                    ceOkPressed = true
//                                }
//                                keyboardIsFocused = false
//                            } label: {
//                                Text("OK")
//                                    .buttonStyleOn()
//                            }
//                        }
//                        .charInfoStyleBg()
//                    }
//
//                    if ceOkPressed && addCustomWeaponName != "" {
//                        HStack {
//                            Text("Tám/Kör")
//                                .titleStyle()
//                            Spacer()
//                            TextField("Tám", value: $addAtk, format: .number)
//                                .frame(maxHeight: .infinity)
//                                .padding(.horizontal, 10)
//                                .background(addAtk == 0 ? Color.red.opacity(0.6) : Color.primary)
//                                .cornerRadius(6)
//                                .frame(maxWidth: 50)
//                                .focused($keyboardIsFocused)
//                                .keyboardType(.numberPad)
//                                .padding(.horizontal, 8)
//                            Button {
//                                withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
//                                    atkOkPressed = true
//                                }
//                                keyboardIsFocused = false
//                            } label: {
//                                Text("OK")
//                                    .buttonStyleOn()
//                            }
//                        }
//                        .charInfoStyleBg()
//                    }
//
//                    if atkOkPressed && addCustomWeaponName != "" {
//                        HStack {
//                            Text("Táv (m)")
//                                .titleStyle()
//                            Spacer()
//                            TextField("Táv", value: $addDist, format: .number)
//                                .frame(maxHeight: .infinity)
//                                .padding(.horizontal, 10)
//                                .background(addDist == 0 ? Color.red.opacity(0.6) : Color.primary)
//                                .cornerRadius(6)
//                                .frame(maxWidth: 50)
//                                .focused($keyboardIsFocused)
//                                .keyboardType(.numberPad)
//                                .padding(.horizontal, 8)
//                            Button {
//                                withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
//                                    distOkPressed = true
//                                }
//                                keyboardIsFocused = false
//                            } label: {
//                                Text("OK")
//                                    .buttonStyleOn()
//                            }
//                        }
//                        .charInfoStyleBg()
//                    }
//
//                    if distOkPressed && addCustomWeaponName != "" {
//                        HStack {
//                            Text("Leírás")
//                                .titleStyle()
//                            Spacer()
//                            TextEditor(text: $addDesc)
//                                .font(.system(size: 16, weight: .light, design: .rounded).smallCaps())
//                                .foregroundColor(.primary)
//                                .frame(maxWidth: .infinity, maxHeight: .infinity)
//                                .cornerRadius(6)
//                                .focused($keyboardIsFocused)
//                                .padding(.horizontal, 8)
//                            Button {
//                                withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
//                                    descOkPressed = true
//                                }
//                                keyboardIsFocused = false
//                            } label: {
//                                Text("OK")
//                                    .buttonStyleOn()
//                            }
//                        }
//                        .charInfoStyleBg()
//                    }
//
//                    if descOkPressed && addCustomWeaponName != "" {
//                        HStack {
//                            Text("\(addCustomWeaponName) hozzáadása")
//                                .titleStyle()
//                            Spacer()
//                            Button{
//                                withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
//                                    equipmentViewModel.data.customCat.append((name: addCustomWeaponName, damShow: addCustomWeaponDamage, ke: addKe, te: addTe, ve: addVe, ce: addCe, atk: addAtk, dist: addDist, desc: addDesc))
//                                    addCustomWeaponName = ""
//                                    customWeaponNameOkPressed = false
//                                    customWeaponDamageOkPressed = false
//                                    keOkPressed = false
//                                    teOkPressed = false
//                                    veOkPressed = false
//                                    ceOkPressed = false
//                                    atkOkPressed = false
//                                    distOkPressed = false
//                                    descOkPressed = false
//                                }
//
//
//                                //                    let addWeapon = Character(context: moc)
//                                //                    addWeapon.weaponName = listViewModel.data.weaponName
//                                //                    addWeapon.weaponKe = Int16(listViewModel.data.weaponKe)
//                                //                    addWeapon.weaponTe = Int16(listViewModel.data.weaponTe)
//                                //                    addWeapon.weaponVe = Int16(listViewModel.data.weaponVe)
//                                //                    addWeapon.weaponCe = Int16(listViewModel.data.weaponCe)
//                                //                    addWeapon.weaponAttack = Int16(listViewModel.data.weaponAttack)
//                                //                    addWeapon.weaponDamage = Int16(listViewModel.data.weaponDamage)
//                                //                    addWeapon.weaponDistance = Int16(listViewModel.data.weaponDistance)
//
////                                if moc.hasChanges {
////                                    try? moc.save()
////                                }
//
//                            }label: {
//                                Image(systemName: "plus")
//                                    .buttonStyleDisabled(isValid: !equipmentViewModel.data.customCat.contains(where: { $0.name == addCustomWeaponName }))
//                            }
//                            .disabled(equipmentViewModel.data.customCat.contains(where: { $0.name == addCustomWeaponName }))
//                        }
//                        .frame(maxWidth: .infinity)
//                        .charInfoStyleBg()
//                    }
//                }
//
//                Group {
//                    if !equipmentViewModel.data.customCat.isEmpty {
//                        Image(systemName: "circle.grid.cross.left.filled")
//                            .padding()
//                            .foregroundColor(.gray)
//                        HStack {
//                            Text("Saját fegyverek")
//                                .headerStyle()
//                            Spacer()
//                        }
//                    }
//
//                    VStack (alignment: .leading, spacing: 0){
//                        ForEach(Array(equipmentViewModel.data.customCat.enumerated()), id: \.offset) { index, item in
//                            ScrollView {
//                                HStack {
//                                    Text("\(item.name)")
//                                        .titleStyle()
//                                    Spacer()
//                                    Button{
//                                        withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
//                                            if selectedWeaponInfo != item.name {
//                                                selectedWeaponInfo = item.name
//                                            } else {
//                                                selectedWeaponInfo = nil
//                                            }
//                                        }
//                                    }label:{
//                                        Image(systemName: "book.circle")
//                                            .foregroundColor(selectedWeaponInfo == item.name ? .orange.opacity(0.6) : .primary)
//                                    }
//                                    .padding(.horizontal, 6)
//
//
////                                    Button() {
////                                        equipmentViewModel.data.customCat = equipmentViewModel.data.customCat.filter() { $0 != item }
////                                    }label:{
////                                        Image(systemName: "minus")
////                                            .buttonStyleOn()
////                                    }
//
//
//                                    Button{
//                                        equipmentViewModel.data.weaponName = item.name
//                                        equipmentViewModel.data.weaponDamageShow = item.damShow
//                                        equipmentViewModel.data.weaponKe = item.ke
//                                        equipmentViewModel.data.weaponTe = item.te
//                                        equipmentViewModel.data.weaponVe = item.ve
//                                        equipmentViewModel.data.weaponCe = item.ce
//                                        equipmentViewModel.data.weaponAttack = item.atk
//                                        equipmentViewModel.data.weaponDistance = item.dist
//                                        equipmentViewModel.data.weaponDescription = item.desc
//
//                                        saveMoc()
//                                        showAddAlert = true
//                                    }label: {
//                                        Image(systemName: "plus")
//                                            .buttonStyleDisabled(isValid: !character.weaponsArray.contains(where: { $0.wrappedWeaponName == item.name }))
//                                    }
//                                    .disabled(character.weaponsArray.contains(where: { $0.wrappedWeaponName == item.name }))
//
//                                }
//                                .frame(maxWidth: .infinity)
//                                .charInfoStyleBg()
//                                .alert("\(equipmentViewModel.data.weaponName) hozzáadva!", isPresented: $showAddAlert){
//                                    Button("OK") {
//                                        showSheetAddWeapons.toggle()
//                                    }
//                                }
//
//                                Group {
//                                    if selectedWeaponInfo == item.name {
//                                        VStack {
//                                            HStack (alignment: .center, spacing: 0){
//                                                Text("\(item.desc)")
//                                                    .titleInfoStyle()
//                                                }
//                                                .frame(maxWidth: .infinity)
//                                                .charInfoStyleBg()
//
//                                            VStack (alignment: .trailing, spacing: 4){
//                                                LazyVGrid (
//                                                    columns: [
//                                                        GridItem(.flexible(minimum: 50)),
//                                                        GridItem(.flexible()),
//                                                        GridItem(.flexible()),
//                                                        GridItem(.flexible()),
//                                                        GridItem(.flexible()),
//                                                        GridItem(.flexible()),
//                                                        GridItem(.flexible()),
//                                                    ]
//                                                ){
//                                                    Text("Seb")
//
//                                                    Text("KÉ")
//
//                                                    Text("TÉ")
//
//                                                    Text("VÉ")
//
//                                                    Text("CÉ")
//
//                                                    Text("T/k")
//
//                                                    Text("Táv")
//                                                }
//                                                .font(.system(size: 12).smallCaps().weight(.light))
//
//                                                Rectangle()
//                                                    .frame(maxWidth: .infinity, maxHeight: 0.5, alignment: .center)
//                                                    .foregroundColor(Color.primary.opacity(0.2))
//
//                                                LazyVGrid (
//                                                    columns: [
//                                                        GridItem(.flexible(minimum: 50)),
//                                                        GridItem(.flexible()),
//                                                        GridItem(.flexible()),
//                                                        GridItem(.flexible()),
//                                                        GridItem(.flexible()),
//                                                        GridItem(.flexible()),
//                                                        GridItem(.flexible()),
//                                                    ]
//                                                ){
//
//                                                    Text("\(item.damShow)")
//
//                                                    Text("\(item.ke)")
//
//                                                    Text("\(item.te)")
//
//                                                    Text("\(item.ve)")
//
//                                                    Text("\(item.ce)")
//
//                                                    Text("\(item.atk)")
//
//                                                    Text("\(item.dist)")
//
//                                                }
//                                                .font(.system(size: 14).smallCaps().weight(.light))
//                                            }
//                                            .padding(.horizontal)
//                                            .padding(.vertical, 5)
//                                            .charInfoStyleBg()
//                                        }
//                                            .padding(.leading)
//                                            .padding(.bottom)
//                                    }
//                                }
//                            }
//                        }
//                    }
//                }
            }
        
            Image(systemName: "circle.grid.cross.up.filled")
                .padding()
                .foregroundColor(.gray)
  
            
            HStack {
                Text("Ruházkodás")
                    .headerStyle()
                Spacer()
            }
            
            VStack (alignment: .leading, spacing: 0){
                ForEach(Array(equipmentViewModel.equipmentData.equipmentCat1.enumerated()), id: \.offset) { index, item in
                    ScrollView {
                        HStack {
                            HStack {
                                if selectedEquipmentInfo == item.name {
                                    Image(systemName: "circle.fill")
                                        .foregroundColor(.orange.opacity(0.6))
                                } else {
                                    Image(systemName: "circle")
                                        .foregroundColor(.gray.opacity(0.5))
                                }
                                Text(item.name)
                                    .titleStyle()
                            }
                            .onTapGesture {
                                withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                    if selectedEquipmentInfo != item.name {
                                        selectedEquipmentInfo = item.name
                                    } else {
                                        selectedEquipmentInfo = nil
                                    }
                                }
                            }
                            Spacer()
                            
                            Button{
                                
                                equipmentViewModel.equipmentData.equipmentName = item.name
                                equipmentViewModel.equipmentData.equipmentDesc = item.desc
                                equipmentViewModel.equipmentData.equipmentQty = addQty
                                equipmentViewModel.equipmentData.equipmentComm = addComm

                                
                                saveMoc()
                                showAddAlert = true
                            }label: {
                                Image(systemName: "plus")
                                    .buttonStyleDisabled(isValid: !character.equipmentsArray.contains(where: { $0.wrappedEquipmentName == item.name }))
                            }
                            .disabled(character.equipmentsArray.contains(where: { $0.wrappedEquipmentName == item.name }))
                            
                        }
                        .frame(maxWidth: .infinity)
                        .charInfoStyleBg()
                        .alert("\(equipmentViewModel.equipmentData.equipmentName) hozzáadva!", isPresented: $showAddAlert){
                            Button("OK") {
                                showSheetAddEquipments.toggle()
                            }
                        }
                        
                        Group {
                            if selectedEquipmentInfo == item.name {
                                VStack {
                                    VStack (alignment: .leading, spacing: 0){
                                        HStack {
                                            Text("\(item.desc)")
                                                .titleInfoStyle()
                                        }
                                        
                                        Rectangle()
                                            .frame(maxWidth: .infinity, maxHeight: 0.5, alignment: .center)
                                            .foregroundColor(Color.primary.opacity(0.2))
                                            .padding(.horizontal)

                                        HStack {
                                            Text("Átlagos ár: \(item.cost * addQty)\(item.curr)")
                                            Spacer()
                                            Text("Db:")
                                            TextField("Db", value: $addQty, format: .number)
                                                .frame(maxHeight: .infinity)
                                                .padding(.horizontal, 10)
                                                .background(addQty == 0 ? Color.red.opacity(0.6) : Color.primary)
                                                .cornerRadius(6)
                                                .frame(maxWidth: 50)
                                                .focused($keyboardIsFocused)
                                                .keyboardType(.numberPad)
                                                .padding(.horizontal, 8)
                                            Button{
                                                
                                                keyboardIsFocused = false
                                            } label: {
                                                Text("OK")
                                                    .buttonStyleOn()
                                            }
                                        }
                                        .titleInfoStyle()
                                        
                                        Rectangle()
                                            .frame(maxWidth: .infinity, maxHeight: 0.5, alignment: .center)
                                            .foregroundColor(Color.primary.opacity(0.2))
                                            .padding(.horizontal)
                                        
                                        HStack {
                                            Text("Megjegyzés:")
                                            TextEditor(text: $addComm)
                                                .font(.system(size: 16, weight: .light, design: .rounded).smallCaps())
                                                .foregroundColor(.primary)
                                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                                .cornerRadius(6)
                                                .focused($keyboardIsFocused)
                                                .padding(.horizontal, 8)
                                            Button {
                                                keyboardIsFocused = false
                                            } label: {
                                                Text("OK")
                                                    .buttonStyleOn()
                                            }
                                        }
                                        .titleInfoStyle()
                                    }
                                    .charInfoStyleBg()
                                    
                                }
                                .padding(.leading)
                                .padding(.bottom)

                            }
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
                showSheetAddEquipments.toggle()
            } label: {
                Image(systemName: "arrow.left")
                    .buttonStyleOn()
            }
            Spacer()
            Text("Felszerelés hozzáadása")
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
        let addEquipment = Equipment(context: moc)
//        addEquipment.equipmentId = UUID()
        addEquipment.equipmentName = equipmentViewModel.equipmentData.equipmentName
        addEquipment.equipmentDesc = equipmentViewModel.equipmentData.equipmentDesc
        addEquipment.equipmentQty = Int16(equipmentViewModel.equipmentData.equipmentQty)
        addEquipment.equipmentComm = equipmentViewModel.equipmentData.equipmentComm
        
        character.addToEquipments(addEquipment)
        
        if moc.hasChanges {
            try? moc.save()
        }
    }
    
}

