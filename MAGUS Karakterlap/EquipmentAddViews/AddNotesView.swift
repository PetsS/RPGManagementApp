//
//  AddDescriptionView.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 26/10/2022.
//

import SwiftUI

struct AddNotesView: View {
    let character: Character
    @FocusState private var keyboardIsFocused: Bool
    @Environment(\.managedObjectContext) var moc
    @State private var showAlert = false
    
    @Binding var showSheetNotes: Bool
    @Binding var addNotes: String
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Form {
                    Section (
                        header:
                            HStack (alignment: .top){
                                Text("Jegyzetek")
                                Spacer()
                                Button{
                                    showAlert = true
                                }label:{
                                    Image(systemName: "trash")
                                }
                                .alert("Biztos törölni akarod?", isPresented: $showAlert) {
                                    Button ("OK") {
                                        addNotes = ""
                                    }
                                    .foregroundColor(.black)
                                    Button ("Vissza", role: .cancel) { }
                                        .foregroundColor(.black)
                                }
                            }
                    ){
                        TextEditor(text: $addNotes)
                            .titleInfoStyle()
                            .frame(height: geometry.size.height * 0.85)
                    }
                }
            }
        }
        
        
        HStack {
            Button {
                showSheetNotes.toggle()
            } label: {
                Image(systemName: "arrow.left")
                    .buttonStyleOn()
            }
            Spacer()
            Text("Jegyzetek")
                .titleStyle()
            Spacer()
            Button {
                character.notes = addNotes
                if moc.hasChanges {
                    try? moc.save()
                }
                showSheetNotes = false
            } label: {
                Text("OK")
                .buttonStyleOn()
            }
        }
        .padding()
    }
}
