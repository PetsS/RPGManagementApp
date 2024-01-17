//
//  AddAlignmentView.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 26/10/2022.
//

import SwiftUI

struct AddAlignmentView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel

    @Binding var showSheetAlignment: Bool
    
    @State private var selectAlignment = ""
    
    var body: some View {
        VStack (alignment: .leading){
            HStack {
                Text("Jellem")
                Spacer()
                if listViewModel.data.alignment.count > 0 {
                    Text("Aktuális: \(listViewModel.data.alignment)")
                }
            }
            .headerStyle()
            
            Picker("Jellem", selection: $selectAlignment) {
                ForEach(listViewModel.data.alignments, id: \.self) {
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
            selectAlignment = listViewModel.data.alignment
        }
        
        ScrollView{
            HStack {
                Text("\(selectAlignment) jellem leírása")
                Spacer()
            }
            .headerStyle()
            
            VStack {
                Text(InfoCalculator.alignmentInfo(name: selectAlignment))
                    .titleInfoStyle()
            }
            .charInfoStyleBg()
        }
        .animation(.easeInOut(duration:0.6), value: selectAlignment)
        
        Spacer()
        
        HStack {
            Button {
                showSheetAlignment.toggle()
            } label: {
                Image(systemName: "arrow.left")
                .buttonStyleOn()
            }
            Spacer()
            Text("Jellem kiválasztása")
                .titleStyle()
            Spacer()
            Button {
                listViewModel.data.alignment = selectAlignment
                showSheetAlignment = false
            } label: {
                Text("OK")
                .buttonStyleOn()
            }
        }
        .padding()
    }
}

//struct AddAlignmentView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddAlignmentView()
//    }
//}
