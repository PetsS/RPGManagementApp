//
//  EditCharDescriptionView.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 26/10/2022.
//

import SwiftUI

struct EditCharDescriptionView: View {
    let character: Character
    
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.managedObjectContext) var moc
    @FocusState private var keyboardIsFocused: Bool
    @State private var showAlert = false
    
    @Binding var showSheetEditCharDescription: Bool
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Form {
                    Section (
                        header:
                            HStack (alignment: .top){
                                Text("Leírás módosítása")
                                Spacer()
                                Button{
                                    showAlert = true
                                }label:{
                                    Image(systemName: "trash")
                                }
                                .alert("Biztos törölni akarod?", isPresented: $showAlert) {
                                    Button ("OK") {
                                        listViewModel.data.charDescription = ""
                                    }
                                    .foregroundColor(.black)
                                    Button ("Vissza", role: .cancel) { }
                                        .foregroundColor(.black)
                                }
                            }
                    ){
                        TextEditor(text: $listViewModel.data.charDescription)
                            .titleInfoStyle()
                            .frame(height: geometry.size.height * 0.85)
                    }
                }
            }
        }
        
        HStack {
            Button {
                showSheetEditCharDescription = false
            } label: {
                Image(systemName: "arrow.left")
                    .buttonStyleOn()
            }
            Spacer()
            Text("Leírás módosítása")
                .titleStyle()
            Spacer()
            Button {
                character.charDescription = listViewModel.data.charDescription
                if moc.hasChanges {
                    try? moc.save()
                }
                showSheetEditCharDescription = false
                listViewModel.data.charDescription = ""
            } label: {
                Text("OK")
                    .buttonStyleOn()
            }
        }
        .padding()
    }
}

//struct EditCharDescriptionView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditCharDescriptionView()
//    }
//}
