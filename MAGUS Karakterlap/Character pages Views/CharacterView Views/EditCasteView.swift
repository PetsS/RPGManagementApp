//
//  EditCasteView.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 26/10/2022.
//

import SwiftUI

struct EditCasteView: View {
    let character: Character
    
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.managedObjectContext) var moc
    @Binding var showSheetCaste: Bool

    @State private var selectPrimaryCaste = ""
    @State private var selectSecondaryCaste = ""
    
    var body: some View {
                
        VStack (alignment: .leading){
            HStack {
                Text("Főkaszt választása")
                Spacer()
            }
            .headerStyle()
            
            Picker("Főkaszt", selection: $listViewModel.data.primaryCaste) {
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
        
        VStack{
            HStack {
                Text("A \(listViewModel.data.primaryCaste) kaszt leírása")
                Spacer()
            }
            .headerStyle()
            
            ScrollView {
                Text(InfoCalculator.primCasteInfo(name: listViewModel.data.primaryCaste))
                    .titleInfoStyle()
            }
            .charInfoStyleBg()
        }
        
        Image(systemName: "circle.grid.cross.right.filled")
            .padding()
            .foregroundColor(.gray)
        
        VStack (alignment: .leading){
            HStack {
                Text("Alkaszt választása")
                Spacer()
            }
            .headerStyle()
            
            Picker("Alkaszt", selection: $listViewModel.data.secondaryCaste) {
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
        
        VStack {
            HStack {
                Text("A \(listViewModel.data.secondaryCaste) kaszt leírása")
                Spacer()
            }
            .headerStyle()
            
            ScrollView {
                Text(InfoCalculator.secCasteInfo(name: listViewModel.data.secondaryCaste))
                    .titleInfoStyle()
            }
            .charInfoStyleBg()
        }
        
        
        Spacer()
        
        HStack {
            Button {
                showSheetCaste = false
            } label: {
                Image(systemName: "arrow.left")
                .buttonStyleOn()
            }
            Spacer()
            Text("Kaszt módosítása")
                .titleStyle()
            Spacer()
            Button {
                character.primaryCaste = listViewModel.data.primaryCaste
                character.secondaryCaste = listViewModel.data.secondaryCaste
                if moc.hasChanges {
                    try? moc.save()
                }
                listViewModel.data.primaryCaste = character.wrappedPrimaryCaste
                listViewModel.data.secondaryCaste = character.wrappedSecondaryCaste
                showSheetCaste = false
            } label: {
                Text("OK")
                .buttonStyleOn()
            }
        }
        .padding()
        .onAppear{
            listViewModel.data.primaryCaste = character.wrappedPrimaryCaste
            listViewModel.data.secondaryCaste = character.wrappedSecondaryCaste
        }
    }
}
