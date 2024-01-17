//
//  CharacterView.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 16/09/2022.
//

// This is the "Info" Tab

import SwiftUI
import Combine

struct CharacterView: View {
    @StateObject var character = Character()
    
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.managedObjectContext) var moc
    @FocusState private var keyboardIsFocused: Bool
    
    @State private var showSheetEditCharDescription = false
    @State private var showSheetCaste = false
    @State private var showDeleteImageAlert = false
    @State private var newHealthPointAct = 1
    @State private var newPainPointAct = 1
    @State private var newXp = ""
    
    @State private var selectedCharInfo : String?
    
    //This is the image picker
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    var body: some View {
        ScrollView (.vertical, showsIndicators: false) {
            Group {
                LazyVGrid(
                    columns:
                        [
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ],
                    spacing: 0
                ) {
                    ZStack{
                        HStack (alignment: .bottom, spacing: 0){
                            VStack(alignment: .leading, spacing: 0) {
                                Spacer()
                                Button{
                                    showDeleteImageAlert.toggle()
                                }label: {
                                    Image(systemName: "trash")
                                        .foregroundColor(.primary)
                                }
                            }
                            .padding(.horizontal)
                            Spacer()
                        }
                        .alert("Biztosan törlöd a fotót?", isPresented: $showDeleteImageAlert) {
                            Button("OK") {
                                deleteImage()
                            }
                            Button("Vissza", role: .cancel) { }
                        }
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.primary, lineWidth: 2)
                            .frame(width: 100, height: 120, alignment: .top)
                            .background(.secondary)
                            .cornerRadius(15)
                            .shadow(radius: 2, y: 2)
                        Button{
                            showingImagePicker = true
                        }label:{
                            ZStack{
                                VStack (alignment: .center, spacing: 0){
                                    Image(systemName: "person")
                                        .resizable()
                                        .scaledToFit()
                                    Text("Válassz")
                                        .font(.system(size: 10).smallCaps().weight(.medium))
                                        .padding(.top, 5)
                                    Text("fotót")
                                        .font(.system(size: 10).smallCaps().weight(.medium))
                                }
                                .foregroundColor(.primary)
                                .padding()
                                .frame(width: 80, height: 100, alignment: .center)
                               
                                if image != nil {
                                    image?
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 120, alignment: .top)
                                    .cornerRadius(15)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(Color.primary, lineWidth: 2)
                                    )
                                } else {
                                    Image(uiImage: UIImage(data: character.charPhoto ?? Data()) ?? UIImage())
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 100, height: 120, alignment: .top)
                                        .cornerRadius(15)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 15)
                                                .stroke(Color.primary, lineWidth: 2)
                                        )
                                }
                            }
                        }
                        Text("\(character.level)")
                            .foregroundColor(.white)
                            .font(.system(size: 16).smallCaps().weight(.medium))
                            .padding(.vertical, 10)
                            .padding(.horizontal, 15)
                            .background(.orange.opacity(0.95))
                            .cornerRadius(15)
                            .shadow(radius: 1, y:1)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.primary, lineWidth: 1)
                            )
                            .offset(x: 40, y: -50)
                    }
                    
                    VStack (alignment: .leading, spacing: 0){
                        HStack (alignment: .center, spacing: 0){
                            HStack {
                                if selectedCharInfo == "TP" {
                                    Image(systemName: "circle.fill")
                                        .foregroundColor(.orange.opacity(0.7))
                                        .padding(.leading, 5)
                                        .padding(.trailing, -7)
                                }
                            }
                            Text("TP")
                                .titleStyle()
                            Spacer()
                            Button {
                                withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                    if selectedCharInfo != "TP" {
                                        selectedCharInfo = "TP"
                                    } else {
                                        selectedCharInfo = nil
                                    }
                                }
                                if moc.hasChanges {
                                    try? moc.save()
                                }
                                keyboardIsFocused = false
                            }label:{
                                Text("\(character.xp)")
                                    .charInfoStyle()
                            }
                        }
                        .charInfoStyleBg()
                        
                        HStack (alignment: .center, spacing: 0){
                            HStack {
                                if selectedCharInfo == "NextLevel" {
                                    Image(systemName: "circle.fill")
                                        .foregroundColor(.orange.opacity(0.7))
                                        .padding(.leading, 5)
                                        .padding(.trailing, -7)
                                }
                            }
                            Image(systemName: "arrow.up")
                                .titleStyle()
                            Spacer()
                            Button {
                                withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                    if selectedCharInfo != "NextLevel" {
                                        selectedCharInfo = "NextLevel"
                                    } else {
                                        selectedCharInfo = nil
                                    }
                                }
                            }label:{
                                Text("\(XpStartLevCalc.xpStartLevCalc(secCaste: character.wrappedSecondaryCaste, lvl: Int(character.level + 1)))")
                                    .charInfoStyle()
                            }
                        }
                        .charInfoStyleBg()
                        
                        HStack (alignment: .center, spacing: 0){
                            HStack {
                                if selectedCharInfo == "HM" {
                                    Image(systemName: "circle.fill")
                                        .foregroundColor(.orange.opacity(0.7))
                                        .padding(.leading, 5)
                                        .padding(.trailing, -7)
                                }
                            }
                            Text("HM")
                                .titleStyle()
                            Spacer()
                            Button {
                                withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                    if selectedCharInfo != "HM" {
                                        selectedCharInfo = "HM"
                                    } else {
                                        selectedCharInfo = nil
                                    }
                                }
                                if moc.hasChanges {
                                    try? moc.save()
                                }
                                keyboardIsFocused = false
                            }label:{
                                HStack{
                                    if EditHmView(character: character).hmPerLevel() != 0 {
                                        Text("+\(EditHmView(character: character).hmPerLevel())")
                                    } else {
                                        Text("\(EditHmView(character: character).hmMaxPerLevel())")
                                    }
                                }
                                .charInfoStyle()
                            }
                        }
                        .charInfoStyleBg()
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding(.top)
                
                if selectedCharInfo == "TP" {
                    VStack (alignment: .center, spacing: 4){
                        HStack{
                            Text("Tapasztalati pontok hozzáadása")
                            Spacer()
                        }
                        .headerStyle()
                        HStack {
                            TextField("0", text: $newXp)
                                .onChange(of: newXp) { newValue in
                                    newXp = String(newValue.prefix(6))
                                }
                                .onReceive(Just(newXp)) { newValue in
                                    let filtered = newValue.filter { "0123456789".contains($0) }
                                    if filtered != newValue {
                                        self.newXp = filtered
                                    }
                                }
                                .focused($keyboardIsFocused)
                                .keyboardType(.numberPad)
                                .onSubmit {
                                    keyboardIsFocused = false
                                }
                                .titleStyle()
                            Spacer()
                            Button {
                                newXp = ""
                                keyboardIsFocused = false
                            }label:{
                                Image(systemName: "trash")
                            }
                            .foregroundColor(newXp.isEmpty ? .gray : .primary)
                            .disabled(newXp.isEmpty)
                            Button {
                                character.xp += Int64(newXp) ?? 0
                                let level = XpCalculator.xpCalculator(charXp: Int64(character.xp), secCaste: character.secondaryCaste ?? "Harcos")
                                character.level = Int16(level)
                                newXp = ""
                                keyboardIsFocused = false
                            } label: {
                                Text("OK")
                                    .buttonStyleDisabled(isValid: !newXp.isEmpty)
                            }
                            .disabled(newXp.isEmpty)
                        }
                        .charInfoStyleBg()
                    }
                }
                
                if selectedCharInfo == "NextLevel" {
                    VStack (alignment: .center, spacing: 4){
                        HStack{
                            Text("Tapasztalati pontok szintenként")
                            Spacer()
                        }
                        .headerStyle()
                        HStack {
                            VStack {
                                ForEach(1...listViewModel.data.level, id: \.self) { lvl in
                                    HStack {
                                        Text("\(lvl). szint:")
                                        if lvl == (character.level + 1) { Image(systemName: "arrow.up") }
                                        Spacer()
                                        Text("\(XpStartLevCalc.xpStartLevCalc(secCaste: character.wrappedSecondaryCaste, lvl: lvl))")
                                    }
                                    .titleStyle()
                                    .background(.orange.opacity(lvl == character.level ? 0.2 : 0))
                                    .background(.orange.opacity(lvl == (character.level + 1) ? 0.7 : 0))
                                }
                            }
                        }
                        .charInfoStyleBg()
                    }
                    .onAppear{
                        listViewModel.data.level = Int(character.level) + 1
                    }
                }
                
                if selectedCharInfo == "HM" {
                    VStack (alignment: .center, spacing: 4){
                        HStack{
                            Text("Harcérték módosítók")
                            Spacer()
                        }
                        .headerStyle()
                        VStack {
                            EditHmView(character: character)
                        }
                    }
                }
                
                LazyVGrid(
                    columns:
                        [
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ]
                ) {
                    HStack (alignment: .center, spacing: 0){
                        HStack {
                            if selectedCharInfo == "ÉP" {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.orange.opacity(0.7))
                                    .padding(.leading, 5)
                                    .padding(.trailing, -7)
                            }
                        }
                        Text("ÉP")
                            .titleStyle()
                        Spacer()
                        Button {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                if selectedCharInfo != "ÉP" {
                                    selectedCharInfo = "ÉP"
                                } else {
                                    selectedCharInfo = nil
                                }
                            }
                            if moc.hasChanges {
                                try? moc.save()
                            }
                        }label:{
                            Text("\(character.healthPointAct) / \(character.healthPoint)")
                                .charInfoStyle()
                        }
                    }
                    .charInfoStyleBg()
                    
                    HStack (alignment: .center, spacing: 0){
                        HStack {
                            if selectedCharInfo == "FP" {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.orange.opacity(0.7))
                                    .padding(.leading, 5)
                                    .padding(.trailing, -7)
                            }
                        }
                        Text("FP")
                            .titleStyle()
                        Spacer()
                        Button{
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                if selectedCharInfo != "FP" {
                                    selectedCharInfo = "FP"
                                } else {
                                    selectedCharInfo = nil
                                }
                            }
                            if moc.hasChanges {
                                try? moc.save()
                            }
                        }label:{
                            Text("\(character.painPointAct) / \(character.painPoint)")
                                .charInfoStyle()
                        }
                    }
                    .charInfoStyleBg()
                }
                
                if selectedCharInfo == "ÉP" {
                    VStack (alignment: .leading) {
                        HStack{
                            Text("Életerő pontok módosítása")
                            Spacer()
                        }
                        .headerStyle()
                        HStack {
                            Button {
                                listViewModel.data.healthPointAct -= newHealthPointAct
                                if listViewModel.data.healthPointAct < 0 {
                                    listViewModel.data.healthPointAct = 0
                                }
                                character.healthPointAct = Int16(listViewModel.data.healthPointAct)
                            } label: {
                                Image(systemName: "minus")
                                    .buttonStyleDisabled(isValid: listViewModel.data.healthPointAct > 0)
                            }
                            .disabled(listViewModel.data.healthPointAct <= 0)
                            Spacer()
                            Text("\(listViewModel.data.healthPointAct)")
                                .charInfoStyle()
                                .onAppear {
                                    listViewModel.data.healthPointAct = Int(character.healthPointAct)
                                }
                            Spacer()
                            Button {
                                listViewModel.data.healthPointAct += newHealthPointAct
                                if listViewModel.data.healthPointAct >= character.healthPoint {
                                    listViewModel.data.healthPointAct = Int(character.healthPoint)
                                }
                                character.healthPointAct = Int16(listViewModel.data.healthPointAct)
                            } label: {
                                Image(systemName: "plus")
                                    .buttonStyleDisabled(isValid: listViewModel.data.healthPointAct < character.healthPoint)
                            }
                            .disabled(listViewModel.data.healthPointAct >= character.healthPoint)
                        }
                        .charInfoStyleBg()
                        HStack {
                            Picker("", selection: $newHealthPointAct) {
                                ForEach(1..<6, id:\.self) { number in
                                    Text("\(number)")
                                }
                            }
                            .pickerStyle(.segmented)
                        }
                        .padding(.horizontal)
                    }
                }
                
                if selectedCharInfo == "FP" {
                    VStack (alignment: .leading) {
                        HStack{
                            Text("Fájdalomtűrés pontok módosítása")
                            Spacer()
                        }
                        .headerStyle()
                        HStack {
                            Button {
                                listViewModel.data.painPointAct -= newPainPointAct
                                if listViewModel.data.painPointAct < 0 {
                                    listViewModel.data.painPointAct = 0
                                }
                                character.painPointAct = Int16(listViewModel.data.painPointAct)
                            } label: {
                                Image(systemName: "minus")
                                    .buttonStyleDisabled(isValid: listViewModel.data.painPointAct > 0)
                            }
                            .disabled(listViewModel.data.painPointAct <= 0)
                            Spacer()
                            Text("\(listViewModel.data.painPointAct)")
                                .charInfoStyle()
                                .onAppear {
                                    listViewModel.data.painPointAct = Int(character.painPointAct)
                                }
                            Spacer()
                            Button {
                                listViewModel.data.painPointAct += newPainPointAct
                                if listViewModel.data.painPointAct >= character.painPoint {
                                    listViewModel.data.painPointAct = Int(character.painPoint)
                                }
                                character.painPointAct = Int16(listViewModel.data.painPointAct)
                            } label: {
                                Image(systemName: "plus")
                                    .buttonStyleDisabled(isValid: listViewModel.data.painPointAct < character.painPoint)
                            }
                            .disabled(listViewModel.data.painPointAct >= character.painPoint)
                        }
                        .charInfoStyleBg()
                        HStack {
                            Picker("", selection: $newPainPointAct) {
                                ForEach(1..<11, id:\.self) { number in
                                    Text("\(number)")
                                }
                            }
                            .pickerStyle(.segmented)
                        }
                        .padding(.horizontal)
                    }
                }
                
                Image(systemName: "circle.grid.cross.left.filled")
                    .padding()
                    .foregroundColor(.gray)
                
            }
// tulajdosnagok
            Group {
                LazyVGrid (
                    columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible()),
                        GridItem(.flexible()),
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ]
                ){
                    VStack (alignment: .center, spacing: 0) {
                        Text("Erő")
                            .font(.system(size: 18).smallCaps().weight(.light))
                        Text("\(character.strength)")
                            .itemStyle()
                    }
                    VStack (alignment: .center, spacing: 0) {
                        Text("Gyo")
                            .font(.system(size: 18).smallCaps().weight(.light))
                        if character.armorMGT != 0 {
                            Text("\(character.speedModified)")
                                .itemStyle()
                        } else {
                            Text("\(character.speed)")
                                .itemStyle()
                        }
                    }
                    VStack (alignment: .center, spacing: 0) {
                        Text("Ügy")
                            .font(.system(size: 18).smallCaps().weight(.light))
                        if character.armorMGT != 0 {
                            Text("\(character.agilityModified)")
                                .itemStyle()
                        } else {
                            Text("\(character.agility)")
                                .itemStyle()
                        }
                    }
                    VStack (alignment: .center, spacing: 0) {
                        Text("Áll")
                            .font(.system(size: 18).smallCaps().weight(.light))
                        Text("\(character.endurance)")
                            .itemStyle()
                    }
                    VStack (alignment: .center, spacing: 0) {
                        Text("Egé")
                            .font(.system(size: 18).smallCaps().weight(.light))
                        Text("\(character.health)")
                            .itemStyle()
                    }
                    VStack (alignment: .center, spacing: 0) {
                        Text("Szé")
                            .font(.system(size: 18).smallCaps().weight(.light))
                        Text("\(character.beauty)")
                            .itemStyle()
                    }
                    VStack (alignment: .center, spacing: 0) {
                        Text("Int")
                            .font(.system(size: 18).smallCaps().weight(.light))
                        Text("\(character.intelligence)")
                            .itemStyle()
                    }
                    VStack (alignment: .center, spacing: 0) {
                        Text("Aka")
                            .font(.system(size: 18).smallCaps().weight(.light))
                        Text("\(character.willpower)")
                            .itemStyle()
                    }
                    VStack (alignment: .center, spacing: 0) {
                        Text("Asz")
                            .font(.system(size: 18).smallCaps().weight(.light))
                        Text("\(character.astral)")
                            .itemStyle()
                    }
                    VStack (alignment: .center, spacing: 0) {
                        Text("Érz")
                            .font(.system(size: 18).smallCaps().weight(.light))
                        Text("\(character.perception)")
                            .itemStyle()
                    }
                }
                .padding(.vertical, 10)
                .padding(.horizontal)
                .ignoresSafeArea(.all)
                .background(.ultraThinMaterial)
                
                Image(systemName: "circle.grid.cross.up.filled")
                    .padding()
                    .foregroundColor(.gray)
            }
//Harcertekek
            Group {
                HStack (alignment: .center, spacing: 0) {
                    HStack {
                        if selectedCharInfo == "KÉ" {
                            Image(systemName: "circle.fill")
                                .foregroundColor(.orange.opacity(0.7))
                                .padding(.leading, 5)
                                .padding(.trailing, -7)
                        }
                    }
                    Text("Kezdeményező Érték")
                        .titleStyle()
                    Spacer()
                    Button {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                            if selectedCharInfo != "KÉ" {
                                selectedCharInfo = "KÉ"
                            } else {
                                selectedCharInfo = nil
                            }
                        }
                    }label:{
                        Text("\(character.ke)")
                            .charInfoStyle()
                            .padding(.leading, 4)
                    }
                }
                .charInfoStyleBg()
                
                if selectedCharInfo == "KÉ" {
                    HStack {
                        VStack (alignment: .leading) {
                            Text("Alap: \(fightPointCalculator.fightPointCalc(character.wrappedSecondaryCaste).ke)")
                            HStack (spacing:0){
                                Text("Hozzáadott Harcmódosítók: \(character.addKe)")
                                if fightPointCalculator.hmPointCalc(character.wrappedSecondaryCaste, Int(character.level)).ke != 0 {
                                    Text("(kötelező: \(fightPointCalculator.hmPointCalc(character.wrappedSecondaryCaste, Int(character.level)).ve * Int(character.level)))")
                                }
                            }
                            Text("Harcérték járulék (Gyorsaság + Ügyesség 10 feletti része): \((character.speed - 10) + (character.agility - 10))")
                            if character.secondaryCaste == "Fejvadász" || character.secondaryCaste == "Tolvaj" || character.secondaryCaste == "Boszorkánymester" {
                                Text("Karakter Bónusz minden második szinten: \(fightPointCalculator.hmPointBonusShow(character.secondaryCaste ?? "Harcos"))")
                            }
                        }
                        .titleInfoStyle()
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .charInfoStyleBg()
                }
            }
            
            Group {
                HStack (alignment: .center, spacing: 0) {
                    HStack {
                        if selectedCharInfo == "TÉ" {
                            Image(systemName: "circle.fill")
                                .foregroundColor(.orange.opacity(0.7))
                                .padding(.leading, 5)
                                .padding(.trailing, -7)
                        }
                    }
                    Text("Támadó Érték")
                        .titleStyle()
                    Spacer()
                    Button {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                            if selectedCharInfo != "TÉ" {
                                selectedCharInfo = "TÉ"
                            } else {
                                selectedCharInfo = nil
                            }
                        }
                    }label:{
                        Text("\(character.te)")
                            .charInfoStyle()
                            .padding(.leading, 4)
                    }
                }
                .charInfoStyleBg()
                
                if selectedCharInfo == "TÉ" {
                    HStack {
                        VStack (alignment: .leading) {
                            Text("Alap: \(fightPointCalculator.fightPointCalc(character.wrappedSecondaryCaste).te)")
                            HStack (spacing:0){
                                Text("Hozzáadott Harcmódosítók: \(character.addTe) ")
                                if fightPointCalculator.hmPointCalc(character.wrappedSecondaryCaste, Int(character.level)).te != 0 {
                                    Text("(kötelező: \(fightPointCalculator.hmPointCalc(character.wrappedSecondaryCaste, Int(character.level)).te * Int(character.level)))")
                                }
                            }
                            Text("Harcérték járulék (Erő + Gyorsaság + Ügyesség 10 feletti része): \((character.strength - 10) + (character.speed - 10) + (character.agility - 10))")
                            if character.armorMGT != 0 {
                                Text("A vért MGT-je miatt -\(character.armorMGT) a Gyorsaságból és -\(character.armorMGT) az Ügyességből.")
                            }
                        }
                        .titleInfoStyle()
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .charInfoStyleBg()
                }
            }
            
            Group {
                HStack (alignment: .center, spacing: 0) {
                    HStack {
                        if selectedCharInfo == "VÉ" {
                            Image(systemName: "circle.fill")
                                .foregroundColor(.orange.opacity(0.7))
                                .padding(.leading, 5)
                                .padding(.trailing, -7)
                        }
                    }
                    Text("Védő Érték")
                        .titleStyle()
                    Spacer()
                    Button {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                            if selectedCharInfo != "VÉ" {
                                selectedCharInfo = "VÉ"
                            } else {
                                selectedCharInfo = nil
                            }
                        }
                    }label:{
                        Text("\(character.ve)")
                            .charInfoStyle()
                            .padding(.leading, 4)
                    }
                }
                .charInfoStyleBg()
                
                if selectedCharInfo == "VÉ" {
                    HStack {
                        VStack (alignment: .leading) {
                            Text("Alap: **\(fightPointCalculator.fightPointCalc(character.wrappedSecondaryCaste).ve)**")
                            HStack (spacing:0){
                                Text("Hozzáadott Harcmódosítók: **\(character.addVe)** ")
                                if fightPointCalculator.hmPointCalc(character.wrappedSecondaryCaste, Int(character.level)).ve != 0 {
                                    Text("(kötelező: **\(fightPointCalculator.hmPointCalc(character.wrappedSecondaryCaste, Int(character.level)).ve * Int(character.level))**)")
                                }
                            }
                            Text("Harcérték járulék (Gyorsaság + Ügyesség 10 feletti része): **\((character.speed - 10) + (character.agility - 10))**")
                            if character.armorMGT != 0 {
                                Text("A vért MGT-je miatt **-\(character.armorMGT)** a Gyorsaságból és **-\(character.armorMGT)** az Ügyességből.")
                            }
                        }
                        .titleInfoStyle()
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .charInfoStyleBg()
                }
            }
            
            Group {
                HStack (alignment: .center, spacing: 0) {
                    HStack {
                        if selectedCharInfo == "CÉ" {
                            Image(systemName: "circle.fill")
                                .foregroundColor(.orange.opacity(0.7))
                                .padding(.leading, 5)
                                .padding(.trailing, -7)
                        }
                    }
                    Text("Célzó Érték")
                        .titleStyle()
                    Spacer()
                    Button {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                            if selectedCharInfo != "CÉ" {
                                selectedCharInfo = "CÉ"
                            } else {
                                selectedCharInfo = nil
                            }
                        }
                    }label:{
                        Text("\(character.ce)")
                            .charInfoStyle()
                            .padding(.leading, 4)
                    }
                }
                .charInfoStyleBg()
                
                if selectedCharInfo == "CÉ" {
                    HStack {
                        VStack (alignment: .leading) {
                            Text("Alap: \(fightPointCalculator.fightPointCalc(character.wrappedSecondaryCaste).ce)")
                            HStack (spacing:0){
                                Text("Hozzáadott Harcmódosítók: \(character.addCe)")
                                if fightPointCalculator.hmPointCalc(character.wrappedSecondaryCaste, Int(character.level)).ce != 0 {
                                    Text("(kötelező: \(fightPointCalculator.hmPointCalc(character.wrappedSecondaryCaste, Int(character.level)).ve * Int(character.level)))")
                                }
                            }
                            Text("Harcérték járulék (Ügyesség 10 feletti része): \(character.agility - 10)")
                        }
                        .titleInfoStyle()
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .charInfoStyleBg()
                }
            }
            
            Group {
                Image(systemName: "circle.grid.cross.right.filled")
                    .padding()
                    .foregroundColor(.gray)
                Group {
                    HStack (alignment: .center, spacing: 0) {
                        HStack {
                            if selectedCharInfo == "Név" {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.orange.opacity(0.7))
                                    .padding(.leading, 5)
                                    .padding(.trailing, -7)
                            }
                        }
                        Text("Név")
                            .titleStyle()
                        Spacer()
                        Button{
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                if selectedCharInfo != "Név" {
                                    selectedCharInfo = "Név"
                                } else {
                                    selectedCharInfo = nil
                                }
                            }
                        }label:{
                            Text("\(character.name ?? "Név")")
                                .charInfoStyle()
                        }
                    }
                    .charInfoStyleBg()
                    
                    if selectedCharInfo == "Név" {
                        VStack{
                            HStack{
                                Text("Név módosítása")
                                Spacer()
                            }
                            .headerStyle()
                            HStack{
                                TextField("Új név", text: $listViewModel.data.name)
                                    .onChange(of: listViewModel.data.name) { newValue in
                                        listViewModel.data.name = String(newValue.prefix(18))
                                    }
                                    .focused($keyboardIsFocused)
                                    .keyboardType(.default)
                                    .onSubmit {
                                        keyboardIsFocused = false
                                    }
                                    .onAppear {
                                        listViewModel.data.name = character.wrappedName
                                    }
                                    .titleStyle()
                                Spacer()
                                Button {
                                    withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                        character.name = listViewModel.data.name
                                        if moc.hasChanges {
                                            try? moc.save()
                                        }
                                        keyboardIsFocused = false
                                        selectedCharInfo = nil
                                    }
                                } label: {
                                    Image(systemName: "checkmark")
                                        .buttonStyleOn()
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .charInfoStyleBg()
                        }
                    }
                }
                
                Group {
                    HStack (alignment: .center, spacing: 0) {
                        HStack {
                            if selectedCharInfo == "Faj" {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.orange.opacity(0.7))
                                    .padding(.leading, 5)
                                    .padding(.trailing, -7)
                            }
                        }
                        Text("Faj")
                            .titleStyle()
                        Spacer()
                        Button {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                if selectedCharInfo != "Faj" {
                                    selectedCharInfo = "Faj"
                                } else {
                                    selectedCharInfo = nil
                                }
                            }
                        }label:{
                            Text("\(character.wrappedRace)")
                                .charInfoStyle()
                        }
                    }
                    .charInfoStyleBg()
                    if selectedCharInfo == "Faj" {
                        VStack {
                            EditRaceView(character: character, selectedCharInfo: $selectedCharInfo)
                        }
                        .frame(maxWidth: .infinity)
                    }
                    
                    HStack (alignment: .center, spacing: 0) {
                        Text("Kaszt")
                            .titleStyle()
                        Spacer()
                        Button {
                            showSheetCaste = true
                        }label:{
                            Text("\(character.wrappedSecondaryCaste)")
                                .charInfoStyle()
                        }
                        .sheet(isPresented: $showSheetCaste) {
                            EditCasteView(character: character, showSheetCaste: $showSheetCaste)
                        }
                    }
                    .charInfoStyleBg()
                    
                    HStack (alignment: .center, spacing: 0) {
                        HStack {
                            if selectedCharInfo == "Jellem" {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.orange.opacity(0.7))
                                    .padding(.leading, 5)
                                    .padding(.trailing, -7)
                            }
                        }
                        Text("Jellem")
                            .titleStyle()
                        Spacer()
                        Button {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                if selectedCharInfo != "Jellem" {
                                    selectedCharInfo = "Jellem"
                                } else {
                                    selectedCharInfo = nil
                                }
                            }
                        }label:{
                            Text(character.wrappedAlignment)
                                .charInfoStyle()
                        }
                    }
                    .charInfoStyleBg()
                    if selectedCharInfo == "Jellem" {
                        VStack {
                            EditAlignmentView(character: character, selectedCharInfo: $selectedCharInfo)
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
                 
                Group {
                    HStack (alignment: .center, spacing: 0) {
                        HStack {
                            if selectedCharInfo == "Religion" {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.orange.opacity(0.7))
                                    .padding(.leading, 5)
                                    .padding(.trailing, -7)
                            }
                        }
                        Text("Vallás")
                            .titleStyle()
                        Spacer()
                        Button{
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                if selectedCharInfo != "Religion" {
                                    selectedCharInfo = "Religion"
                                } else {
                                    selectedCharInfo = nil
                                }
                            }
                        }label:{
                            Text(character.wrappedReligion)
                                .charInfoStyle()
                        }
                    }
                    .charInfoStyleBg()
                    if selectedCharInfo == "Religion" {
                        VStack {
                            HStack{
                                Text("Vallás módosítása")
                                Spacer()
                            }
                            .headerStyle()
                            HStack{
                                TextField("Új vallás...", text: $listViewModel.data.religion)
                                    .onChange(of: listViewModel.data.religion) { newValue in
                                        listViewModel.data.religion = String(newValue.prefix(18))
                                    }
                                    .focused($keyboardIsFocused)
                                    .keyboardType(.default)
                                    .onSubmit {
                                        keyboardIsFocused = false
                                    }
                                    .onAppear {
                                        listViewModel.data.religion = character.wrappedReligion
                                    }
                                    .titleStyle()
                                Spacer()
                                Button {
                                    withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                        character.religion = listViewModel.data.religion
                                        if moc.hasChanges {
                                            try? moc.save()
                                        }
                                        keyboardIsFocused = false
                                        selectedCharInfo = nil
                                    }
                                } label: {
                                    Image(systemName: "checkmark")
                                        .buttonStyleOn()
                                }
                            }
                            .charInfoStyleBg()
                        }
                    }
                }
            }
            
            Group {
                Image(systemName: "circle.grid.cross.down.filled")
                    .padding()
                    .foregroundColor(.gray)
                
                VStack (alignment: .leading) {
                    HStack {
                        Text(character.wrappedCharDescription.count == 0 ? "ÚJ leírás hozzáadása..." : "A karakter leírása...")
                            .foregroundColor(.gray.opacity(0.6))
                            .titleInfoStyle()
                        Spacer()
                        Button{
                            listViewModel.data.charDescription = character.wrappedCharDescription
                            showSheetEditCharDescription = true
                        }label:{
                            Image(systemName: character.wrappedCharDescription.count == 0 ? "plus": "square.and.pencil")
                                .buttonStyleOn()
                        }
                        .sheet(isPresented: $showSheetEditCharDescription) {
                            EditCharDescriptionView(character: character, showSheetEditCharDescription: $showSheetEditCharDescription)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    if character.wrappedCharDescription.count != 0 {
                        Text(character.wrappedCharDescription)
                            .titleInfoStyle()
                            .padding(.bottom)
                    }
                }
                .charInfoStyleBg()
            }
            Spacer()
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onChange(of: inputImage) { _ in
            saveImage()
            print("saved")
        }
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            ImagePicker(image: $inputImage)
        }
    }
    
    func calcAlapKe() -> Int {
        Int(character.ke) - ((fightPointCalculator.hmPointCalc(character.secondaryCaste ?? "Harcos", Int(character.level)).keBonus) +
         ((Int(character.speed) - 10) + (Int(character.agility) - 10)) +
         Int(character.addKe))
    }
    
    //save image to CoreData
    func saveImage() {
        let pickedImage = inputImage?.jpegData(compressionQuality: 0.1)
        
        character.charPhoto = pickedImage
        
        if moc.hasChanges {
            try? moc.save()
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
    
    func deleteImage() {
        character.charPhoto = nil
        if moc.hasChanges {
            try? moc.save()
        }
    }
}



//struct CharacterView_Previews: PreviewProvider {
//    static var previews: some View {
//        CharacterView()
//    }
//}
