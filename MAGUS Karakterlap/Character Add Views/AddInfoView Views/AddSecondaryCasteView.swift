//
//  AddSecondaryCasteView.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 26/10/2022.
//

import SwiftUI

struct AddSecondaryCasteView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel

    @Binding var showSheetSecondaryCaste: Bool
    @State private var selectSecondaryCaste = ""
    
    var body: some View {
        VStack (alignment: .leading){
            HStack {
                Text("Alkaszt")
                Spacer()
                if listViewModel.data.secondaryCaste != "Válassz" {
                    Text("Aktuális: \(listViewModel.data.secondaryCaste)")
                }
            }
            .headerStyle()
            
            Picker("Alkaszt", selection: $selectSecondaryCaste) {
                ForEach(listViewModel.castesSelection(), id: \.self) { caste in
                    Text(caste).tag(caste)
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
            selectSecondaryCaste = listViewModel.castesSelection()[0]
        }
        
        ScrollView{
            HStack {
                Text("A \(selectSecondaryCaste) kaszt leírása")
                Spacer()
            }
            .headerStyle()
            
            VStack {
                Text(InfoCalculator.secCasteInfo(name: selectSecondaryCaste))
                    .titleInfoStyle()
            }
            .charInfoStyleBg()
        }
        .animation(.easeInOut(duration:0.6), value: selectSecondaryCaste)
        
        
        Spacer()
        
        HStack {
            Button {
                showSheetSecondaryCaste.toggle()
            } label: {
                Image(systemName: "arrow.left")
                .buttonStyleOn()
            }
            Spacer()
            Text("Alkaszt kiválasztása")
                .titleStyle()
            Spacer()
            Button {
                listViewModel.data.secondaryCaste = selectSecondaryCaste
                showSheetSecondaryCaste = false
            } label: {
                Text("OK")
                .buttonStyleOn()
            }
        }
        .padding()
    }
}

//struct AddSecondaryCasteView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddSecondaryCasteView()
//    }
//}
