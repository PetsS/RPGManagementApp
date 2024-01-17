////
////  EditNameView.swift
////  MAGUS Karakterlap
////
////  Created by Peter Szots on 26/10/2022.
////
//
//import SwiftUI
//
//struct EditNameView: View {
//    let character: Character
//    
//    @EnvironmentObject var listViewModel: ListViewModel
//    @Environment(\.managedObjectContext) var moc
//    @FocusState private var keyboardIsFocused: Bool
//    
//    @Binding var showSheetEditName: Bool
//    
//    var body: some View {
//        VStack{
//            HStack{
//                Text("Régi név: \(character.name ?? "Név")")
//                Spacer()
//            }
//            .headerStyle()
//            TextField("Új név", text: $listViewModel.data.name)
//                .onChange(of: listViewModel.data.name) { newValue in
//                    listViewModel.data.name = String(newValue.prefix(18))
//                }
//                .focused($keyboardIsFocused)
//                .onSubmit {
//                    keyboardIsFocused = false
//                }
//                .titleStyle()
//                .charInfoStyleBg()
//        }
//        .padding(.top)
//        
//        Spacer()
//        
//        //bottom bar
//        HStack {
//            Button {
//                showSheetEditName.toggle()
//            } label: {
//                Image(systemName: "arrow.left")
//                .buttonStyleOn()
//            }
//            Spacer()
//            Text("Név módosítása")
//                .titleStyle()
//            Spacer()
//            Button {
//                character.name = listViewModel.data.name
//                if moc.hasChanges {
//                    try? moc.save()
//                }
//                listViewModel.data.name = ""
//                keyboardIsFocused = false
//                showSheetEditName = false
//            } label: {
//                Text("OK")
//                .buttonStyleOn()
//            }
//        }
//        .padding()
//    }
//}
//
////struct EditNameView_Previews: PreviewProvider {
////    static var previews: some View {
////        EditNameView()
////    }
////}
