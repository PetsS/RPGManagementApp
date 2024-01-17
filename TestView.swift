//
//  TestView.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 16/11/2022.
//

import SwiftUI

struct TestView: View {
    let character: Character
    
    @EnvironmentObject var equipmentViewModel: EquipmentViewModel
    @Environment(\.managedObjectContext) var moc
//    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)], animation: .default) var characters: FetchedResults<Character>

    @State private var addWeaponName: String = ""
    var body: some View {
        HStack{
            TextField("Weapon Name", text: $addWeaponName)
                .textFieldStyle(.roundedBorder)
            Button("Add") {
                addWeapon()
            }
        }
        .padding()
        
        
        
        
        List{
            ForEach(character.weaponsArray, id: \.self) { weapon in
                Text(weapon.wrappedWeaponName)
            }
            .charInfoStyleBg()
        }
    }
    
    func addWeapon() {
        withAnimation{
            let newWeapon = Weapon(context: moc)
            newWeapon.weaponName = addWeaponName
            
            character.addToWeapons(newWeapon)
            
            if moc.hasChanges {
                try? moc.save()
            }
        }
        
    }
}

//struct TestView_Previews: PreviewProvider {
//    static var previews: some View {
//        TestView()
//    }
//}
