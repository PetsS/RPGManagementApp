//
//  EditHmView.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 26/10/2022.
//

import SwiftUI

struct EditHmView: View {
    let character: Character
    
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.managedObjectContext) var moc
    @FocusState private var keyboardIsFocused: Bool
    
    @State private var addXp: Int64 = 0
    @State private var addedKe = 0
    @State private var addedTe = 0
    @State private var addedVe = 0
    @State private var addedCe = 0
    
    var body: some View {
        VStack {
            Group {
                HStack (alignment: .center, spacing: 0) {
                    Text("KÉ")
                        .font(.system(size: 18).smallCaps().weight(.light))
                        .padding(.horizontal)
                    Spacer()
                    
                    HStack(spacing:0){
                        Text("HM: +\(listViewModel.data.addKe)")
                            .font(.system(size: 12).smallCaps().weight(.light))
                            .padding(.horizontal, 4)
                        if fightPointCalculator.hmPointCalc(character.wrappedSecondaryCaste, Int(character.level)).ke != 0 {
                            Text("(+\(fightPointCalculator.hmPointCalc(character.wrappedSecondaryCaste, Int(character.level)).ke * Int(character.level)))")
                                .font(.system(size: 12).smallCaps().weight(.light))
                        }
                        if !fightPointCalculator.hmPointBonusShow(character.wrappedSecondaryCaste).isEmpty {
                            Text("\(fightPointCalculator.hmPointBonusShow(character.wrappedSecondaryCaste))")
                                .font(.system(size: 12).smallCaps().weight(.light))
                                .padding(.horizontal, 4)
                        }
                    }
                    
                    Button{
                        listViewModel.data.ke -= 1
                        listViewModel.data.addKe -= 1
                        listViewModel.data.hm += 1
                        addedKe += 1
                    }label:{
                        Image(systemName: "arrow.uturn.backward")
                            .buttonStyleDisabled(isValid: addedKe != 0)
                    }
                    .disabled(addedKe == 0)
                    .padding(.horizontal, 4)
                    
                    Button{
                        listViewModel.data.ke += 1
                        listViewModel.data.addKe += 1
                        listViewModel.data.hm -= 1
                        addedKe -= 1
                    }label:{
                        Image(systemName: "plus")
                            .buttonStyleDisabled(isValid: listViewModel.data.hm != 0)
                    }
                    .disabled(listViewModel.data.hm == 0)
                    .padding(.horizontal, 4)
                    Text("\(listViewModel.data.ke)")
                        .charInfoStyle()
                        .padding(.leading, 4)
                }
                .charInfoStyleBg()
            }
           
            Group {
                HStack (alignment: .center, spacing: 0) {
                    Text("TÉ")
                        .font(.system(size: 18).smallCaps().weight(.light))
                        .padding(.horizontal)
                    Spacer()
                    
                    HStack (spacing:0){
                        Text("HM: +\(listViewModel.data.addTe)")
                            .font(.system(size: 12).smallCaps().weight(.light))
                            .padding(.horizontal, 4)
                        if fightPointCalculator.hmPointCalc(character.wrappedSecondaryCaste, Int(character.level)).te != 0 {
                            Text("(+\(fightPointCalculator.hmPointCalc(character.wrappedSecondaryCaste, Int(character.level)).te * Int(character.level)))")
                                .font(.system(size: 12).smallCaps().weight(.light))
                        }
                    }
                    
                    Button{
                        listViewModel.data.te -= 1
                        listViewModel.data.addTe -= 1
                        listViewModel.data.hm += 1
                        addedTe += 1
                    }label:{
                        Image(systemName: "arrow.uturn.backward")
                            .buttonStyleDisabled(isValid: addedTe != 0)
                    }
                    .disabled(addedTe == 0)
                    .padding(.horizontal, 4)
                    
                    Button{
                        listViewModel.data.te += 1
                        listViewModel.data.addTe += 1
                        listViewModel.data.hm -= 1
                        addedTe -= 1
                    }label:{
                        Image(systemName: "plus")
                            .buttonStyleDisabled(isValid: listViewModel.data.hm != 0)
                    }
                    .disabled(listViewModel.data.hm == 0)
                    .padding(.horizontal, 4)
                    Text("\(tePerLevel())")
                        .charInfoStyle()
                        .padding(.leading, 4)
                }
                .charInfoStyleBg()
            }
            
            Group {
                HStack (alignment: .center, spacing: 0) {
                    Text("VÉ")
                        .font(.system(size: 18).smallCaps().weight(.light))
                        .padding(.horizontal)
                    Spacer()
                    
                    HStack (spacing:0){
                        Text("HM: +\(listViewModel.data.addVe)")
                            .font(.system(size: 12).smallCaps().weight(.light))
                            .padding(.horizontal, 4)
                        if fightPointCalculator.hmPointCalc(character.wrappedSecondaryCaste, Int(character.level)).ve != 0 {
                            Text("(+\(fightPointCalculator.hmPointCalc(character.wrappedSecondaryCaste, Int(character.level)).ve * Int(character.level)))")
                                .font(.system(size: 12).smallCaps().weight(.light))
                        }
                    }
                    
                    Button{
                        listViewModel.data.ve -= 1
                        listViewModel.data.addVe -= 1
                        listViewModel.data.hm += 1
                        addedVe += 1
                    }label:{
                        Image(systemName: "arrow.uturn.backward")
                            .buttonStyleDisabled(isValid: addedVe != 0)
                    }
                    .disabled(addedVe == 0)
                    .padding(.horizontal, 4)
                    
                    Button{
                        listViewModel.data.ve += 1
                        listViewModel.data.addVe += 1
                        listViewModel.data.hm -= 1
                        addedVe -= 1
                    }label:{
                        Image(systemName: "plus")
                            .buttonStyleDisabled(isValid: listViewModel.data.hm != 0)
                    }
                    .disabled(listViewModel.data.hm == 0)
                    .padding(.horizontal, 4)
                    Text("\(listViewModel.data.ve)")
                        .charInfoStyle()
                        .padding(.leading, 4)
                }
                .charInfoStyleBg()
            }
            
            Group {
                HStack (alignment: .center, spacing: 0) {
                    Text("CÉ")
                        .font(.system(size: 18).smallCaps().weight(.light))
                        .padding(.horizontal)
                    Spacer()
                    
                    HStack (spacing:0){
                        Text("HM: +\(listViewModel.data.addCe)")
                            .font(.system(size: 12).smallCaps().weight(.light))
                            .padding(.horizontal, 4)
                        if fightPointCalculator.hmPointCalc(character.wrappedSecondaryCaste, Int(character.level)).ce != 0 {
                            Text("(+\(fightPointCalculator.hmPointCalc(character.wrappedSecondaryCaste, Int(character.level)).ce * Int(character.level)))")
                                .font(.system(size: 12).smallCaps().weight(.light))
                        }
                    }
                    
                    Button{
                        listViewModel.data.ce -= 1
                        listViewModel.data.addCe -= 1
                        listViewModel.data.hm += 1
                        addedCe += 1
                    }label:{
                        Image(systemName: "arrow.uturn.backward")
                            .buttonStyleDisabled(isValid: addedCe != 0)
                    }
                    .disabled(addedCe == 0)
                    .padding(.horizontal, 4)
                    
                    Button{
                        listViewModel.data.ce += 1
                        listViewModel.data.addCe += 1
                        listViewModel.data.hm -= 1
                        addedCe -= 1
                    }label:{
                        Image(systemName: "plus")
                            .buttonStyleDisabled(isValid: listViewModel.data.hm != 0)
                    }
                    .disabled(listViewModel.data.hm == 0)
                    .padding(.horizontal, 4)
                    Text("\(listViewModel.data.ce)")
                        .charInfoStyle()
                        .padding(.leading, 4)
                }
                .charInfoStyleBg()
            }
            
            HStack (alignment: .firstTextBaseline, spacing: 0){
                Text(listViewModel.data.hm > 0 ? "Maradt még \(listViewModel.data.hm) HM." : "Nincs szétosztható HM.")
                    .foregroundColor(listViewModel.data.hm > 0 ? .orange : .gray)
                    .titleStyle()
                Spacer()
                Button {
                    character.xp = Int64(listViewModel.data.xp)
                    character.ke = Int16(listViewModel.data.ke)
                    character.te = Int16(tePerLevel())
                    character.ve = Int16(listViewModel.data.ve)
                    character.ce = Int16(listViewModel.data.ce)
                    character.addKe = Int16(listViewModel.data.addKe)
                    character.addTe = Int16(listViewModel.data.addTe)
                    character.addVe = Int16(listViewModel.data.addVe)
                    character.addCe = Int16(listViewModel.data.addCe)
                    character.hm = Int16(listViewModel.data.hm)
                    
                    if moc.hasChanges {
                        try? moc.save()
                    }
                    
                    listViewModel.data.hm = 0
                    
                } label: {
                    Text("OK")
                    .buttonStyleOn()
                }
            }
            .charInfoStyleBg()
            .frame(maxWidth: .infinity)
        }
        .onAppear{
            listViewModel.data.level = Int(character.level)
            listViewModel.data.xp = Int(character.xp)
            listViewModel.data.ke = kePerLevel()
//            listViewModel.data.te = tePerLevel()
            listViewModel.data.ve = vePerLevel()
            listViewModel.data.ce = cePerLevel()
            listViewModel.data.addKe = Int(character.addKe)
            listViewModel.data.addTe = Int(character.addTe)
            listViewModel.data.addVe = Int(character.addVe)
            listViewModel.data.addCe = Int(character.addCe)
            listViewModel.data.hm = hmPerLevel()
        }
    }
    
    func hmPerLevel() -> Int {
        (fightPointCalculator.fightPointCalc(character.secondaryCaste ?? "Harcos").hm - (
         fightPointCalculator.hmPointCalc(character.secondaryCaste ?? "Harcos", Int(character.level)).ke +
         fightPointCalculator.hmPointCalc(character.secondaryCaste ?? "Harcos", Int(character.level)).te +
         fightPointCalculator.hmPointCalc(character.secondaryCaste ?? "Harcos", Int(character.level)).ve +
         fightPointCalculator.hmPointCalc(character.secondaryCaste ?? "Harcos", Int(character.level)).ce
        )) * Int(character.level) - Int(character.addKe) - Int(character.addTe) - Int(character.addVe) - Int(character.addCe)
    }
    
    func hmMaxPerLevel() -> Int {
        (fightPointCalculator.fightPointCalc(character.secondaryCaste ?? "Harcos").hm - (
         fightPointCalculator.hmPointCalc(character.secondaryCaste ?? "Harcos", Int(character.level)).ke +
         fightPointCalculator.hmPointCalc(character.secondaryCaste ?? "Harcos", Int(character.level)).te +
         fightPointCalculator.hmPointCalc(character.secondaryCaste ?? "Harcos", Int(character.level)).ve +
         fightPointCalculator.hmPointCalc(character.secondaryCaste ?? "Harcos", Int(character.level)).ce
        )) * Int(character.level)
    }
    
    func kePerLevel() -> Int {
        fightPointCalculator.fightPointCalc(character.secondaryCaste ?? "Harcos").ke +
        (fightPointCalculator.hmPointCalc(character.secondaryCaste ?? "Harcos", Int(character.level)).keBonus * Int(character.level)) +
        Int(character.speed - 10) +
        Int(character.agility - 10) +
        (fightPointCalculator.hmPointCalc(character.secondaryCaste ?? "Harcos", Int(character.level)).ke * Int(character.level)) +
        Int(character.addKe)
        
    }
    
    func tePerLevel() -> Int {
        fightPointCalculator.fightPointCalc(character.wrappedSecondaryCaste).te +
        Int(character.strength - 10) +
        Int(character.speed - 10) +
        Int(character.agility - 10) +
        (fightPointCalculator.hmPointCalc(character.wrappedSecondaryCaste, Int(character.level)).te * Int(character.level)) +
        Int(character.addTe)
        
    }
    
    func vePerLevel() -> Int {
        fightPointCalculator.fightPointCalc(character.secondaryCaste ?? "Harcos").ve +
        Int(character.speed - 10) +
        Int(character.agility - 10) +
        (fightPointCalculator.hmPointCalc(character.secondaryCaste ?? "Harcos", Int(character.level)).ve * Int(character.level)) +
        Int(character.addVe)
        
    }
    
    func cePerLevel() -> Int {
        fightPointCalculator.fightPointCalc(character.secondaryCaste ?? "Harcos").ce +
        Int(character.speed - 10) +
        (fightPointCalculator.hmPointCalc(character.secondaryCaste ?? "Harcos", Int(character.level)).ce * Int(character.level)) +
        Int(character.addCe)
        
    }
    
}

//struct EditXpView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditXpView()
//    }
//}
