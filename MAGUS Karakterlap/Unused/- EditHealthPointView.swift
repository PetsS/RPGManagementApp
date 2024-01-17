////
////  EditHealthPointView.swift
////  MAGUS Karakterlap
////
////  Created by Peter Szots on 27/10/2022.
////
//
//import SwiftUI
//
//struct EditHealthPointView: View {
//    let character: Character
//    
//    @EnvironmentObject var listViewModel: ListViewModel
//    @Environment(\.managedObjectContext) var moc
//    @FocusState private var keyboardIsFocused: Bool
//    
//    @Binding var showSheetEditHealthPoint: Bool
//    
//    @State private var newHealthPointAct = 1
//     
//    var body: some View {
//        
//        VStack (alignment: .leading) {
//            Text("Max ÉP: \(character.healthPoint)")
//                .foregroundColor(.gray)
//                .font(.system(size: 16).smallCaps().weight(.light))
//                .padding(.horizontal, 40)
//                .padding(.bottom, -5)
//            HStack {
//                Button {
//                    listViewModel.data.healthPointAct -= newHealthPointAct
//                    if listViewModel.data.healthPointAct < 0 {
//                        listViewModel.data.healthPointAct = 0
//                    }
//                } label: {
//                    Image(systemName: "minus")
//                        .buttonStyleDisabled(isValid: listViewModel.data.healthPointAct > 0)
//                }
//                .disabled(listViewModel.data.healthPointAct <= 0)
//                Spacer()
//                Text("\(listViewModel.data.healthPointAct)")
//                    .charInfoStyle()
//                Spacer()
//                Button {
//                    listViewModel.data.healthPointAct += newHealthPointAct
//                    if listViewModel.data.healthPointAct >= character.healthPoint {
//                        listViewModel.data.healthPointAct = Int(character.healthPoint)
//                    }
//                } label: {
//                    Image(systemName: "plus")
//                        .buttonStyleDisabled(isValid: listViewModel.data.healthPointAct < character.healthPoint)
//                }
//                .disabled(listViewModel.data.healthPointAct >= character.healthPoint)
//            }
//            .charInfoStyleBg()
//            HStack {
//                Picker("", selection: $newHealthPointAct) {
//                    ForEach(1..<6, id:\.self) { number in
//                        Text("\(number)")
//                    }
//                }
//                .pickerStyle(.segmented)
//            }
//            .padding(.horizontal)
//        }
//        .padding(.top)
//        .onAppear {
//            listViewModel.data.healthPointAct = Int(character.healthPointAct)
//        }
//        
//        Spacer()
//        HStack {
//            Button {
//                showSheetEditHealthPoint.toggle()
//            } label: {
//                Image(systemName: "arrow.left")
//                .buttonStyleOn()
//            }
//            Spacer()
//            Text("ÉP módosítása")
//                .titleStyle()
//            Spacer()
//            Button {
//                character.healthPointAct = Int16(listViewModel.data.healthPointAct)
//                if moc.hasChanges {
//                    try? moc.save()
//                }
//                keyboardIsFocused = false
//                showSheetEditHealthPoint = false
//                listViewModel.data.healthPointAct = Int(character.healthPointAct)
//            } label: {
//                Text("OK")
//                .buttonStyleOn()
//            }
//        }
//        .padding()
//    }
//    
//}
//
////struct EditHealthPointView_Previews: PreviewProvider {
////    static var previews: some View {
////        EditHealthPointView()
////    }
////}
