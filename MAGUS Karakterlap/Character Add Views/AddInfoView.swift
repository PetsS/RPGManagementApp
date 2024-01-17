//
//  AddInfoView.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 24/09/2022.
//

import SwiftUI

struct AddInfoView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
//    @Environment(\.dismiss) var dismiss
    
    @FocusState private var keyboardIsFocused: Bool
    
    @State private var showSheetPrimaryCaste = false
    @State private var showSheetSecondaryCaste = false
    @State private var showSheetRace = false
    @State private var showSheetAlignment = false
    @State private var showSheetLevel = false
    @State private var showSheetDescription = false
    
    var body: some View {
        ScrollView {
            HStack {
                Text("Karakter név")
                Spacer()
                Button {
                    listViewModel.data.name = "Gorduin"
                    listViewModel.data.primaryCaste = listViewModel.data.primaryCastes.randomElement() ?? "Harcos"
                    listViewModel.data.secondaryCaste = listViewModel.castesSelection().randomElement() ?? "Harcos"
                    listViewModel.data.race = listViewModel.data.races.randomElement() ?? "Ember"
                    listViewModel.data.alignment = listViewModel.data.alignments.randomElement() ?? "Rend"
                    listViewModel.data.level = Int.random(in: 1...13)
                    listViewModel.data.xp = XpStartLevCalc.xpStartLevCalc(secCaste: listViewModel.data.secondaryCaste, lvl: listViewModel.data.level)
                }label:{
                    Image(systemName: "square.stack.3d.up")
                }
                .foregroundColor(.primary)
            }
            .headerStyle()
            HStack {
                TextField("Név...", text: $listViewModel.data.name)
                    .onChange(of: listViewModel.data.name) { newValue in
                        listViewModel.data.name = String(newValue.prefix(18))
                    }
                    .focused($keyboardIsFocused)
                    .onSubmit {
                        keyboardIsFocused = false
                    }
                    .font(.system(size: 18).smallCaps().weight(.light))
                    .padding(.leading)
                Button {
                    keyboardIsFocused = false
                } label: {
                    Text("OK")
                        .buttonStyleDisabled(isValid: listViewModel.data.name.count != 0)
                }
                .disabled(listViewModel.data.name.count == 0)
            }
            .charInfoStyleBg()
            
            HStack {
                Text("Karakter info")
                    .headerStyle()
                Spacer()
            }
            
            LazyVGrid(
                columns: [
                    GridItem(.flexible())
                ])
            {
                HStack {
                    Text("Főkaszt")
                        .titleStyle()
                    Spacer()
                    Text(listViewModel.data.primaryCaste)
                        .foregroundColor(.gray)
                        .titleInfoStyle()
                    Button {
                        showSheetPrimaryCaste.toggle()
                    } label: {
                        Image(systemName: "square.and.pencil")
                            .buttonStyleOn()
                    }
                    .sheet(isPresented: $showSheetPrimaryCaste) {
                        AddPrimaryCasteView(showSheetPrimaryCaste: $showSheetPrimaryCaste)
                    }
                    
                }
                
                HStack {
                    Text("Alkaszt")
                        .titleStyle()
                    Spacer()
                    Text(listViewModel.data.secondaryCaste)
                        .foregroundColor(.gray)
                        .titleInfoStyle()
                    Button {
                        showSheetSecondaryCaste.toggle()
                    } label: {
                        Image(systemName: "square.and.pencil")
                            .buttonStyleDisabled(isValid: listViewModel.data.primaryCaste != "Válassz")
                    }
                    .disabled(listViewModel.data.primaryCaste == "Válassz")
                    .sheet(isPresented: $showSheetSecondaryCaste) {
                        AddSecondaryCasteView(showSheetSecondaryCaste: $showSheetSecondaryCaste)
                    }
                    
                }
                
                HStack {
                    Text("Faj")
                        .titleStyle()
                    Spacer()
                    Text(listViewModel.data.race)
                        .foregroundColor(.gray)
                        .titleInfoStyle()
                    Button {
                        showSheetRace.toggle()
                    } label: {
                        Image(systemName: "square.and.pencil")
                            .buttonStyleOn()
                    }
                    .sheet(isPresented: $showSheetRace) {
                        AddRaceView(showSheetRace: $showSheetRace)
                    }
                    
                }
                
                HStack {
                    Text("Jellem")
                        .titleStyle()
                    Spacer()
                    Text(listViewModel.data.alignment)
                        .foregroundColor(.gray)
                        .titleInfoStyle()
                    Button {
                        showSheetAlignment.toggle()
                    } label: {
                        Image(systemName: "square.and.pencil")
                            .buttonStyleOn()
                    }
                    .sheet(isPresented: $showSheetAlignment) {
                        AddAlignmentView(showSheetAlignment: $showSheetAlignment)
                    }
                }
                
                HStack {
                    Text("\(listViewModel.data.level). Szint")
                        .foregroundColor(listViewModel.data.primaryCaste == "Válassz" ? .gray : .primary)
                        .titleStyle()
                    Spacer()
                    Text("Kezdő TP: \(listViewModel.data.xp)")
                        .font(.system(size: 12).smallCaps().weight(.light))
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                    Button {
                        showSheetLevel.toggle()
                    } label: {
                        Image(systemName: "square.and.pencil")
                            .buttonStyleDisabled(isValid: listViewModel.data.secondaryCaste != "Válassz")
                    }
                    .disabled(listViewModel.data.secondaryCaste == "Válassz")
                    .sheet(isPresented: $showSheetLevel) {
                        if #available(iOS 16.0, *) {
                            AddLevelView(showSheetLevel: $showSheetLevel)
                                .presentationDetents([.fraction(0.35)])
                                .presentationDragIndicator(.visible)
                        } else {
                            AddLevelView(showSheetLevel: $showSheetLevel)
                        }
                    }
                }
            }
            .charInfoStyleBg()
            
            HStack {
                Text("Vallás")
                    .headerStyle()
                Spacer()
            }
            HStack {
                TextField("Vallás...", text: $listViewModel.data.religion)
                    .onChange(of: listViewModel.data.religion) { newValue in
                        listViewModel.data.religion = String(newValue.prefix(18))
                    }
                    .focused($keyboardIsFocused)
                    .onSubmit {
                        keyboardIsFocused = false
                    }
                    .titleStyle()
                Button{
                    keyboardIsFocused = false
                }label:{
                    Text("OK")
                        .buttonStyleDisabled(isValid: listViewModel.data.religion.count != 0)
                }
                .focused($keyboardIsFocused)
                .onSubmit {
                    keyboardIsFocused = false
                }
                .disabled(listViewModel.data.religion.count == 0)
            }
            .charInfoStyleBg()
            
            HStack {
                Text("Karakter leírása")
                    .headerStyle()
                Spacer()
            }
            VStack (alignment: .leading) {
                HStack {
                    Text(listViewModel.data.charDescription.count == 0 ? "Adj hozzá leírást..." : "Ezt írtad:")
                        .foregroundColor(.gray.opacity(0.6))
                        .titleInfoStyle()
                    Spacer()
                    Button{
                        showSheetDescription = true
                    }label:{
                        Image(systemName: listViewModel.data.charDescription.count == 0 ? "plus": "square.and.pencil")
                            .buttonStyleOn()
                    }
                    .sheet(isPresented: $showSheetDescription) {
                        AddDescriptionView(showSheetDescription: $showSheetDescription)
                    }
                }
                .frame(maxWidth: .infinity)
                if listViewModel.data.charDescription.count != 0 {
                    Text(listViewModel.data.charDescription)
                        .titleInfoStyle()
                        .padding(.bottom)
                }
            }
            .charInfoStyleBg()
        }
    }
}

struct View1_Previews: PreviewProvider {
    static var previews: some View {
        AddInfoView()
    }
}
