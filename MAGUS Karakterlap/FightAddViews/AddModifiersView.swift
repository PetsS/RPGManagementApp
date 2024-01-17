//
//  AddModifiersView.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 06/11/2022.
//

import SwiftUI

struct AddModifiersView: View {
    let character: Character
    
    @EnvironmentObject var equipmentViewModel: EquipmentViewModel
    @Environment(\.managedObjectContext) var moc
    
    @FocusState private var keyboardIsFocused: Bool
    
    @Binding var showSheetAddModifiers: Bool
    
    @State private var selectedModifierInfo : String?
    @State private var selectedTargetInfo : String?
    @State private var selectedDisadvantageInfo = false
    @State private var showAddModifierAlert: Bool = false
    @State private var showAddDisadvantageAlert: Bool = false
    @State private var showAddTargetAlert: Bool = false
    @State private var enemyNumber = 3
    
    var body: some View {
        ScrollView {
            Group {
                VStack (alignment: .center, spacing: 0) {
                    Text("Célzás módosítók")
                        .titleStyle()
                    Rectangle()
                        .frame(maxWidth: .infinity, maxHeight: 0.5, alignment: .center)
                        .foregroundColor(Color.primary.opacity(0.2))
                        .padding(.horizontal)
                }
                VStack {
                    HStack {
                        Text("Célpont mozgása")
                            .headerStyle()
                        Spacer()
                    }
                    
                    VStack (alignment: .leading, spacing: 0){
                        ForEach(Array(equipmentViewModel.targetData.targetCat1.enumerated()), id: \.offset) { index, item in
                            HStack {
                                HStack {
                                    if selectedTargetInfo == item.name {
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
                                        if selectedTargetInfo != item.name {
                                            selectedTargetInfo = item.name
                                        } else {
                                            selectedTargetInfo = nil
                                        }
                                    }
                                }
                                Spacer()
                                
                                Button{
                                    equipmentViewModel.targetData.targetName = item.name
                                    equipmentViewModel.targetData.targetValue = item.val
                                    equipmentViewModel.targetData.targetDesc = item.desc
                                    
                                    saveMocTarget()
                                    showAddTargetAlert = true
                                }label: {
                                    Image(systemName: "plus")
                                        .buttonStyleDisabled(isValid: !character.targetsArray.contains(where: { $0.wrappedTargetDesc.contains("mozgása") }))
                                }
                                .disabled(character.targetsArray.contains(where: { $0.wrappedTargetDesc.contains("mozgása") }))
                                
                            }
                            .charInfoStyleBg()
                            .alert("\(equipmentViewModel.targetData.targetName) hozzáadva!", isPresented: $showAddTargetAlert){
                                Button("OK") { }
                            }
                            
                            Group {
                                if selectedTargetInfo == item.name {
                                    VStack {
                                        HStack (alignment: .center, spacing: 0){
                                            Text("\(item.desc)")
                                                .titleInfoStyle()
                                            Spacer()
                                        }
                                        .frame(maxWidth: .infinity)
                                        .charInfoStyleBg()
                                        
                                        HStack (alignment: .center, spacing: 0){
                                            Text("Célzó érték módosító: \(item.val) CÉ")
                                                .titleInfoStyle()
                                            Spacer()
                                        }
                                        .frame(maxWidth: .infinity)
                                        .charInfoStyleBg()
                                    }
                                    .padding(.leading)
                                    .padding(.bottom)
                                }
                            }
                        }
                    }
                    HStack {
                        Text("Időjárási viszonyok")
                            .headerStyle()
                        Spacer()
                    }
                    VStack (alignment: .leading, spacing: 0){
                        ForEach(Array(equipmentViewModel.targetData.targetCat2.enumerated()), id: \.offset) { index, item in
                            HStack {
                                HStack {
                                    if selectedTargetInfo == item.name {
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
                                        if selectedTargetInfo != item.name {
                                            selectedTargetInfo = item.name
                                        } else {
                                            selectedTargetInfo = nil
                                        }
                                    }
                                }
                                Spacer()
                                
                                Button{
                                    equipmentViewModel.targetData.targetName = item.name
                                    equipmentViewModel.targetData.targetValue = item.val
                                    equipmentViewModel.targetData.targetDesc = item.desc
                                    
                                    saveMocTarget()
                                    showAddTargetAlert = true
                                }label: {
                                    Image(systemName: "plus")
                                        .buttonStyleDisabled(isValid: !character.targetsArray.contains(where: { $0.wrappedTargetDesc.contains("Időjárási") }))
                                }
                                .disabled(character.targetsArray.contains(where: { $0.wrappedTargetDesc.contains("Időjárási") }))
                                
                            }
                            .charInfoStyleBg()
                            .alert("\(equipmentViewModel.targetData.targetName) hozzáadva!", isPresented: $showAddTargetAlert){
                                Button("OK") { }
                            }
                            
                            Group {
                                if selectedTargetInfo == item.name {
                                    VStack {
                                        HStack (alignment: .center, spacing: 0){
                                            Text("Célzó érték módosító: \(item.val) CÉ")
                                                .titleInfoStyle()
                                            Spacer()
                                        }
                                        .frame(maxWidth: .infinity)
                                        .charInfoStyleBg()
                                    }
                                    .padding(.leading)
                                    .padding(.bottom)
                                }
                            }
                        }
                    }
                    HStack {
                        Text("Célpont mérete")
                            .headerStyle()
                        Spacer()
                    }
                    VStack (alignment: .leading, spacing: 0){
                        ForEach(Array(equipmentViewModel.targetData.targetCat3.enumerated()), id: \.offset) { index, item in
                            HStack {
                                HStack {
                                    if selectedTargetInfo == item.name {
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
                                        if selectedTargetInfo != item.name {
                                            selectedTargetInfo = item.name
                                        } else {
                                            selectedTargetInfo = nil
                                        }
                                    }
                                }
                                Spacer()
                                
                                Button{
                                    equipmentViewModel.targetData.targetName = item.name
                                    equipmentViewModel.targetData.targetValue = item.val
                                    equipmentViewModel.targetData.targetDesc = item.desc
                                    
                                    saveMocTarget()
                                    showAddTargetAlert = true
                                }label: {
                                    Image(systemName: "plus")
                                        .buttonStyleDisabled(isValid: !character.targetsArray.contains(where: { $0.wrappedTargetDesc.contains("mérete") }))
                                }
                                .disabled(character.targetsArray.contains(where: { $0.wrappedTargetDesc.contains("mérete") }))
                                
                            }
                            .charInfoStyleBg()
                            .alert("\(equipmentViewModel.targetData.targetName) hozzáadva!", isPresented: $showAddTargetAlert){
                                Button("OK") { }
                            }
                            
                            Group {
                                if selectedTargetInfo == item.name {
                                    VStack {
                                        HStack (alignment: .center, spacing: 0){
                                            Text("Célzó érték módosító: \(item.val) CÉ")
                                                .titleInfoStyle()
                                            Spacer()
                                        }
                                        .frame(maxWidth: .infinity)
                                        .charInfoStyleBg()
                                    }
                                    .padding(.leading)
                                    .padding(.bottom)
                                }
                            }
                        }
                    }
                }
                
                Image(systemName: "circle.grid.cross.right.filled")
                    .padding()
                    .foregroundColor(.gray)
                
                VStack (alignment: .center, spacing: 0) {
                    Text("Harci módosítók")
                        .titleStyle()
                    Rectangle()
                        .frame(maxWidth: .infinity, maxHeight: 0.5, alignment: .center)
                        .foregroundColor(Color.primary.opacity(0.2))
                        .padding(.horizontal)
                }
                
                HStack {
                    Text("Harci helyzetek")
                        .headerStyle()
                    Spacer()
                }
                
                VStack (alignment: .leading, spacing: 0){
                    ForEach(Array(equipmentViewModel.modifierData.modifierCat1.enumerated()), id: \.offset) { index, item in
                        HStack {
                            HStack {
                                if selectedModifierInfo == item.name {
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
                                    if selectedModifierInfo != item.name {
                                        selectedModifierInfo = item.name
                                    } else {
                                        selectedModifierInfo = nil
                                    }
                                }
                            }
                            Spacer()
                            
                            Button{
                                equipmentViewModel.modifierData.modifierName = item.name
                                equipmentViewModel.modifierData.modifierKe = item.ke
                                equipmentViewModel.modifierData.modifierTe = item.te
                                equipmentViewModel.modifierData.modifierVe = item.ve
                                equipmentViewModel.modifierData.modifierCe = item.ce
                                equipmentViewModel.modifierData.modifierDescription = item.desc
                                
                                saveMocMod()
                                showAddModifierAlert = true
                            }label: {
                                Image(systemName: "plus")
                                    .buttonStyleDisabled(isValid: !character.modifiersArray.contains(where: { $0.wrappedModifierName == item.name }))
                            }
                            .disabled(character.modifiersArray.contains(where: { $0.wrappedModifierName == item.name }))
                            
                        }
                        .charInfoStyleBg()
                        .alert("\(equipmentViewModel.modifierData.modifierName) hozzáadva!", isPresented: $showAddModifierAlert){
                            Button("OK") { }
                        }
                        
                        Group {
                            if selectedModifierInfo == item.name {
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
                                                
                                                GridItem(.flexible()),
                                                GridItem(.flexible()),
                                                GridItem(.flexible()),
                                                GridItem(.flexible())
                                                
                                            ]
                                        ){
                                            
                                            Text("KÉ")
                                            
                                            Text("TÉ")
                                            
                                            Text("VÉ")
                                            
                                            Text("CÉ")
                                            
                                        }
                                        .font(.system(size: 12).smallCaps().weight(.light))
                                        
                                        Rectangle()
                                            .frame(maxWidth: .infinity, maxHeight: 0.5, alignment: .center)
                                            .foregroundColor(Color.primary.opacity(0.2))
                                        
                                        LazyVGrid (
                                            columns: [
                                                GridItem(.flexible()),
                                                GridItem(.flexible()),
                                                GridItem(.flexible()),
                                                GridItem(.flexible())
                                            ]
                                        ){
                                            
                                            Text("\(item.ke)")
                                            
                                            Text("\(item.te)")
                                            
                                            Text("\(item.ve)")
                                            
                                            Text("\(item.ce)")
                                            
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
            }
//
            Image(systemName: "circle.grid.cross.down.filled")
                .padding()
                .foregroundColor(.gray)
            
            Group {
                VStack (alignment: .center, spacing: 0) {
                    Text("Túlerő módosítók")
                        .titleStyle()
                    Rectangle()
                        .frame(maxWidth: .infinity, maxHeight: 0.5, alignment: .center)
                        .foregroundColor(Color.primary.opacity(0.2))
                        .padding(.horizontal)
                }
                HStack {
                    Text("Túlerő")
                        .headerStyle()
                    Spacer()
                }
                
                VStack (alignment: .leading, spacing: 0){
                    
                    HStack {
                        HStack {
                            if selectedDisadvantageInfo {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.orange.opacity(0.6))
                            } else {
                                Image(systemName: "circle")
                                    .foregroundColor(.gray.opacity(0.5))
                            }
                            Text("Túlerő \(enemyNumber) (max 8) ellen" )
                        }
                        .titleStyle()
                        .onTapGesture {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                selectedDisadvantageInfo.toggle()
                            }
                        }
                        Spacer()
                        Button{
                            equipmentViewModel.disadvantageData.disadvantageName = "Túlerő " + (String(enemyNumber) + " ellenfél ellen")
                            equipmentViewModel.disadvantageData.disadvantage = -((enemyNumber * 5) - 10)
                            
                            saveMocDisadv()
                            showAddDisadvantageAlert = true
                        }label: {
                            Image(systemName: "plus")
                                .buttonStyleDisabled(isValid: character.disadvantagesArray.isEmpty)
                        }
                        .disabled(!character.disadvantagesArray.isEmpty)
                        
                    }
                    .charInfoStyleBg()
                    .alert("Túlerő \(enemyNumber) ellenféllel hozzáadva!", isPresented: $showAddDisadvantageAlert){
                        Button("OK") { }
                    }
                    
                    Group {
                        if selectedDisadvantageInfo {
                            VStack {
                                HStack (alignment: .center, spacing: 0){
                                    Text("\(enemyNumber) ellenfél esetén -\((enemyNumber * 5) - 10) TÉ vagy VÉ.")
                                        .titleInfoStyle()
                                    Spacer()
                                }
                                .frame(maxWidth: .infinity)
                                .charInfoStyleBg()
                                HStack {
                                    Button {
                                        enemyNumber -= 1
                                        if enemyNumber <= 3 {
                                            enemyNumber = 3
                                        }
                                    } label: {
                                        Image(systemName: "minus")
                                            .buttonStyleDisabled(isValid: enemyNumber != 3)
                                    }
                                    .disabled(enemyNumber <= 3)
                                    Spacer()
                                    Text("\(enemyNumber)")
                                        .charInfoStyle()
                                    Spacer()
                                    Button {
                                        enemyNumber += 1
                                        if enemyNumber >= 8 {
                                            enemyNumber = 8
                                        }
                                    } label: {
                                        Image(systemName: "plus")
                                            .buttonStyleDisabled(isValid: enemyNumber != 8)
                                    }
                                    .disabled(enemyNumber >= 8)
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
        .padding(.top)
        Spacer()

        
        //bottom bar
        HStack {
            Button {
                showSheetAddModifiers.toggle()
            } label: {
                Image(systemName: "arrow.left")
                    .buttonStyleOn()
            }
            Spacer()
            Text("Módosító hozzáadása")
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
    
    func saveMocMod() {
        let addModifier = Modifier(context: moc)
        
        addModifier.modifierName = equipmentViewModel.modifierData.modifierName
        addModifier.modifierKe = Int16(equipmentViewModel.modifierData.modifierKe)
        addModifier.modifierTe = Int16(equipmentViewModel.modifierData.modifierTe)
        addModifier.modifierVe = Int16(equipmentViewModel.modifierData.modifierVe)
        addModifier.modifierCe = Int16(equipmentViewModel.modifierData.modifierCe)
        addModifier.modifierDescription = equipmentViewModel.modifierData.modifierDescription
        
        character.addToModifiers(addModifier)
        
        character.modifierKe += Int16(equipmentViewModel.modifierData.modifierKe)
        character.modifierTe += Int16(equipmentViewModel.modifierData.modifierTe)
        character.modifierVe += Int16(equipmentViewModel.modifierData.modifierVe)
        character.modifierCe += Int16(equipmentViewModel.modifierData.modifierCe)
        
        if moc.hasChanges {
            try? moc.save()
        }
    }
    
    func saveMocDisadv() {
        let addDisadvantage = Disadvantage(context: moc)
        
        addDisadvantage.disadvantageName = equipmentViewModel.disadvantageData.disadvantageName
        addDisadvantage.disadvantage = Int16(equipmentViewModel.disadvantageData.disadvantage)
        
        character.addToDisadvantages(addDisadvantage)
        
        character.disadvantageTe = Int16(equipmentViewModel.disadvantageData.disadvantage)
        character.disadvantageVe = Int16(equipmentViewModel.disadvantageData.disadvantage)
        character.disadvantageName = equipmentViewModel.disadvantageData.disadvantageName
        
        if moc.hasChanges {
            try? moc.save()
        }
    }
    
    func saveMocTarget() {
        let addTarget = Target(context: moc)
        
        addTarget.targetName = equipmentViewModel.targetData.targetName
        addTarget.targetValue = Int16(equipmentViewModel.targetData.targetValue)
        addTarget.targetDesc = equipmentViewModel.targetData.targetDesc
        
        character.addToTargets(addTarget)
        
        character.targetName = equipmentViewModel.targetData.targetName
        character.targetValue += Int16(equipmentViewModel.targetData.targetValue)
        character.targetDesc = equipmentViewModel.targetData.targetDesc
        
        if moc.hasChanges {
            try? moc.save()
        }
    }

}
