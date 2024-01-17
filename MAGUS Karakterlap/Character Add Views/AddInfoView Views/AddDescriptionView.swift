//
//  AddDescriptionView.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 26/10/2022.
//

import SwiftUI

struct AddDescriptionView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    @FocusState private var keyboardIsFocused: Bool
    
    @State private var showAlert = false

    @Binding var showSheetDescription: Bool
    
    @State private var selectDesc = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("Karakter leírása")
                    .headerStyle()
                Spacer()
                Button{
                    showAlert = true
                }label:{
                    Image(systemName: "trash")
                }
                .headerStyle()
                .alert("Biztos törölni akarod?", isPresented: $showAlert) {
                    Button ("OK") {
                        listViewModel.data.charDescription = ""
                    }
                    .foregroundColor(.black)
                    Button ("Vissza", role: .cancel) { }
                        .foregroundColor(.black)
                }
            }
            VStack(alignment: .leading) {
                TextEditor(text: $listViewModel.data.charDescription)
                    .padding()
                    .background(.ultraThinMaterial)
                    .titleInfoStyle()
                    .cornerRadius(15)
                    .focused($keyboardIsFocused)
                    .onSubmit {
                        keyboardIsFocused = false
                    }
            }
            .charInfoStyleBg()                
        }
        .padding(.vertical)
        
        HStack {
            Button {
                showSheetDescription.toggle()
            } label: {
                Image(systemName: "arrow.left")
                .buttonStyleOn()
            }
            Spacer()
            Text("Karakter leírása")
                .titleStyle()
            Spacer()
            Button {
                showSheetDescription = false
            } label: {
                Text("OK")
                .buttonStyleOn()
            }
        }
        .padding()
    }
    
    
}


//struct AddDescriptionView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddDescriptionView()
//    }
//}
