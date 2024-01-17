//
//  AddHealthPointsView.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 26/10/2022.
//

import SwiftUI
import Combine

struct AddHealthPointsView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    @FocusState private var keyboardIsFocused: Bool
    
    @State private var painPointPerLevel = 0
    @State private var painPointTyped = ""
    @State private var showConfirmButton : String?
    
    var ppPerLevelCalc: Int {
        healthPointCalculator.healthPointCalc(listViewModel.data.secondaryCaste).painPointPerLevel * listViewModel.data.level
    }
    
    var checkAmount: Bool {
        if painPointPerLevel > 0 {
            return true
        }
        return false
    }
    
    var body: some View {
        ScrollView {
            HStack {
                Text("Életerő")
                    .headerStyle()
                Spacer()
            }
            VStack (alignment: .leading){
                VStack (alignment: .leading, spacing: 0){
                    Text("A \(listViewModel.data.secondaryCaste) kaszt ÉP alapja \(healthPointCalculator.healthPointCalc(listViewModel.data.secondaryCaste).healthPoint).")
                    Text("Ehhez hozzájárul az egészség 10 feletti része, azaz \(listViewModel.data.health - 10).")
                }
                .titleInfoStyle()
                Text("ÉP pontjaid összesen: \(hpCalc(hpbase: healthPointCalculator.healthPointCalc(listViewModel.data.secondaryCaste).healthPoint, health: listViewModel.data.health))")
                    .titleStyle()
                    .padding(.vertical, 5)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(Color.orange.opacity(0.2))
                    .cornerRadius(15)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .charInfoStyleBg()
            
            HStack {
                Text("Fájdalomtűrés")
                    .headerStyle()
                Spacer()
            }
            VStack (alignment: .leading){
                VStack(alignment: .leading, spacing: 0){
                    Text("A \(listViewModel.data.secondaryCaste) kaszt FP alapja \(healthPointCalculator.healthPointCalc(listViewModel.data.secondaryCaste).painPoint).")
                    Text("Ehhez hozzájárul az állóképesség (\(listViewModel.data.endurance - 10)) és az akaraterő 10 feletti része (\(listViewModel.data.willpower - 10)).")
                }
                .titleInfoStyle()
                Text("Az \(listViewModel.data.level). szinten hozzáadódik még \(healthPointCalculator.healthPointShow(listViewModel.data.secondaryCaste)) /Szint.")
                    .titleStyle()
                    .padding(.vertical, 5)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(Color.orange.opacity(0.2))
                    .cornerRadius(15)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .charInfoStyleBg()
            
            HStack {
                Text("FP: ")
                    .titleStyle()
                TextField("0", text: $painPointTyped)
                    .onChange(of: painPointTyped) { newValue in
                        painPointTyped = String(newValue.prefix(2))
                    }
                    .onReceive(Just(painPointTyped)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.painPointTyped = filtered
                        }
                    }
                    .onTapGesture {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                            showConfirmButton = "FP"
                        }
                    }
                    .onSubmit {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                            showConfirmButton = ""
                        }
                        painPointPerLevel = Int(painPointTyped) ?? 0
                        keyboardIsFocused = false
                    }
                    .padding(5)
                    .background(painPointPerLevel == 0 ? Color.red.opacity(0.6) : Color.primary)
                    .cornerRadius(6)
                    .frame(maxWidth: 40)
                    .focused($keyboardIsFocused)
                    .keyboardType(.numberPad)
                    .onSubmit {
                        listViewModel.data.painPoint = ppCalc(pp: healthPointCalculator.healthPointCalc(listViewModel.data.secondaryCaste).painPoint, endu: listViewModel.data.endurance, willp: listViewModel.data.willpower, pppl: painPointPerLevel)
                        listViewModel.data.painPointAct = listViewModel.data.painPoint
                    }
                if showConfirmButton == "FP" {
                    Button {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                            showConfirmButton = ""
                        }
                        painPointPerLevel = Int(painPointTyped) ?? 0
                        keyboardIsFocused = false
                    } label: {
                        Image(systemName: "checkmark")
                            .buttonStyleOn()
                    }
                    .padding(.horizontal, 8)
                }
                
                Spacer()
                Text("(\(healthPointCalculator.healthPointShow(listViewModel.data.secondaryCaste))) * \(listViewModel.data.level)")
                    .foregroundColor(.gray)
                    .font(.system(size: 12, weight: .light, design: .rounded).smallCaps())
                    .padding(.trailing, 10)
                Button{
                    painPointPerLevel = ppPerLevelCalc
                    listViewModel.data.painPoint = ppCalc(pp: healthPointCalculator.healthPointCalc(listViewModel.data.secondaryCaste).painPoint, endu: listViewModel.data.endurance, willp: listViewModel.data.willpower, pppl: painPointPerLevel)
                    listViewModel.data.painPointAct = listViewModel.data.painPoint
                    painPointTyped = String(painPointPerLevel)
                }label:{
                    Image(systemName: checkAmount ? "dice.fill" : "dice")
                        .buttonStyleDisabled(isValid: !checkAmount)
                }
                .disabled(checkAmount)
            }
            .charInfoStyleBg()
            
            VStack {
                Text("FP pontjaid összesen: \(ppCalc(pp: healthPointCalculator.healthPointCalc(listViewModel.data.secondaryCaste).painPoint, endu: listViewModel.data.endurance, willp: listViewModel.data.willpower, pppl: painPointPerLevel))")
                    .titleStyle()
                    .padding(.vertical, 5)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(Color.orange.opacity(0.2))
                    .cornerRadius(15)
            }
            .charInfoStyleBg()
        }
        .onAppear {
            listViewModel.data.healthPoint = healthPointCalculator.healthPointCalc(listViewModel.data.secondaryCaste).healthPoint + (listViewModel.data.health - 10)
            listViewModel.data.healthPointAct = listViewModel.data.healthPoint
            listViewModel.data.painPoint = ppCalc(pp: healthPointCalculator.healthPointCalc(listViewModel.data.secondaryCaste).painPoint, endu: listViewModel.data.endurance, willp: listViewModel.data.willpower, pppl: painPointPerLevel)
            listViewModel.data.painPointAct = listViewModel.data.painPoint
        }
    }
    
    func hpCalc(hpbase: Int, health: Int) -> Int {
        return hpbase + (health - 10)
    }
    
    func ppCalc(pp: Int, endu: Int, willp: Int, pppl: Int) -> Int {
        return pp + (endu - 10) + (willp - 10) + pppl
    }
}
// old page
//        VStack {
//            Form {
//                Section ("Életerő") {
//                    Text("A \(listViewModel.data.secondaryCaste) kaszt ÉP alapja \(healthPointCalculator.healthPointCalc(listViewModel.data.secondaryCaste).healthPoint).")
//                    Text("Ehhez hozzájárul az egészség 10 feletti része, azaz \(listViewModel.data.health - 10).")
//                    Text("ÉP pontjaid összesen: \(hpCalc(hpbase: healthPointCalculator.healthPointCalc(listViewModel.data.secondaryCaste).healthPoint, health: listViewModel.data.health))")
//                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
//                        .padding(.horizontal)
//                        .background(Color.orange.opacity(0.2))
//                        .cornerRadius(6)
//                }
//                Section ("Fájdalomtűrés") {
//                    Text("A \(listViewModel.data.secondaryCaste) kaszt FP alapja \(healthPointCalculator.healthPointCalc(listViewModel.data.secondaryCaste).painPoint).")
//                    Text("Ehhez hozzájárul az állóképesség (\(listViewModel.data.endurance - 10)) és az akaraterő 10 feletti része (\(listViewModel.data.willpower - 10)).")
//                    Text("Az \(listViewModel.data.level). szinten hozzáadódik még \(healthPointCalculator.healthPointShow(listViewModel.data.secondaryCaste))/Szint.")
//
//                    HStack {
//                    Text("FP: ")
//                        TextField("FP", value: $painPointPerLevel, format: .number)
//                            .padding(.vertical, 8)
//                            .padding(.horizontal, 10)
//                            .background(painPointPerLevel == 0 ? Color.red.opacity(0.6) : Color.black.opacity(0.06))
//                            .cornerRadius(6)
//                            .frame(maxWidth: 50)
//                            .focused($keyboardIsFocused)
//                            .keyboardType(.numberPad)
//                            .onSubmit {
//                                listViewModel.data.painPoint = ppCalc(pp: healthPointCalculator.healthPointCalc(listViewModel.data.secondaryCaste).painPoint, endu: listViewModel.data.endurance, willp: listViewModel.data.willpower, pppl: painPointPerLevel)
//                                listViewModel.data.painPointAct = listViewModel.data.painPoint
//                            }
//                        Spacer()
//                        Text("(\(healthPointCalculator.healthPointShow(listViewModel.data.secondaryCaste))) * \(listViewModel.data.level)")
//                            .foregroundColor(.gray)
//                            .font(.caption)
//                        Image(systemName: checkAmount ? "dice.fill" : "dice")
//                            .font(.title)
//                            .foregroundColor(checkAmount ? .gray : .black)
//                            .padding(3)
//                            .background(.ultraThinMaterial)
//                            .clipShape(RoundedRectangle(cornerRadius: 6))
//                            .onTapGesture {
//                                painPointPerLevel = ppPerLevelCalc
//                                listViewModel.data.painPoint = ppCalc(pp: healthPointCalculator.healthPointCalc(listViewModel.data.secondaryCaste).painPoint, endu: listViewModel.data.endurance, willp: listViewModel.data.willpower, pppl: painPointPerLevel)
//                                listViewModel.data.painPointAct = listViewModel.data.painPoint
//                            }
//                            .disabled(checkAmount)
//                    }
//
//                    Text("FP pontjaid összesen: \(ppCalc(pp: healthPointCalculator.healthPointCalc(listViewModel.data.secondaryCaste).painPoint, endu: listViewModel.data.endurance, willp: listViewModel.data.willpower, pppl: painPointPerLevel))")
//                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
//                        .padding(.horizontal)
//                        .background(Color.orange.opacity(0.2))
//                        .cornerRadius(6)
//                }
//            }
//        }
//        .onAppear {
//            listViewModel.data.healthPoint = healthPointCalculator.healthPointCalc(listViewModel.data.secondaryCaste).healthPoint + (listViewModel.data.health - 10)
//            listViewModel.data.healthPointAct = listViewModel.data.healthPoint
//            listViewModel.data.painPoint = ppCalc(pp: healthPointCalculator.healthPointCalc(listViewModel.data.secondaryCaste).painPoint, endu: listViewModel.data.endurance, willp: listViewModel.data.willpower, pppl: painPointPerLevel)
//            listViewModel.data.painPointAct = listViewModel.data.painPoint
//        }
//    }
//}

//struct AddHealthPointsView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView{
//            AddHealthPointsView()
//        }
//
//    }
//}
