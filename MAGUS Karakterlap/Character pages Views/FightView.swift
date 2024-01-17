//
//  FightView.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 11/09/2022.
//

import SwiftUI
import Combine

struct FightView: View {
    @StateObject var character = Character()
    
    @EnvironmentObject var equipmentViewModel: EquipmentViewModel
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.managedObjectContext) var moc
//    @Environment(\.dismiss) var dismiss
    @FocusState private var keyboardIsFocused: Bool
    
    @State private var rollKe = 0
    @State private var rollTe = 0
    @State private var rollVe = 0
    @State private var rollCe = 0
    @State private var rollDamage = 0
    @State private var rollKeTyped = ""
    @State private var rollTeTyped = ""
    @State private var rollVeTyped = ""
    @State private var rollCeTyped = ""
    @State private var rollDamageTyped = ""
    @State private var nonFightKe = false
    
    @State private var selectedTargetInfo : String?
    @State private var selectedModifierInfo : String?
    @State private var selectedDisadvantageInfo : String?
    @State private var selectedFightPointInfo : String?
    @State private var showConfirmButton : String?
    @State private var showSheetChoseWeapons = false
    @State private var showSheetChoseWeaponsSecond = false
    @State private var showSheetChoseArmors = false
    @State private var showSheetAddModifiers = false
    @State private var selectDisadvantage = false
    
    var body: some View {
        ScrollView {
            VStack (alignment: .center){
                
                Group {
                    HStack {
                        Text("Harci értékek összesen")
                        Spacer()
                        Button {
                            rollKe = Int.random(in: 1...10)
                            rollKeTyped = String(rollKe)
                            rollTe = Int.random(in: 1...100)
                            rollTeTyped = String(rollTe)
                            rollCe = Int.random(in: 1...100)
                            rollCeTyped = String(rollCe)
                            rollDamage = WeaponsCalculator.damShowCalc(string: character.wrappedWeaponDamageShow)
                            rollDamageTyped = String(rollDamage)
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                showConfirmButton = ""
                            }
                            keyboardIsFocused = false
                        }label:{
                            Image(systemName: "square.stack.3d.up")
                        }
                        .disabled(!(rollKe == 0 && rollTe == 0 && rollVe == 0 && rollCe == 0 && rollDamage == 0))
                        .foregroundColor(!(rollKe == 0 && rollTe == 0 && rollVe == 0 && rollCe == 0 && rollDamage == 0) ? .gray : .primary)
                        .padding(.horizontal)
                        Button {
                            rollKe = 0
                            rollTe = 0
                            rollVe = 0
                            rollCe = 0
                            rollDamage = 0
                            rollKeTyped = ""
                            rollTeTyped = ""
                            rollVeTyped = ""
                            rollCeTyped = ""
                            rollDamageTyped = ""
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                showConfirmButton = ""
                            }
                        } label: {
                            Image(systemName: "trash")
                                .foregroundColor(rollKe == 0 && rollTe == 0 && rollVe == 0 && rollCe == 0 && rollDamage == 0 ? .gray : .primary)
                        }
                        .disabled(rollKe == 0 && rollTe == 0 && rollVe == 0 && rollCe == 0 && rollDamage == 0)
                    }
                    .headerStyle()
                    .padding(.top, 8)
                    
                    HStack (alignment: .center, spacing: 0) {
                        Text("KÉ")
                            .titleStyle()
                        Spacer()
                        Button {
                            rollKe = Int.random(in: 1...10)
                            rollKeTyped = String(rollKe)
                        } label: {
                            Image(systemName: "dice")
                                .buttonStyleOn()
                        }
                        TextField("0", text: $rollKeTyped)
                            .onChange(of: rollKeTyped) { newValue in
                                rollKeTyped = String(newValue.prefix(2))
                            }
                            .onReceive(Just(rollKeTyped)) { newValue in
                                let filtered = newValue.filter { "0123456789".contains($0) }
                                if filtered != newValue {
                                    self.rollKeTyped = filtered
                                }
                            }
                            .onTapGesture {
                                withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                    showConfirmButton = "KÉ"
                                }
                            }
                            .onSubmit {
                                withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                    showConfirmButton = ""
                                }
                                rollKe = Int(rollKeTyped) ?? 0
                                keyboardIsFocused = false
                            }
                            .padding(.vertical, 8)
                            .padding(.horizontal, 10)
                            .background(rollKe == 0 ? Color.red.opacity(0.6) : Color.primary)
                            .cornerRadius(6)
                            .frame(maxWidth: 50)
                            .focused($keyboardIsFocused)
                            .keyboardType(.numberPad)
                            .padding(.horizontal, 8)
                        if showConfirmButton == "KÉ" {
                            Button {
                                withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                    showConfirmButton = ""
                                }
                                rollKe = Int(rollKeTyped) ?? 0
                                keyboardIsFocused = false
                            } label: {
                                Image(systemName: "checkmark")
                                    .buttonStyleOn()
                            }
                            .padding(.trailing, 8)
                        }
                        Button{
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                if selectedFightPointInfo != "KÉ" {
                                    selectedFightPointInfo = "KÉ"
                                } else {
                                    selectedFightPointInfo = nil
                                }
                            }
                        }label:{
                            Text("\(Int(character.ke) + rollKe + Int(character.weaponKe) + Int(character.modifierKe) + (nonFightKe == true ? (10 - Int(character.weaponKe)) : 0))")
                                .charInfoStyleFight()
                        }
                    }
                    .charInfoStyleBg()
                    if selectedFightPointInfo == "KÉ" {
                        VStack {
                            HStack {
                                VStack (alignment: .leading, spacing: 0) {
                                    Text("Kezdeményező érték alap: \(character.ke)")
                                    Text("\(character.wrappedWeaponEquipped): \(character.weaponKe)")
                                    Text("Harci helyzet: \(character.modifierKe)")
                                    Text("Kockadobás (k10): \(rollKe)")
                                    Rectangle()
                                        .frame(maxWidth: .infinity, maxHeight: 0.5, alignment: .center)
                                        .foregroundColor(Color.primary.opacity(0.2))
                                        .padding(.vertical, 5)
                                    HStack {
                                        Text("NEM harci cselekedet esetén: +10 a fegyver KÉ (\(character.weaponKe)) helyett.")
                                        Spacer()
                                        Button{
                                            nonFightKe.toggle()
                                        }label:{
                                            Image(systemName: nonFightKe == true ? "checkmark.circle" : "circle")
                                                .buttonStyleDisabled(isValid: !nonFightKe)
                                        }
                                    }
                                }
                                .titleInfoStyle()
                                Spacer()
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .charInfoStyleBg()
                        .padding(.leading)
                        .padding(.bottom)
                    }
                }
                
                
                Group {
                    HStack (alignment: .center, spacing: 0) {
                        Text("TÉ")
                            .titleStyle()
                        Spacer()
                        Button {
                            rollTe = Int.random(in: 1...100)
                            rollTeTyped = String(rollTe)
                        } label: {
                            Image(systemName: "dice")
                                .buttonStyleOn()
                        }
                        TextField("0", text: $rollTeTyped)
                            .onChange(of: rollTeTyped) { newValue in
                                rollTeTyped = String(newValue.prefix(2))
                            }
                            .onReceive(Just(rollTeTyped)) { newValue in
                                let filtered = newValue.filter { "0123456789".contains($0) }
                                if filtered != newValue {
                                    self.rollTeTyped = filtered
                                }
                            }
                            .onTapGesture {
                                withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                    showConfirmButton = "TÉ"
                                }
                            }
                            .onSubmit {
                                withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                    showConfirmButton = ""
                                }
                                rollTe = Int(rollTeTyped) ?? 0
                                keyboardIsFocused = false
                            }
                            .padding(.vertical, 8)
                            .padding(.horizontal, 10)
                            .background(rollTe == 0 ? Color.red.opacity(0.6) : Color.primary)
                            .cornerRadius(6)
                            .frame(maxWidth: 50)
                            .focused($keyboardIsFocused)
                            .keyboardType(.numberPad)
                            .padding(.horizontal, 8)
                        if showConfirmButton == "TÉ" {
                            Button {
                                withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                    showConfirmButton = ""
                                }
                                rollTe = Int(rollTeTyped) ?? 0
                                keyboardIsFocused = false
                            } label: {
                                Image(systemName: "checkmark")
                                    .buttonStyleOn()
                            }
                            .padding(.trailing, 8)
                        }
                        Button{
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                if selectedFightPointInfo != "TÉ" {
                                    selectedFightPointInfo = "TÉ"
                                } else {
                                    selectedFightPointInfo = nil
                                }
                            }
                        }label:{
                            Text("\(Int(character.te) + rollTe + Int(character.weaponTe) + Int(character.modifierTe) + (selectDisadvantage == false ? Int(character.disadvantageTe) : 0))" + "\((rollTe == 100) || (rollTe == 1) ? "!" : "")")
                                .charInfoStyleFight()
                        }
                    }
                    .charInfoStyleBg()
                    if selectedFightPointInfo == "TÉ" {
                        VStack {
                            HStack {
                                VStack (alignment: .leading, spacing: 0) {
                                    Text("Támadó érték alap: \(character.te + (character.armorMGT * 2))")
                                    Text("\(character.wrappedWeaponEquipped): \(character.weaponTe)")
                                    Text("Harci helyzet: \(character.modifierTe)")
                                    Text("\(character.wrappedDisadvantageName): \(selectDisadvantage == false ? character.disadvantageTe : 0)")
                                    Text("Kockadobás (k100): \(rollTe)")
                                    if character.armorMGT != 0 {
                                        Text("Mozgás gátló tényező: (-\(character.armorMGT) Ügy, -\(character.armorMGT) Gyo)")
                                    }
                                }
                                .titleInfoStyle()
                                Spacer()
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .charInfoStyleBg()
                        .padding(.leading)
                        .padding(.bottom)
                    }
                }
                
                Group {
                    HStack (alignment: .center, spacing: 0) {
                        Text("VÉ")
                            .titleStyle()
                        Spacer()
//                        Button {
//                            rollVe = Int.random(in: 1...100)
//                            rollVeTyped = String(rollVe)
//                        } label: {
//                            Image(systemName: "dice")
//                                .buttonStyleOn()
//                        }
//                        TextField("0", text: $rollVeTyped)
//                            .onChange(of: rollVeTyped) { newValue in
//                                rollVeTyped = String(newValue.prefix(2))
//                            }
//                            .onReceive(Just(rollVeTyped)) { newValue in
//                                let filtered = newValue.filter { "0123456789".contains($0) }
//                                if filtered != newValue {
//                                    self.rollVeTyped = filtered
//                                }
//                            }
//                            .onTapGesture {
//                                withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
//                                    showConfirmButton = "VÉ"
//                                }
//                            }
//                            .onSubmit {
//                                withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
//                                    showConfirmButton = ""
//                                }
//                                rollVe = Int(rollVeTyped) ?? 0
//                                keyboardIsFocused = false
//                            }
//                            .padding(.vertical, 8)
//                            .padding(.horizontal, 10)
//                            .background(rollVe == 0 ? Color.red.opacity(0.6) : Color.primary)
//                            .cornerRadius(6)
//                            .frame(maxWidth: 50)
//                            .focused($keyboardIsFocused)
//                            .keyboardType(.numberPad)
//                            .padding(.horizontal, 8)
//                        if showConfirmButton == "VÉ" {
//                            Button {
//                                withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
//                                    showConfirmButton = ""
//                                }
//                                rollVe = Int(rollVeTyped) ?? 0
//                                keyboardIsFocused = false
//                            } label: {
//                                Image(systemName: "checkmark")
//                                    .buttonStyleOn()
//                            }
//                            .padding(.trailing, 8)
//                        }
                        Button{
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                if selectedFightPointInfo != "VÉ" {
                                    selectedFightPointInfo = "VÉ"
                                } else {
                                    selectedFightPointInfo = nil
                                }
                            }
                        }label:{
                            Text("\(Int(character.ve) + rollVe + Int(character.weaponVe) + Int(character.modifierVe) + (selectDisadvantage ? Int(character.disadvantageVe) : 0))" + "\((rollVe == 100) || (rollVe == 1) ? "!" : "")")
                                .charInfoStyleFight()
                        }
                    }
                    .charInfoStyleBg()
                    if selectedFightPointInfo == "VÉ" {
                        VStack {
                            HStack {
                                VStack (alignment: .leading, spacing: 0) {
                                    Text("Védő érték alap: \(character.ve + (character.armorMGT * 2))")
                                    Text("\(character.wrappedWeaponEquipped): \(character.weaponVe)")
                                    Text("Harci helyzet: \(character.modifierVe)")
                                    Text("\(character.wrappedDisadvantageName): \(selectDisadvantage ? character.disadvantageVe : 0)")
//                                    Text("Kockadobás (k100): \(rollVe)")
                                    if character.armorMGT != 0 {
                                        Text("Mozgás gátló tényező: (-\(character.armorMGT) Ügy, -\(character.armorMGT) Gyo)")
                                    }
                                }
                                .titleInfoStyle()
                                Spacer()
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .charInfoStyleBg()
                        .padding(.leading)
                        .padding(.bottom)
                    }
                }
                
                Group {
                    HStack (alignment: .center, spacing: 0) {
                        Text("CÉ")
                            .titleStyle()
                        Spacer()
                        Button {
                            rollCe = Int.random(in: 1...100)
                            rollCeTyped = String(rollCe)
                        } label: {
                            Image(systemName: "dice")
                                .buttonStyleOn()
                        }
                        TextField("0", text: $rollCeTyped)
                            .onChange(of: rollCeTyped) { newValue in
                                rollCeTyped = String(newValue.prefix(2))
                            }
                            .onReceive(Just(rollCeTyped)) { newValue in
                                let filtered = newValue.filter { "0123456789".contains($0) }
                                if filtered != newValue {
                                    self.rollCeTyped = filtered
                                }
                            }
                            .onTapGesture {
                                withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                    showConfirmButton = "CÉ"
                                }
                            }
                            .onSubmit {
                                withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                    showConfirmButton = ""
                                }
                                rollCe = Int(rollCeTyped) ?? 0
                                keyboardIsFocused = false
                            }
                            .padding(.vertical, 8)
                            .padding(.horizontal, 10)
                            .background(rollCe == 0 ? Color.red.opacity(0.6) : Color.primary)
                            .cornerRadius(6)
                            .frame(maxWidth: 50)
                            .focused($keyboardIsFocused)
                            .keyboardType(.numberPad)
                            .padding(.horizontal, 8)
                        if showConfirmButton == "CÉ" {
                            Button {
                                withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                    showConfirmButton = ""
                                }
                                rollCe = Int(rollCeTyped) ?? 0
                                keyboardIsFocused = false
                            } label: {
                                Image(systemName: "checkmark")
                                    .buttonStyleOn()
                            }
                            .padding(.trailing, 8)
                        }
                        Button{
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                if selectedFightPointInfo != "CÉ" {
                                    selectedFightPointInfo = "CÉ"
                                } else {
                                    selectedFightPointInfo = nil
                                }
                            }
                        }label:{
                            Text("\(Int(character.ce) + rollCe + Int(character.weaponCe) + Int(character.modifierCe) + Int(character.targetValue) - 30)" + "\((rollCe == 100) || (rollCe == 1) ? "!" : "")")
                                .charInfoStyleFight()
                        }
                    }
                    .charInfoStyleBg()
                    if selectedFightPointInfo == "CÉ" {
                        VStack {
                            HStack {
                                VStack (alignment: .leading, spacing: 0) {
                                    Text("Célzó érték alap: \(character.ce)")
                                    Text("Kötelező: -30")
                                    Text("Célzás módosító: \(character.targetValue)")
                                    Text("\(character.wrappedWeaponEquipped): \(character.weaponCe)")
                                    Text("Harci helyzet: \(character.modifierCe)")
                                    Text("Kockadobás (k100): \(rollCe)")
                                }
                                .titleInfoStyle()
                                Spacer()
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .charInfoStyleBg()
                        .padding(.leading)
                        .padding(.bottom)
                    }
                }
                
                Group {
                    HStack (alignment: .center, spacing: 0) {
                        Text("Seb")
                            .titleStyle()
                        Spacer()
                        Button {
                            rollDamage = WeaponsCalculator.damShowCalc(string: character.wrappedWeaponDamageShow)
                            rollDamageTyped = String(rollDamage)
                        } label: {
                            Image(systemName: "dice")
                                .buttonStyleOn()
                        }
                        TextField("0", text: $rollDamageTyped)
                            .onChange(of: rollDamageTyped) { newValue in
                                rollDamageTyped = String(newValue.prefix(2))
                            }
                            .onReceive(Just(rollDamageTyped)) { newValue in
                                let filtered = newValue.filter { "0123456789".contains($0) }
                                if filtered != newValue {
                                    self.rollDamageTyped = filtered
                                }
                            }
                            .onTapGesture {
                                withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                    showConfirmButton = "SEB"
                                }
                            }
                            .onSubmit {
                                withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                    showConfirmButton = ""
                                }
                                rollDamage = Int(rollDamageTyped) ?? 0
                                keyboardIsFocused = false
                            }
                            .padding(.vertical, 8)
                            .padding(.horizontal, 10)
                            .background(rollDamage == 0 ? Color.red.opacity(0.6) : Color.primary)
                            .cornerRadius(6)
                            .frame(maxWidth: 50)
                            .focused($keyboardIsFocused)
                            .keyboardType(.numberPad)
                            .padding(.horizontal, 8)
                        if showConfirmButton == "SEB" {
                            Button {
                                withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                    showConfirmButton = ""
                                }
                                rollDamage = Int(rollDamageTyped) ?? 0
                                keyboardIsFocused = false
                            } label: {
                                Image(systemName: "checkmark")
                                    .buttonStyleOn()
                            }
                            .padding(.trailing, 8)
                        }
                        Button{
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                if selectedFightPointInfo != "Seb" {
                                    selectedFightPointInfo = "Seb"
                                } else {
                                    selectedFightPointInfo = nil
                                }
                            }
                        }label:{
                            Text("\(rollDamage)")
                                .charInfoStyleFight()
                        }
                    }
                    .charInfoStyleBg()
                    if selectedFightPointInfo == "Seb" {
                        VStack {
                            HStack {
                                VStack (alignment: .leading, spacing: 0) {
                                    Text("\(character.wrappedWeaponEquipped): \(character.wrappedWeaponDamageShow) sebzés")
                                }
                                .titleInfoStyle()
                                Spacer()
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .charInfoStyleBg()
                        .padding(.leading)
                        .padding(.bottom)
                    }
                }
                
                Group {
                    HStack (alignment: .center, spacing: 0) {
                        Text("Tám/kör")
                            .titleStyle()
                        Spacer()
                        Button{
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                if selectedFightPointInfo != "Tám/kör" {
                                    selectedFightPointInfo = "Tám/kör"
                                } else {
                                    selectedFightPointInfo = nil
                                }
                            }
                        }label:{
                            Text("\(((character.speed >= 16) && (character.agility >= 16)) ? "\(character.weaponAttack)" : "1")")
                                .charInfoStyleFight()
                        }
                    }
                    .charInfoStyleBg()
                    if selectedFightPointInfo == "Tám/kör" {
                        VStack {
                            HStack {
                                VStack (alignment: .leading, spacing: 0) {
                                    if character.weaponAttack >= 2 {
                                        Text("Az aktuális fegyverrel \(character.weaponAttack) támadás körönként, ha a karakter Gyorsasága (\(character.speed)) és Ügyessége (\(character.agility)) eléri, vagy meghaladja a 16-ot.")
                                    } else {
                                        Text("\(character.wrappedWeaponEquipped): \(character.weaponAttack) támadás körönként.")
                                    }
                                }
                                .titleInfoStyle()
                                Spacer()
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .charInfoStyleBg()
                        .padding(.leading)
                        .padding(.bottom)
                    }
                }
                
                Group {
                    HStack (alignment: .center, spacing: 0) {
                        Text("SFÉ")
                            .titleStyle()
                        Spacer()
                        Button{
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                if selectedFightPointInfo != "SFÉ" {
                                    selectedFightPointInfo = "SFÉ"
                                } else {
                                    selectedFightPointInfo = nil
                                }
                            }
                        }label:{
                            Text("\(character.armorSFE)")
                                .charInfoStyleFight()
                        }
                    }
                    .charInfoStyleBg()
                    if selectedFightPointInfo == "SFÉ" {
                        VStack {
                            HStack {
                                Text("\(character.wrappedArmorEquipped): \(character.armorSFE) sebfelfogó érték.")
                                    .titleInfoStyle()
                                Spacer()
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .charInfoStyleBg()
                        .padding(.leading)
                        .padding(.bottom)
                    }
                }
                
                Image(systemName: "circle.grid.cross.up.filled")
                    .padding()
                    .foregroundColor(.gray)
            }
            
            VStack{
                HStack (alignment: .center, spacing: 0){
                    HStack {
                        Text("Fegyver: ")
                        Text("\(character.wrappedWeaponEquipped)")
                    }
                    .titleStyle()
                    Spacer()
                    Button{
                        showSheetChoseWeapons.toggle()
                    }label:{
                        Image(systemName: "square.and.pencil")
                            .buttonStyleOn()
                    }
                    .sheet(isPresented: $showSheetChoseWeapons) {
                        ChoseWeaponsView(character: character, showSheetChoseWeapons: $showSheetChoseWeapons)
                    }
                }
                .frame(maxWidth: .infinity)
                .charInfoStyleBg()
                
                HStack (alignment: .center, spacing: 0){
                    HStack {
                        Text("Fegyver/Pajzs: ")
                        Text("\(character.wrappedWeapon2Equipped)")
                    }
                    .titleStyle()
                    Spacer()
                    Button{
                        showSheetChoseWeaponsSecond.toggle()
                    }label:{
                        Image(systemName: "square.and.pencil")
                            .buttonStyleOn()
                    }
                    .sheet(isPresented: $showSheetChoseWeaponsSecond) {
                        ChoseWeaponsSecondView(character: character, showSheetChoseWeaponsSecond: $showSheetChoseWeaponsSecond)
                    }
                }
                .frame(maxWidth: .infinity)
                .charInfoStyleBg()
                
                HStack (alignment: .center, spacing: 0){
                    HStack {
                        Text("Páncél: ")
                        Text("\(character.wrappedArmorEquipped)")
                    }
                    .titleStyle()
                    Spacer()
                    Button{
                        showSheetChoseArmors.toggle()
                    }label:{
                        Image(systemName: "square.and.pencil")
                            .buttonStyleOn()
                    }
                    .sheet(isPresented: $showSheetChoseArmors) {
                        ChoseArmorsView(character: character, showSheetChoseArmors: $showSheetChoseArmors)
                    }
                }
                .frame(maxWidth: .infinity)
                .charInfoStyleBg()
            }
            
            Image(systemName: "circle.grid.cross.right.filled")
                .padding()
                .foregroundColor(.gray)
            
            HStack {
                Text("Harc és célzás módosítók")
                Spacer()
            }
            .headerStyle()
            
            Group {
                if !character.targetsArray.isEmpty {
                    VStack {
                        ForEach(character.targetsArray, id: \.self) { item in
                            HStack (alignment: .center, spacing: 0) {
                                HStack {
                                    if selectedTargetInfo == item.wrappedTargetName {
                                        Image(systemName: "circle.fill")
                                            .foregroundColor(.orange.opacity(0.6))
                                    } else {
                                        Image(systemName: "circle")
                                            .foregroundColor(.gray.opacity(0.5))
                                    }
                                    Text(item.wrappedTargetName)
                                }
                                .onTapGesture {
                                    withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                        if selectedTargetInfo != item.wrappedTargetName {
                                            selectedTargetInfo = item.wrappedTargetName
                                        } else {
                                            selectedTargetInfo = nil
                                        }
                                    }
                                }
                                Spacer()
                                Button{
                                    character.targetValue -= item.targetValue
                                    withAnimation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 1)){
                                        deleteTargetItem(item: item)
                                    }
                                }label: {
                                    Image(systemName: "trash")
                                        .foregroundColor(.primary)
                                }
                            }
                            .padding(.vertical, 1)

                            Group {
                                if selectedTargetInfo == item.wrappedTargetName {
                                    VStack {
                                        TargetInfoView(item: item)
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
            
            Group {
                if !character.modifiersArray.isEmpty {
                    VStack {
                        ForEach(character.modifiersArray, id: \.self) { item in
                            HStack (alignment: .center, spacing: 0) {
                                HStack {
                                    if selectedModifierInfo == item.wrappedModifierName {
                                        Image(systemName: "circle.fill")
                                            .foregroundColor(.orange.opacity(0.6))
                                    } else {
                                        Image(systemName: "circle")
                                            .foregroundColor(.gray.opacity(0.5))
                                    }
                                    Text(item.wrappedModifierName)
                                }
                                .onTapGesture {
                                    withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                        if selectedModifierInfo != item.wrappedModifierName {
                                            selectedModifierInfo = item.wrappedModifierName
                                        } else {
                                            selectedModifierInfo = nil
                                        }
                                    }
                                }
                                Spacer()
                                Button{
                                    character.modifierKe -= item.modifierKe
                                    character.modifierTe -= item.modifierTe
                                    character.modifierVe -= item.modifierVe
                                    character.modifierCe -= item.modifierCe
                                    withAnimation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 1)){
                                        deleteModifierItem(item: item)
                                    }
                                }label: {
                                    Image(systemName: "trash")
                                        .foregroundColor(.primary)
                                }
                            }
                            .padding(.vertical, 1)
                            
                            Group {
                                if selectedModifierInfo == item.wrappedModifierName {
                                    VStack {
                                        ModifierInfoView(item: item)
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
            Group {
                if !character.disadvantagesArray.isEmpty {
                    VStack {
                        ForEach(character.disadvantagesArray, id: \.self) { item in
                            HStack (alignment: .center, spacing: 0) {
                                HStack {
                                    if selectedDisadvantageInfo == item.wrappedDisadvantageName {
                                        Image(systemName: "circle.fill")
                                            .foregroundColor(.orange.opacity(0.6))
                                    } else {
                                        Image(systemName: "circle")
                                            .foregroundColor(.gray.opacity(0.5))
                                    }
                                    Text(item.wrappedDisadvantageName)
                                }
                                .onTapGesture {
                                    withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                        if selectedDisadvantageInfo != item.wrappedDisadvantageName {
                                            selectedDisadvantageInfo = item.wrappedDisadvantageName
                                        } else {
                                            selectedDisadvantageInfo = nil
                                        }
                                    }
                                }
                                Spacer()
                                Button{
                                    character.disadvantageTe = 0
                                    character.disadvantageVe = 0
                                    withAnimation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 1)){
                                        deleteDisadvantageItem(item: item)
                                    }
                                }label: {
                                    Image(systemName: "trash")
                                        .foregroundColor(.primary)
                                }
                            }
                            .padding(.vertical, 1)

                            Group {
                                if selectedDisadvantageInfo == item.wrappedDisadvantageName {
                                    VStack {
                                        DisadvantageInfoView(item: item, selectDisadvantage: $selectDisadvantage)
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
            
            Group {
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 0.5, alignment: .center)
                    .foregroundColor(Color.primary.opacity(0.2))
                    .padding(.horizontal)
                
                HStack {
                    Button {
                        showSheetAddModifiers.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .buttonStyleOn()
                    }
                    .sheet(isPresented: $showSheetAddModifiers) {
                        AddModifiersView(character: character, showSheetAddModifiers: $showSheetAddModifiers)
                    }
                    Text("Új módisító hozzáadása")
                        .font(.system(size: 14).smallCaps().weight(.light))
                        .padding(.horizontal, 4)
                    Spacer()
                }
                .charInfoStyleBg()
                .padding(.bottom)
            }
            
        }
        .onAppear{
            if character.modifiersArray.isEmpty {
                character.modifierKe = 0
                character.modifierTe = 0
                character.modifierVe = 0
                character.modifierCe = 0
            }
            if character.disadvantagesArray.isEmpty {
                character.disadvantageTe = 0
                character.disadvantageVe = 0
            }
            if character.weaponsArray.isEmpty {
                character.weaponEquipped = "Puszta kéz"
                character.weaponDamageShow = "k3"
                character.weaponAttack = 1
            }
            if character.armorsArray.isEmpty {
                character.armorEquipped = "Nincs vértezet"
                character.armorMGT = 0
                character.armorSFE = 0
            }
        }
//        .toolbar {
//            ToolbarItemGroup(placement: .keyboard) {
//                Spacer()
//                Button {
//                    rollKe = Int(rollKeTyped) ?? 0
//                    rollTe = Int(rollTeTyped) ?? 0
//                    rollVe = Int(rollVeTyped) ?? 0
//                    rollCe = Int(rollCeTyped) ?? 0
//                    rollDamage = Int(rollDamageTyped) ?? 0
//                    keyboardIsFocused = false
//                } label: {
//                    Text("OK")
//                        .buttonStyleOn()
//                }
//            }
//        }

        
        
    }
    
    func deleteModifierItem(item: Modifier) {
        character.removeFromModifiers(item)
        moc.delete(item)
        try? moc.save()
    }
    
    func deleteDisadvantageItem(item: Disadvantage) {
        character.removeFromDisadvantages(item)
        moc.delete(item)
        try? moc.save()
    }
    
    func deleteTargetItem(item: Target) {
        character.removeFromTargets(item)
        moc.delete(item)
        try? moc.save()
    }
}
