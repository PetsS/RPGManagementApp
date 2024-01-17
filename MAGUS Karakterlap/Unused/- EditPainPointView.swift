////
////  EditPainPointView.swift
////  MAGUS Karakterlap
////
////  Created by Peter Szots on 27/10/2022.
////
//
//import SwiftUI
//
//struct EditPainPointView: View {
//    let character: Character
//
//    @EnvironmentObject var listViewModel: ListViewModel
//    @Environment(\.managedObjectContext) var moc
//    @FocusState private var keyboardIsFocused: Bool
//
//    @Binding var showSheetEditPainPoint: Bool
//    @State private var newPainPointAct: Int = 1
//
//    var body: some View {
//
//        VStack (alignment: .leading) {
//            Text("Max FP: \(character.painPoint)")
//                .foregroundColor(.gray)
//                .font(.system(size: 16).smallCaps().weight(.light))
//                .padding(.horizontal, 40)
//                .padding(.bottom, -5)
//            HStack {
//                Button {
//                    listViewModel.data.painPointAct -= newPainPointAct
//                    if listViewModel.data.painPointAct < 0 {
//                        listViewModel.data.painPointAct = 0
//                    }
//                } label: {
//                    Image(systemName: "minus")
//                        .buttonStyleDisabled(isValid: listViewModel.data.painPointAct > 0)
//                }
//                .disabled(listViewModel.data.painPointAct <= 0)
//                Spacer()
//                Text("\(listViewModel.data.painPointAct)")
//                    .charInfoStyle()
//                Spacer()
//                Button {
//                    listViewModel.data.painPointAct += newPainPointAct
//                    if listViewModel.data.painPointAct >= character.painPoint {
//                        listViewModel.data.painPointAct = Int(character.painPoint)
//                    }
//                } label: {
//                    Image(systemName: "plus")
//                        .buttonStyleDisabled(isValid: listViewModel.data.painPointAct < character.painPoint)
//                }
//                .disabled(listViewModel.data.painPointAct >= character.painPoint)
//            }
//            .charInfoStyleBg()
//            HStack {
//                Picker("", selection: $newPainPointAct) {
//                    ForEach(1..<11, id:\.self) { number in
//                        Text("\(number)")
//                    }
//                }
//                .pickerStyle(.segmented)
//            }
//            .padding(.horizontal)
//        }
//        .padding(.top)
//        .onAppear {
//            listViewModel.data.painPointAct = Int(character.painPointAct)
//        }
//
//        Spacer()
//        HStack {
//            Button {
//                showSheetEditPainPoint.toggle()
//            } label: {
//                Image(systemName: "arrow.left")
//                .buttonStyleOn()
//            }
//            Spacer()
//            Text("FP módosítása")
//                .titleStyle()
//            Spacer()
//            Button {
//                character.painPointAct = Int16(listViewModel.data.painPointAct)
//                if moc.hasChanges {
//                    try? moc.save()
//                }
//                keyboardIsFocused = false
//                showSheetEditPainPoint = false
//                listViewModel.data.painPointAct = Int(character.painPointAct)
//            } label: {
//                Text("OK")
//                .buttonStyleOn()
//            }
//        }
//        .padding()
//    }
//}
//
////struct EditPainPointView_Previews: PreviewProvider {
////    static var previews: some View {
////        EditPainPointView()
////    }
////}
