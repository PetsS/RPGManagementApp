//
//  AddFightPointsView.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 29/10/2022.
//

import SwiftUI

struct AddFightPointsView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State private var isTapped = false
    
    @State private var actualHm = 0
    
    var totalKe: Int {
        fightPointCalculator.fightPointCalc(listViewModel.data.secondaryCaste).ke +
        fightPointCalculator.hmPointCalc(listViewModel.data.secondaryCaste, listViewModel.data.level).keBonus +
        (listViewModel.data.speed - 10) +
        (listViewModel.data.agility - 10) +
        (fightPointCalculator.hmPointCalc(listViewModel.data.secondaryCaste, listViewModel.data.level).ke * listViewModel.data.level) +
        listViewModel.data.addKe
    }
    
    var totalTe: Int {
        fightPointCalculator.fightPointCalc(listViewModel.data.secondaryCaste).te +
        (listViewModel.data.strength - 10) +
        (listViewModel.data.speed - 10) +
        (listViewModel.data.agility - 10) +
        (fightPointCalculator.hmPointCalc(listViewModel.data.secondaryCaste, listViewModel.data.level).te * listViewModel.data.level) +
        listViewModel.data.addTe
    }
    
    var totalVe: Int {
        fightPointCalculator.fightPointCalc(listViewModel.data.secondaryCaste).ve +
        (listViewModel.data.speed - 10) +
        (listViewModel.data.agility - 10) +
        (fightPointCalculator.hmPointCalc(listViewModel.data.secondaryCaste, listViewModel.data.level).ve * listViewModel.data.level) +
        listViewModel.data.addVe
    }
    
    var totalCe: Int {
        fightPointCalculator.fightPointCalc(listViewModel.data.secondaryCaste).ce +
        (listViewModel.data.speed - 10) +
        (fightPointCalculator.hmPointCalc(listViewModel.data.secondaryCaste, listViewModel.data.level).ce * listViewModel.data.level) +
        listViewModel.data.addCe
    }
    
    var hmPerLevel: Int {
        (fightPointCalculator.fightPointCalc(listViewModel.data.secondaryCaste).hm - (
            fightPointCalculator.hmPointCalc(listViewModel.data.secondaryCaste, listViewModel.data.level).ke +
            fightPointCalculator.hmPointCalc(listViewModel.data.secondaryCaste, listViewModel.data.level).te +
            fightPointCalculator.hmPointCalc(listViewModel.data.secondaryCaste, listViewModel.data.level).ve +
            fightPointCalculator.hmPointCalc(listViewModel.data.secondaryCaste, listViewModel.data.level).ce
        )) * listViewModel.data.level
    }
    
    var checkAmount: Bool {
        if listViewModel.data.hm <= 0 {
            return true
        }
        return false
    }
    
    var body: some View {
        
        ScrollView {
            HStack {
                Text("Kezdeményező érték")
                    .headerStyle()
                Spacer()
            }
            VStack (alignment: .leading){
                VStack(alignment: .leading, spacing: 0) {
                    Text("A \(listViewModel.data.secondaryCaste) kaszt KÉ alapja \(fightPointCalculator.fightPointCalc(listViewModel.data.secondaryCaste).ke).")
                    Text("Ehhez hozzájárul a gyorsaság (\(listViewModel.data.speed - 10)) és ügyesség 10 feletti része (\(listViewModel.data.agility - 10)), azaz összesen \((listViewModel.data.speed - 10) + (listViewModel.data.agility - 10)).")
                }
                .titleInfoStyle()
                HStack {
                    Text("KÉ pontjaid összesen: \(totalKe)")
                        .titleStyle()
                        .padding(.vertical, 2)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(Color.orange.opacity(0.2))
                        .cornerRadius(15)
                    Button {
                        listViewModel.data.addKe += 1
                        actualHm -= 1
                        listViewModel.data.hm = hmPerLevel + actualHm
                        listViewModel.data.ke = totalKe
                    }label: {
                        Image(systemName: "plus")
                            .buttonStyleDisabled(isValid: !checkAmount)
                    }
                    .disabled(checkAmount)
                }
                HStack {
                    Spacer()
                    Text("Maradt \(listViewModel.data.hm) HM")
                        .titleStyle()
                    Button {
                        if listViewModel.data.addKe != 0 {
                            listViewModel.data.addKe -= 1
                        }
                        actualHm += 1
                        listViewModel.data.hm = hmPerLevel + actualHm
                        listViewModel.data.ke = totalKe
                    }label: {
                        Image(systemName: "arrow.uturn.backward")
                            .buttonStyleDisabled(isValid: listViewModel.data.addKe != 0)
                    }
                    .disabled(listViewModel.data.addKe == 0)
                }
            }
            .padding(.bottom)
            .charInfoStyleBg()
            
            HStack {
                Text("Támadó érték")
                    .headerStyle()
                Spacer()
            }
            VStack (alignment: .leading){
                VStack(alignment: .leading, spacing: 0) {
                    Text("A \(listViewModel.data.secondaryCaste) kaszt TÉ alapja \(fightPointCalculator.fightPointCalc(listViewModel.data.secondaryCaste).te).")
                    Text("Ehhez hozzájárul az erő (\(listViewModel.data.strength - 10)),a gyorsaság (\(listViewModel.data.speed - 10)) és az ügyesség 10 feletti része (\(listViewModel.data.agility - 10)), azaz összesen \((listViewModel.data.strength - 10) + (listViewModel.data.speed - 10) + (listViewModel.data.agility - 10)).")
                }
                .titleInfoStyle()
                HStack {
                    Text("TÉ pontjaid összesen: \(totalTe)")
                        .titleStyle()
                        .padding(.vertical, 2)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(Color.orange.opacity(0.2))
                        .cornerRadius(15)
                    Button{
                        listViewModel.data.addTe += 1
                        actualHm -= 1
                        listViewModel.data.hm = hmPerLevel + actualHm
                        listViewModel.data.te = totalTe
                    }label: {
                        Image(systemName: "plus")
                            .buttonStyleDisabled(isValid: !checkAmount)
                    }
                    .disabled(checkAmount)
                }
                HStack {
                    Spacer()
                    Text("Maradt \(listViewModel.data.hm) HM")
                        .titleStyle()
                    Button{
                        listViewModel.data.addTe -= 1
                        actualHm += 1
                        listViewModel.data.hm = hmPerLevel + actualHm
                        listViewModel.data.te = totalTe
                    }label: {
                        Image(systemName: "arrow.uturn.backward")
                            .buttonStyleDisabled(isValid: listViewModel.data.addTe != 0)
                    }
                    .disabled(listViewModel.data.addTe == 0)
                }
            }
            .padding(.bottom)
            .charInfoStyleBg()
            
            HStack {
                Text("Védő érték")
                    .headerStyle()
                Spacer()
            }
            VStack (alignment: .leading){
                VStack(alignment: .leading, spacing: 0) {
                    Text("A \(listViewModel.data.secondaryCaste) kaszt VÉ alapja \(fightPointCalculator.fightPointCalc(listViewModel.data.secondaryCaste).ve).")
                    Text("Ehhez hozzájárul a gyorsaság (\(listViewModel.data.speed - 10)) és ügyesség 10 feletti része (\(listViewModel.data.agility - 10)), azaz összesen \((listViewModel.data.speed - 10) + (listViewModel.data.agility - 10)).")
                }
                .titleInfoStyle()
                HStack {
                    Text("VÉ pontjaid összesen: \(totalVe)")
                        .titleStyle()
                        .padding(.vertical, 2)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(Color.orange.opacity(0.2))
                        .cornerRadius(15)
                    Button{
                        listViewModel.data.addVe += 1
                        actualHm -= 1
                        listViewModel.data.hm = hmPerLevel + actualHm
                        listViewModel.data.ve = totalVe
                    }label: {
                        Image(systemName: "plus")
                            .buttonStyleDisabled(isValid: !checkAmount)
                    }
                    .disabled(checkAmount)
                }
                HStack {
                    Spacer()
                    Text("Maradt \(listViewModel.data.hm) HM")
                        .titleStyle()
                    Button{
                        listViewModel.data.addVe -= 1
                        actualHm += 1
                        listViewModel.data.hm = hmPerLevel + actualHm
                        listViewModel.data.ve = totalVe
                    }label: {
                        Image(systemName: "arrow.uturn.backward")
                            .buttonStyleDisabled(isValid: listViewModel.data.addVe != 0)
                    }
                    .disabled(listViewModel.data.addVe == 0)
                }
            }
            .padding(.bottom)
            .charInfoStyleBg()
            
            HStack {
                Text("Célzó érték")
                    .headerStyle()
                Spacer()
            }
            VStack (alignment: .leading){
                VStack(alignment: .leading, spacing: 0) {
                    Text("A \(listViewModel.data.secondaryCaste) kaszt CÉ alapja \(fightPointCalculator.fightPointCalc(listViewModel.data.secondaryCaste).ce).")
                    Text("Ehhez hozzájárul az ügyesség 10 feletti része, azaz \(listViewModel.data.agility - 10).")
                }
                .titleInfoStyle()
                HStack {
                    Text("CÉ pontjaid összesen: \(totalCe)")
                        .titleStyle()
                        .padding(.vertical, 2)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(Color.orange.opacity(0.2))
                        .cornerRadius(15)
                    Button{
                        listViewModel.data.addCe += 1
                        actualHm -= 1
                        listViewModel.data.hm = hmPerLevel + actualHm
                        listViewModel.data.ce = totalCe
                    }label: {
                        Image(systemName: "plus")
                            .buttonStyleDisabled(isValid: !checkAmount)
                    }
                    .disabled(checkAmount)
                }
                HStack {
                    Spacer()
                    Text("Maradt \(listViewModel.data.hm) HM")
                        .titleStyle()
                    Button{
                        listViewModel.data.addCe -= 1
                        actualHm += 1
                        listViewModel.data.hm = hmPerLevel + actualHm
                        listViewModel.data.ce = totalCe
                    }label: {
                        Image(systemName: "arrow.uturn.backward")
                            .buttonStyleDisabled(isValid: listViewModel.data.addCe != 0)
                    }
                    .disabled(listViewModel.data.addCe == 0)
                }
            }
            .padding(.bottom)
            .charInfoStyleBg()
            
            HStack {
                Text("Harcérték módisító")
                    .headerStyle()
                Spacer()
            }
            VStack (alignment: .leading){
                VStack(alignment: .leading, spacing: 0) {
                    Text("A \(listViewModel.data.secondaryCaste) kaszt HM alapja \(fightPointCalculator.fightPointCalc(listViewModel.data.secondaryCaste).hm).")
                    Text("A \(listViewModel.data.secondaryCaste) kaszt \(fightPointCalculator.hmPointMandatoryShow(listViewModel.data.secondaryCaste))")
                    Text("\(listViewModel.data.level). szinten \(hmPerLevel) HM szétosztható a harcértékek között.")
                }
                .titleInfoStyle()
                Text(listViewModel.data.hm == 0 ? "Nem maradt több HM." : "Maradt még \(listViewModel.data.hm) HM.")
                    .titleStyle()
                    .padding(.vertical, 2)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(listViewModel.data.hm == 0 ? Color.orange.opacity(0.2) : Color.red.opacity(0.6))
                    .cornerRadius(15)
                    .padding()
            }
            .charInfoStyleBg()
            .onAppear {
                listViewModel.data.hm = hmPerLevel + actualHm
                listViewModel.data.ke = totalKe
                listViewModel.data.te = totalTe
                listViewModel.data.ve = totalVe
                listViewModel.data.ce = totalCe
            }
        }
    }
}
        
//old page
//        VStack {
//            Form {
//                Section ("Kezdeményező érték") {
//                    Text("A \(listViewModel.data.secondaryCaste) kaszt KÉ alapja \(fightPointCalculator.fightPointCalc(listViewModel.data.secondaryCaste).ke).")
//                    Text("Ehhez hozzájárul a gyorsaság (\(listViewModel.data.speed - 10)) és ügyesség 10 feletti része (\(listViewModel.data.agility - 10)), azaz összesen \((listViewModel.data.speed - 10) + (listViewModel.data.agility - 10)).")
//                    HStack {
//                        Text("KÉ pontjaid összesen: \(totalKe)")
//                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
//                            .padding(.horizontal)
//                            .background(Color.orange.opacity(0.2))
//                            .cornerRadius(6)
//                        Image(systemName: "plus")
//                            .buttonStyleDisabled(isValid: !checkAmount)
//                            .onTapGesture {
//                                listViewModel.data.addKe += 1
//                                actualHm -= 1
//                                listViewModel.data.hm = hmPerLevel + actualHm
//                                listViewModel.data.ke = totalKe
//                            }
//                            .disabled(checkAmount)
//                    }
//                    HStack {
//                        Spacer()
//                        Text("Maradt \(listViewModel.data.hm) HM")
//                            .padding(.horizontal)
//                        Image(systemName: "arrow.uturn.backward")
//                            .buttonStyleDisabled(isValid: listViewModel.data.addKe != 0)
//                            .onTapGesture {
//                                if listViewModel.data.addKe != 0 {
//                                    listViewModel.data.addKe -= 1
//                                }
//                                actualHm += 1
//                                listViewModel.data.hm = hmPerLevel + actualHm
//                                listViewModel.data.ke = totalKe
//                            }
//                            .disabled(listViewModel.data.addKe == 0)
//                    }
//                }
//                Section ("Támadó érték") {
//                    Text("A \(listViewModel.data.secondaryCaste) kaszt TÉ alapja \(fightPointCalculator.fightPointCalc(listViewModel.data.secondaryCaste).te).")
//                    Text("Ehhez hozzájárul az erő (\(listViewModel.data.strength - 10)),a gyorsaság (\(listViewModel.data.speed - 10)) és az ügyesség 10 feletti része (\(listViewModel.data.agility - 10)), azaz összesen \((listViewModel.data.strength - 10) + (listViewModel.data.speed - 10) + (listViewModel.data.agility - 10)).")
//                    HStack {
//                        Text("TÉ pontjaid összesen: \(totalTe)")
//                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
//                            .padding(.horizontal)
//                            .background(Color.orange.opacity(0.2))
//                            .cornerRadius(6)
//                        Image(systemName: "plus")
//                            .buttonStyleDisabled(isValid: !checkAmount)
//                            .onTapGesture {
//                                listViewModel.data.addTe += 1
//                                actualHm -= 1
//                                listViewModel.data.hm = hmPerLevel + actualHm
//                                listViewModel.data.te = totalTe
//                            }
//                            .disabled(checkAmount)
//                    }
//                    HStack {
//                        Spacer()
//                        Text("Maradt \(listViewModel.data.hm) HM")
//                            .padding(.horizontal)
//                        Image(systemName: "arrow.uturn.backward")
//                            .buttonStyleDisabled(isValid: listViewModel.data.addTe != 0)
//                            .onTapGesture {
//                                listViewModel.data.addTe -= 1
//                                actualHm += 1
//                                listViewModel.data.hm = hmPerLevel + actualHm
//                                listViewModel.data.te = totalTe
//                            }
//                            .disabled(listViewModel.data.addTe == 0)
//                    }
//                }
//                Section ("Védő érték") {
//                    Text("A \(listViewModel.data.secondaryCaste) kaszt VÉ alapja \(fightPointCalculator.fightPointCalc(listViewModel.data.secondaryCaste).ve).")
//                    Text("Ehhez hozzájárul a gyorsaság (\(listViewModel.data.speed - 10)) és ügyesség 10 feletti része (\(listViewModel.data.agility - 10)), azaz összesen \((listViewModel.data.speed - 10) + (listViewModel.data.agility - 10)).")
//                    HStack {
//                        Text("VÉ pontjaid összesen: \(totalVe)")
//                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
//                            .padding(.horizontal)
//                            .background(Color.orange.opacity(0.2))
//                            .cornerRadius(6)
//                        Image(systemName: "plus")
//                            .buttonStyleDisabled(isValid: !checkAmount)
//                            .onTapGesture {
//                                listViewModel.data.addVe += 1
//                                actualHm -= 1
//                                listViewModel.data.hm = hmPerLevel + actualHm
//                                listViewModel.data.ve = totalVe
//                            }
//                            .disabled(checkAmount)
//                    }
//                    HStack {
//                        Spacer()
//                        Text("Maradt \(listViewModel.data.hm) HM")
//                            .padding(.horizontal)
//                        Image(systemName: "arrow.uturn.backward")
//                            .buttonStyleDisabled(isValid: listViewModel.data.addVe != 0)
//                            .onTapGesture {
//                                listViewModel.data.addVe -= 1
//                                actualHm += 1
//                                listViewModel.data.hm = hmPerLevel + actualHm
//                                listViewModel.data.ve = totalVe
//                            }
//                            .disabled(listViewModel.data.addVe == 0)
//                    }
//                }
//                Section ("Célzó érték") {
//                    Text("A \(listViewModel.data.secondaryCaste) kaszt CÉ alapja \(fightPointCalculator.fightPointCalc(listViewModel.data.secondaryCaste).ce).")
//                    Text("Ehhez hozzájárul az ügyesség 10 feletti része, azaz \(listViewModel.data.agility - 10).")
//                    HStack {
//                        Text("CÉ pontjaid összesen: \(totalCe)")
//                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
//                            .padding(.horizontal)
//                            .background(Color.orange.opacity(0.2))
//                            .cornerRadius(6)
//                        Image(systemName: "plus")
//                            .buttonStyleDisabled(isValid: !checkAmount)
//                            .onTapGesture {
//                                listViewModel.data.addCe += 1
//                                actualHm -= 1
//                                listViewModel.data.hm = hmPerLevel + actualHm
//                                listViewModel.data.ce = totalCe
//                            }
//                            .disabled(checkAmount)
//                    }
//                    HStack {
//                        Spacer()
//                        Text("Maradt \(listViewModel.data.hm) HM")
//                            .padding(.horizontal)
//                        Image(systemName: "arrow.uturn.backward")
//                            .buttonStyleDisabled(isValid: listViewModel.data.addCe != 0)
//                            .onTapGesture {
//                                listViewModel.data.addCe -= 1
//                                actualHm += 1
//                                listViewModel.data.hm = hmPerLevel + actualHm
//                                listViewModel.data.ce = totalCe
//                            }
//                            .disabled(listViewModel.data.addCe == 0)
//                    }
//                }
//                Section ("Harcérték módisító") {
//                    Text("A \(listViewModel.data.secondaryCaste) kaszt HM alapja \(fightPointCalculator.fightPointCalc(listViewModel.data.secondaryCaste).hm).")
//                    Text("A \(listViewModel.data.secondaryCaste) kaszt \(fightPointCalculator.hmPointMandatoryShow(listViewModel.data.secondaryCaste))")
//                    Text("\(listViewModel.data.level). szinten \(hmPerLevel) HM szétosztható a harcértékek között.")
//                    Text(listViewModel.data.hm == 0 ? "Nem maradt több HM." : "Maradt még \(listViewModel.data.hm) HM.")
//                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
//                        .padding(.horizontal)
//                        .background(listViewModel.data.hm == 0 ? Color.orange.opacity(0.2) : Color.red.opacity(0.6))
//                        .cornerRadius(6)
//                }
//            }
//        }
//        .onAppear {
//            listViewModel.data.hm = hmPerLevel + actualHm
//            listViewModel.data.ke = totalKe
//            listViewModel.data.te = totalTe
//            listViewModel.data.ve = totalVe
//            listViewModel.data.ce = totalCe
//        }
//    }
//}
//
//struct AddFightPointsView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddFightPointsView()
//    }
//}
