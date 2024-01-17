//
//  AddPrimaryCasteView.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 26/10/2022.
//

import SwiftUI

struct AddPrimaryCasteView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    @Binding var showSheetPrimaryCaste: Bool

    @State private var selectPrimaryCaste = ""
    
//    @State private var isSelected : [Bool] = [false, false, false, false, false]
    
    var body: some View {
                
        VStack (alignment: .leading){
            HStack {
                Text("Főkaszt")
                Spacer()
                if listViewModel.data.primaryCaste != "Válassz" {
                    Text("Aktuális: \(listViewModel.data.primaryCaste)")
                }
            }
            .headerStyle()
            
            Picker("Főkaszt", selection: $selectPrimaryCaste) {
                ForEach(listViewModel.data.primaryCastes, id: \.self) {
                    Text($0).tag($0)
                        .titleStyle()
                }
            }
            .pickerStyle(.wheel)
            .frame(maxWidth: .infinity, maxHeight: 100)
            .clipped()
            .charInfoStyleBg()
        }
        .padding(.top)
        .onAppear{
            selectPrimaryCaste = listViewModel.data.primaryCastes[0]
        }
        ScrollView{
            HStack {
                Text("A \(selectPrimaryCaste) kaszt leírása")
                Spacer()
            }
            .headerStyle()
            
            VStack {
                Text(InfoCalculator.primCasteInfo(name: selectPrimaryCaste))
                    .titleInfoStyle()
            }
            .charInfoStyleBg()
        }
        .animation(.easeInOut(duration:0.6), value: selectPrimaryCaste)
        
        
        Spacer()
        
        HStack {
            Button {
                showSheetPrimaryCaste.toggle()
            } label: {
                Image(systemName: "arrow.left")
                .buttonStyleOn()
            }
            Spacer()
            Text("Főkaszt kiválasztása")
                .titleStyle()
            Spacer()
            Button {
                listViewModel.data.primaryCaste = selectPrimaryCaste
                showSheetPrimaryCaste = false
            } label: {
                Text("OK")
                .buttonStyleOn()
            }
        }
        .padding()
    }
}

//struct AddPrimaryCasteView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddPrimaryCasteView()
//    }
//}
