//
//  AddRaceView.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 26/10/2022.
//

import SwiftUI

struct AddRaceView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel

    @Binding var showSheetRace: Bool
    
    @State private var selectRace = ""
    
    var body: some View {
        VStack (alignment: .leading){
            HStack {
                Text("Faj")
                Spacer()
                if listViewModel.data.race.count > 0 {
                    Text("Aktuális: \(listViewModel.data.race)")
                }
            }
            .headerStyle()
            
            Picker("Faj", selection: $selectRace) {
                ForEach(listViewModel.data.races, id: \.self) {
                    Text($0).tag($0)
                        .titleStyle()
                }
            }
            .pickerStyle(.wheel)
            .frame(maxHeight: 100)
            .clipped()
            .charInfoStyleBg()
        }
        .padding(.top)
        .onAppear{
            selectRace = listViewModel.data.race
        }
        
        ScrollView{
            HStack {
                Text("\(selectRace) faj leírása")
                Spacer()
            }
            .headerStyle()
            
            VStack {
                Text(InfoCalculator.raceInfo(name: selectRace))
                    .titleInfoStyle()
            }
            .charInfoStyleBg()
        }
        .animation(.easeInOut(duration:0.6), value: selectRace)
        
        Spacer()
        
        HStack {
            Button {
                showSheetRace.toggle()
            } label: {
                Image(systemName: "arrow.left")
                .buttonStyleOn()
            }
            Spacer()
            Text("Faj kiválasztása")
                .titleStyle()
            Spacer()
            Button {
                listViewModel.data.race = selectRace
                showSheetRace = false
            } label: {
                Text("OK")
                .buttonStyleOn()
            }
        }
        .padding()
    }
}

//struct AddRaceView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddRaceView()
//    }
//}
