//
//  EditRaceView.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 26/10/2022.
//

import SwiftUI

struct EditRaceView: View {
    let character: Character
    
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.managedObjectContext) var moc
    @FocusState private var keyboardIsFocused: Bool
    
    @Binding var selectedCharInfo: String?
    
    var body: some View {
        VStack (alignment: .leading){
            Text("Faj módosítása")
                .headerStyle()
            Picker("Faj", selection: $listViewModel.data.race) {
                ForEach(listViewModel.data.races, id: \.self) {
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
            listViewModel.data.race = character.wrappedRace
        }
        VStack{
            HStack {
                Text("\(listViewModel.data.race) faj leírása")
                Spacer()
            }
            .headerStyle()
            HStack (alignment: .top, spacing: 0) {
                HStack{
                    ScrollView {
                        Text(InfoCalculator.raceInfo(name: listViewModel.data.race))
                            .titleInfoStyle()
                    }
                    .frame(maxHeight: 145)
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .charInfoStyleBg()
                Button{
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                        character.race = listViewModel.data.race
                        if moc.hasChanges {
                            try? moc.save()
                        }
                        listViewModel.data.race = character.wrappedRace
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

//struct EditRaceView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditRaceView()
//    }
//}
