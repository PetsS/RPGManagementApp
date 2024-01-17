//
//  EditAlignmentView.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 26/10/2022.
//

import SwiftUI

struct EditAlignmentView: View {
    let character: Character
    
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.managedObjectContext) var moc
    @FocusState private var keyboardIsFocused: Bool
    
    @Binding var selectedCharInfo: String?
    
    var body: some View {
        VStack (alignment: .leading){
            Text("Jellem módosítása")
                .headerStyle()
            Picker("Jellem", selection: $listViewModel.data.alignment) {
                ForEach(listViewModel.data.alignments, id: \.self) {
                    Text($0)
                        .titleStyle()
                }
            }
            .pickerStyle(.wheel)
            .frame(maxHeight: 100)
            .clipped()
            .charInfoStyleBg()
        }
        .onAppear{
            listViewModel.data.alignment = character.wrappedAlignment
        }
        VStack{
            HStack {
                Text("\(listViewModel.data.alignment) jellem leírása")
                Spacer()
            }
            .headerStyle()
            HStack (alignment: .top, spacing: 0) {
                HStack{
                    ScrollView {
                    Text(InfoCalculator.alignmentInfo(name: listViewModel.data.alignment))
                        .titleInfoStyle()
                    }
                    .frame(maxHeight: 145)
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .charInfoStyleBg()
                Button{
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                        character.alignment = listViewModel.data.alignment
                        if moc.hasChanges {
                            try? moc.save()
                        }
                        listViewModel.data.alignment = character.wrappedAlignment
                        selectedCharInfo = nil
                    }
                }label:{
                    Text("OK")
                        .buttonStyleOn()
                }
                .padding(.trailing)
            }
            
        }
        .frame(maxWidth: .infinity)
    }
}

//struct EditAlignmentView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditAlignmentView()
//    }
//}
