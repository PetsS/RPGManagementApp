//
//  AddLevelView.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 26/10/2022.
//

import SwiftUI

struct AddLevelView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel

    @Binding var showSheetLevel: Bool
    
    @State private var selectLevel = 1
    @State private var startingXP = 0
    
    var body: some View {
        VStack (alignment: .leading){
            HStack {
                Text("Faj")
                Spacer()
                if listViewModel.data.level > 0 {
                    Text("Aktuális: \(listViewModel.data.level)")
                }
            }
            .headerStyle()
            
            Picker("Szint", selection: $selectLevel) {
                ForEach(1..<14, id: \.self) {
                    Text("\($0)").tag($0)
                        .titleStyle()
                }
            }
            .pickerStyle(.wheel)
            .frame(maxHeight: 100)
            .clipped()
            .charInfoStyleBg()
            .onChange(of: selectLevel) { newValue in
                startingXP = XpStartLevCalc.xpStartLevCalc(secCaste: listViewModel.data.secondaryCaste, lvl: newValue)
            }
            
            Text("Kezdő Tapasztalati Pontok: \(startingXP)")
                .font(.system(size: 18).smallCaps().weight(.light))
                .frame(height: 30)
                .padding(.horizontal)
                .charInfoStyleBg()
        }
        .padding(.top)
        .onAppear{
            selectLevel = listViewModel.data.level
            startingXP = listViewModel.data.xp
        }
        
        Spacer()
        
        HStack {
            Button {
                showSheetLevel.toggle()
            } label: {
                Image(systemName: "arrow.left")
                .buttonStyleOn()
            }
            Spacer()
            Text("Szint kiválasztása")
                .titleStyle()
            Spacer()
            Button {
                listViewModel.data.xp = startingXP
                listViewModel.data.level = selectLevel
                showSheetLevel = false
            } label: {
                Text("OK")
                .buttonStyleOn()
            }
        }
        .padding()
    }
}

//struct AddLevelView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddLevelView()
//    }
//}
