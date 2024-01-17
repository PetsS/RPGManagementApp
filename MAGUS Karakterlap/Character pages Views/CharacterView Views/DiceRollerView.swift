//
//  DiceRollerView.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 26/10/2022.
//

import SwiftUI
import Combine

struct DiceRollerView: View {

    @FocusState private var keyboardIsFocused: Bool
    @Binding var showSheetDiceRoller: Bool
    @State private var showRolls = false
    
    @State private var rolledDice = 0
    @State private var diceNumber = "1"
    @State private var diceSides: [String] = ["K3", "K6", "K10", "K100"]
    @State private var diceSide = "K6"
    @State private var diceModifier = "0"
    @State private var diceRolls: [Int] = []
    @State private var rollCount = 0
    
    func calcRoll(number: String, side: String, mod: String) -> Int {
        
        let k3 = Int.random(in: 1...3)
        let k6 = Int.random(in: 1...6)
        let k10 = Int.random(in: 1...10)
        let k100 = Int.random(in: 1...100)
        
        var rolled = 0
        
        switch side {
        case "K3":
            rolled = (Int(number) ?? 0) * k3 + (Int(mod) ?? 0)
        case "K6":
            rolled = (Int(number) ?? 0) * k6 + (Int(mod) ?? 0)
        case "K10":
            rolled = (Int(number) ?? 0) * k10 + (Int(mod) ?? 0)
        case "K100":
            rolled = (Int(number) ?? 0) * k100 + (Int(mod) ?? 0)
        default:
            print("error")
        }
        
        return rolled
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                HStack{
                    Text("Kockák száma")
                    Spacer()
                }
                .headerStyle()
                HStack{
                    TextField("0", text: $diceNumber)
                        .onChange(of: diceNumber) { newValue in
                            diceNumber = String(newValue.prefix(2))
                        }
                        .onReceive(Just(diceNumber)) { newValue in
                            let filtered = newValue.filter { "0123456789".contains($0) }
                            if filtered != newValue {
                                self.diceNumber = filtered
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
                        keyboardIsFocused = false
                    } label: {
                        Image(systemName: "checkmark")
                            .buttonStyleOn()
                    }
                }
                .charInfoStyleBg()
                
                HStack{
                    ForEach(diceSides, id: \.self) { item in
                        Button {
                            diceSide = item
                        } label: {
                            Text("\(item)")
                                .font(.system(size: 14, weight: .bold))
                                .frame(width: 40, height: 25)
                                .buttonStyleOn()
                        }
                    }
                }
                .frame(maxWidth: geometry.size.width)
                
                HStack{
                    Text("Módosító")
                    Spacer()
                }
                .headerStyle()
                HStack{
                    VStack(alignment: .center, spacing: 0){
                        Text("+")
                    }
                    .padding(.leading)
                    .padding(.trailing, -15)
                    HStack(alignment: .center, spacing: 0){
                        TextField("0", text: $diceModifier)
                            .onChange(of: diceModifier) { newValue in
                                diceModifier = String(newValue.prefix(2))
                            }
                            .onReceive(Just(diceModifier)) { newValue in
                                let filtered = newValue.filter { "0123456789".contains($0) }
                                if filtered != newValue {
                                    self.diceModifier = filtered
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
                            keyboardIsFocused = false
                        } label: {
                            Image(systemName: "checkmark")
                                .buttonStyleOn()
                        }
                    }
                    .charInfoStyleBg()
                }
                
                Image(systemName: "circle.grid.cross.up.filled")
                    .padding()
                    .foregroundColor(.gray)
                
                HStack{
                    Text("Kocka dobás")
                    Spacer()
                }
                .headerStyle()
                HStack{
                    Button {
                        rolledDice = calcRoll(number: diceNumber, side: diceSide, mod: diceModifier)
                        rollCount += 1
                        diceRolls.append(rolledDice)
                    } label: {
                        Image(systemName: "dice")
                            .buttonStyleOn()
                    }
                    .padding(.leading)
                    HStack{
                        Text(diceNumber)
                        Text(diceSide)
                        if diceModifier != "0" {
                            Text("+")
                            Text(diceModifier)
                        }
                    }
                    .titleStyle()
                    Spacer()
                    Button{
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                            showRolls.toggle()
                        }
                    }label: {
                        Text("\(rolledDice)")
                            .charInfoStyleFight()
                    }
                }
                .charInfoStyleBg()
                
                if !showRolls {
                    LazyVGrid(
                        columns: [
                                    GridItem(.flexible()),
                                    GridItem(.flexible())
                        ]
                    ) {
                        VStack(alignment: .leading){
                            ForEach((0...rollCount).reversed(), id: \.self) { count in
                                if count != 0 {
                                    HStack{
                                        Text("\(count). dobás")
                                        Spacer()
                                    }
                                    .titleStyle()
                                }
                            }
                        }
                        VStack(alignment: .trailing){
                            ForEach(diceRolls.reversed(), id: \.self) { roll in
                                HStack{
                                    Spacer()
                                    Text("\(roll)")
                                        .titleStyle()
                                }
                                .padding(.trailing)
                            }
                        }
                    }
                    .charInfoStyleBg()
                    .padding(.leading)
                }
            }
            .frame(maxWidth: geometry.size.width)
            .padding(.top)
        }
        
        HStack {
            Button {
                showSheetDiceRoller = false
            } label: {
                Image(systemName: "arrow.left")
                    .buttonStyleOn()
            }
            Spacer()
            Text("Kocka dobó")
                .titleStyle()
            Spacer()
            Button {
                
//                if moc.hasChanges {
//                    try? moc.save()
//                }
                showSheetDiceRoller = false
                
            } label: {
                Text("OK")
                    .buttonStyleOn()
            }
            .opacity(0)
        }
        .padding()
    }
}

//struct EditCharDescriptionView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditCharDescriptionView()
//    }
//}
