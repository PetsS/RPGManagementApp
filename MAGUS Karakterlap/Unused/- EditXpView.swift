////
////  EditXpView.swift
////  MAGUS Karakterlap
////
////  Created by Peter Szots on 26/10/2022.
////
//
//import SwiftUI
//
//struct EditXpView: View {
//    let character: Character
//    
//    @EnvironmentObject var listViewModel: ListViewModel
//    @Environment(\.managedObjectContext) var moc
//    @FocusState private var keyboardIsFocused: Bool
//    
//    @Binding var showSheetEditXp: Bool
//    
//    @State private var addXp: Int64 = 0
//    @State private var addedKe = 0
//    @State private var addedTe = 0
//    @State private var addedVe = 0
//    @State private var addedCe = 0
//    
//    var body: some View {
//        
//        
//        ScrollView {
//            if listViewModel.data.level < character.level {
//                HStack{
//                    Text("Szintlépés!")
//                        .titleStyle()
//                        .foregroundColor(.red)
//                }
//                .padding(.top)
//            }
//            HStack{
//                Text("Aktuális XP pontok: \(listViewModel.data.xp)")
//                Spacer()
//                Text("Szint: \(character.level)")
//            }
//            .headerStyle()
//            .padding(.top)
//            VStack (alignment: .center, spacing: 4){
//                HStack {
//                    TextField("XP", value: $addXp, format: .number)
//                        .focused($keyboardIsFocused)
//                        .keyboardType(.numberPad)
//                        .onSubmit {
//                            keyboardIsFocused = false
//                        }
//                        .titleStyle()
//                    Spacer()
//                    Button {
//                        addXp = 0
//                        keyboardIsFocused = false
//                    }label:{
//                        Image(systemName: "trash")
//                    }
//                    .foregroundColor(addXp == 0 ? .gray : .primary)
//                    .disabled(addXp == 0)
//                    Button {
//                        listViewModel.data.xp += Int(addXp)
//                        let level = XpCalculator.xpCalculator(charXp: Int64(listViewModel.data.xp), secCaste: character.secondaryCaste ?? "Harcos")
//                        character.level = Int16(level)
//                        
//                        listViewModel.data.hm = hmPerLevel()
//                        addXp = 0
//                        keyboardIsFocused = false
//                    } label: {
//                        Text("OK")
//                        .buttonStyleDisabled(isValid: addXp != 0)
//                    }
//                    .disabled(addXp == 0)
//                }
//                .charInfoStyleBg()
//                Text("A következő, \(character.level + 1). szint eléréséhez \(XpToNextLevCalc.xpToNextLevCalc(secCaste: character.secondaryCaste ?? "Harcos", lvl: Int(character.level), charXp: Int(character.xp))) pont kell.")
//                    .font(.system(size: 12).smallCaps().weight(.light))
//                    .padding(.horizontal, 4)
//            }
//            .padding(.bottom)
//            
//            HStack {
//                Text("Harcmódosítók")
//                    .headerStyle()
//                Spacer()
//            }
//            HStack {
//                Text(listViewModel.data.hm > 0 ? "\(character.level). szinten még \(listViewModel.data.hm) HM szétosztható a harcértékek között." : "Jelenleg nincsen szétosztható HM.")
//                    .foregroundColor(listViewModel.data.hm > 0 ? .red : .gray)
//                Spacer()
//            }
//            .titleStyle()
//            .charInfoStyleBg()
//            
//            Group {
//                HStack (alignment: .center, spacing: 0) {
//                    Text("KÉ")
//                        .font(.system(size: 18).smallCaps().weight(.light))
//                        .padding(.horizontal)
//                    Spacer()
//                    
//                    Text("HM: +\(listViewModel.data.addKe)")
//                        .font(.system(size: 12).smallCaps().weight(.light))
//                        .padding(.horizontal, 4)
//                    Text("\(fightPointCalculator.hmPointBonusShow(character.secondaryCaste ?? "Harcos"))")
//                        .font(.system(size: 12).smallCaps().weight(.light))
//                        .padding(.horizontal, 4)
//                    
//                    Button{
//                        listViewModel.data.ke -= 1
//                        listViewModel.data.addKe -= 1
//                        listViewModel.data.hm += 1
//                        addedKe += 1
//                    }label:{
//                        Image(systemName: "arrow.uturn.backward")
//                            .buttonStyleDisabled(isValid: addedKe != 0)
//                    }
//                    .disabled(addedKe == 0)
//                    .padding(.horizontal, 4)
//                    
//                    Button{
//                        listViewModel.data.ke += 1
//                        listViewModel.data.addKe += 1
//                        listViewModel.data.hm -= 1
//                        addedKe -= 1
//                    }label:{
//                        Image(systemName: "plus")
//                            .buttonStyleDisabled(isValid: listViewModel.data.hm != 0)
//                    }
//                    .disabled(listViewModel.data.hm == 0)
//                    .padding(.horizontal, 4)
//                    Text("\(listViewModel.data.ke)")
//                        .charInfoStyle()
//                        .padding(.leading, 4)
//                }
//                .charInfoStyleBg()
//            }
//           
//            Group {
//                HStack (alignment: .center, spacing: 0) {
//                    Text("TÉ")
//                        .font(.system(size: 18).smallCaps().weight(.light))
//                        .padding(.horizontal)
//                    Spacer()
//                    
//                    Text("HM: +\(listViewModel.data.addTe)")
//                        .font(.system(size: 12).smallCaps().weight(.light))
//                        .padding(.horizontal, 4)
//                    
//                    Button{
//                        listViewModel.data.te -= 1
//                        listViewModel.data.addTe -= 1
//                        listViewModel.data.hm += 1
//                        addedTe += 1
//                    }label:{
//                        Image(systemName: "arrow.uturn.backward")
//                            .buttonStyleDisabled(isValid: addedTe != 0)
//                    }
//                    .disabled(addedTe == 0)
//                    .padding(.horizontal, 4)
//                    
//                    Button{
//                        listViewModel.data.te += 1
//                        listViewModel.data.addTe += 1
//                        listViewModel.data.hm -= 1
//                        addedTe -= 1
//                    }label:{
//                        Image(systemName: "plus")
//                            .buttonStyleDisabled(isValid: listViewModel.data.hm != 0)
//                    }
//                    .disabled(listViewModel.data.hm == 0)
//                    .padding(.horizontal, 4)
//                    Text("\(listViewModel.data.te)")
//                        .charInfoStyle()
//                        .padding(.leading, 4)
//                }
//                .charInfoStyleBg()
//            }
//            
//            Group {
//                HStack (alignment: .center, spacing: 0) {
//                    Text("VÉ")
//                        .font(.system(size: 18).smallCaps().weight(.light))
//                        .padding(.horizontal)
//                    Spacer()
//                    
//                    Text("HM: +\(listViewModel.data.addVe)")
//                        .font(.system(size: 12).smallCaps().weight(.light))
//                        .padding(.horizontal, 4)
//                    
//                    Button{
//                        listViewModel.data.ve -= 1
//                        listViewModel.data.addVe -= 1
//                        listViewModel.data.hm += 1
//                        addedVe += 1
//                    }label:{
//                        Image(systemName: "arrow.uturn.backward")
//                            .buttonStyleDisabled(isValid: addedVe != 0)
//                    }
//                    .disabled(addedVe == 0)
//                    .padding(.horizontal, 4)
//                    
//                    Button{
//                        listViewModel.data.ve += 1
//                        listViewModel.data.addVe += 1
//                        listViewModel.data.hm -= 1
//                        addedVe -= 1
//                    }label:{
//                        Image(systemName: "plus")
//                            .buttonStyleDisabled(isValid: listViewModel.data.hm != 0)
//                    }
//                    .disabled(listViewModel.data.hm == 0)
//                    .padding(.horizontal, 4)
//                    Text("\(listViewModel.data.ve)")
//                        .charInfoStyle()
//                        .padding(.leading, 4)
//                }
//                .charInfoStyleBg()
//            }
//            
//            Group {
//                HStack (alignment: .center, spacing: 0) {
//                    Text("CÉ")
//                        .font(.system(size: 18).smallCaps().weight(.light))
//                        .padding(.horizontal)
//                    Spacer()
//                    
//                    Text("HM: +\(listViewModel.data.addCe)")
//                        .font(.system(size: 12).smallCaps().weight(.light))
//                        .padding(.horizontal, 4)
//                    
//                    Button{
//                        listViewModel.data.ce -= 1
//                        listViewModel.data.addCe -= 1
//                        listViewModel.data.hm += 1
//                        addedCe += 1
//                    }label:{
//                        Image(systemName: "arrow.uturn.backward")
//                            .buttonStyleDisabled(isValid: addedCe != 0)
//                    }
//                    .disabled(addedCe == 0)
//                    .padding(.horizontal, 4)
//                    
//                    Button{
//                        listViewModel.data.ce += 1
//                        listViewModel.data.addVe += 1
//                        listViewModel.data.hm -= 1
//                        addedCe -= 1
//                    }label:{
//                        Image(systemName: "plus")
//                            .buttonStyleDisabled(isValid: listViewModel.data.hm != 0)
//                    }
//                    .disabled(listViewModel.data.hm == 0)
//                    .padding(.horizontal, 4)
//                    Text("\(listViewModel.data.ce)")
//                        .charInfoStyle()
//                        .padding(.leading, 4)
//                }
//                .charInfoStyleBg()
//            }
//            
//        }
//        .onAppear{
//            listViewModel.data.level = Int(character.level)
//            listViewModel.data.xp = Int(character.xp)
//            listViewModel.data.ke = kePerLevel()
//            listViewModel.data.te = tePerLevel()
//            listViewModel.data.ve = vePerLevel()
//            listViewModel.data.ce = cePerLevel()
//            listViewModel.data.addKe = Int(character.addKe)
//            listViewModel.data.addTe = Int(character.addTe)
//            listViewModel.data.addVe = Int(character.addVe)
//            listViewModel.data.addCe = Int(character.addCe)
//            listViewModel.data.hm = hmPerLevel()
//        }
//        
//
//        //bottom bar
//        HStack {
//            Button {
//                showSheetEditXp.toggle()
//            } label: {
//                Image(systemName: "arrow.left")
//                .buttonStyleOn()
//            }
//            Spacer()
//            Text("XP hozzáadása")
//                .titleStyle()
//            Spacer()
//            Button {
//                character.xp = Int64(listViewModel.data.xp)
//                character.ke = Int16(listViewModel.data.ke)
//                character.te = Int16(listViewModel.data.te)
//                character.ve = Int16(listViewModel.data.ve)
//                character.ce = Int16(listViewModel.data.ce)
//                character.addKe = Int16(listViewModel.data.addKe)
//                character.addTe = Int16(listViewModel.data.addTe)
//                character.addVe = Int16(listViewModel.data.addVe)
//                character.addCe = Int16(listViewModel.data.addCe)
//                character.hm = Int16(listViewModel.data.hm)
//                
//                if moc.hasChanges {
//                    try? moc.save()
//                }
//                keyboardIsFocused = false
//                showSheetEditXp = false
//                
//                listViewModel.data.hm = 0
//            } label: {
//                Text("OK")
//                .buttonStyleOn()
//            }
//        }
//        .padding()
//    }
//    
//    func hmPerLevel() -> Int {
//        (fightPointCalculator.fightPointCalc(character.secondaryCaste ?? "Harcos").hm - (
//         fightPointCalculator.hmPointCalc(character.secondaryCaste ?? "Harcos", Int(character.level)).ke +
//         fightPointCalculator.hmPointCalc(character.secondaryCaste ?? "Harcos", Int(character.level)).te +
//         fightPointCalculator.hmPointCalc(character.secondaryCaste ?? "Harcos", Int(character.level)).ve +
//         fightPointCalculator.hmPointCalc(character.secondaryCaste ?? "Harcos", Int(character.level)).ce
//        )) * Int(character.level) - Int(character.addKe) - Int(character.addTe) - Int(character.addVe) - Int(character.addCe)
//    }
//    
//    func kePerLevel() -> Int {
//        fightPointCalculator.fightPointCalc(character.secondaryCaste ?? "Harcos").ke +
//        (fightPointCalculator.hmPointCalc(character.secondaryCaste ?? "Harcos", Int(character.level)).keBonus * Int(character.level)) +
//        Int(character.speed - 10) +
//        Int(character.agility - 10) +
//        (fightPointCalculator.hmPointCalc(character.secondaryCaste ?? "Harcos", Int(character.level)).ke * Int(character.level)) +
//        Int(character.addKe)
//        
//    }
//    
//    func tePerLevel() -> Int {
//        fightPointCalculator.fightPointCalc(character.secondaryCaste ?? "Harcos").te +
//        Int(character.strength - 10) +
//        Int(character.speed - 10) +
//        Int(character.agility - 10) +
//        (fightPointCalculator.hmPointCalc(character.secondaryCaste ?? "Harcos", Int(character.level)).te * Int(character.level)) +
//        Int(character.addTe)
//        
//    }
//    
//    func vePerLevel() -> Int {
//        fightPointCalculator.fightPointCalc(character.secondaryCaste ?? "Harcos").ve +
//        Int(character.speed - 10) +
//        Int(character.agility - 10) +
//        (fightPointCalculator.hmPointCalc(character.secondaryCaste ?? "Harcos", Int(character.level)).ve * Int(character.level)) +
//        Int(character.addVe)
//        
//    }
//    
//    func cePerLevel() -> Int {
//        fightPointCalculator.fightPointCalc(character.secondaryCaste ?? "Harcos").ce +
//        Int(character.speed - 10) +
//        (fightPointCalculator.hmPointCalc(character.secondaryCaste ?? "Harcos", Int(character.level)).ce * Int(character.level)) +
//        Int(character.addCe)
//        
//    }
//    
//}
//
////struct EditXpView_Previews: PreviewProvider {
////    static var previews: some View {
////        EditXpView()
////    }
////}
