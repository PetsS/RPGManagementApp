//
//  UsefulCodes.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 19/11/2022.
//

import Foundation

    ///Lazy V Grid

//            LazyVGrid (
//                columns: [
//                    GridItem(.flexible()),
//                    GridItem(.flexible()),
//                    GridItem(.flexible()),
//                    GridItem(.flexible()),
//                    GridItem(.flexible()),
//                    GridItem(.flexible()),
//                    GridItem(.flexible()),
//                    GridItem(.flexible())
//                ]
//            ){
//                Text("?fegyver név?")
//                Text("?fegy KE?")
//                Text("?fegy TE?")
//                Text("?fegy VE?")
//                Text("?fegy CE?")
//                Text("?fegy T/K?")
//                Text("?fegy Seb?")
//                Text("?fegy hatotav?")
//            }
//            .charInfoStyleBg()
            
            
    /// ForEach with index (select items in the ForEach loop)
            
//            ForEach(Array(equipmentViewModel.data.weaponCat1.enumerated()), id: \.offset) { index, weapon in
//                Text("\(index)")
//                Text(weapon.name)
//                Image(systemName: equipmentViewModel.data.weaponCat1[index].sel ? "circle.fill" : "circle")
//                    .onTapGesture {
//                        equipmentViewModel.data.weaponCat1[index].sel.toggle()
//
//                        if equipmentViewModel.data.weaponCat1[index].sel == true {
//                            addWeaponName = weapon.name
//                            addWeaponDamage = weapon.dam
//                        }
//                    }
//            }
            
//            ForEach(equipmentViewModel.data.weaponCat1.indices, id: \.self) { index in
//                Toggle(isOn: self.$equipmentViewModel.data.weaponCat1[index].sel) {
//                    Text("boolVar = \(equipmentViewModel.data.weaponCat1[index].sel ? "ON":"OFF")")
//                }
//            }
            
//            VStack (alignment: .leading, spacing: 0){
//                ForEach(equipmentViewModel.data.weaponCat1.indices, id: \.self) { index in
//                    HStack {
//                        Text("\(equipmentViewModel.data.weaponCat1[index].name)")
//                            .titleStyle()
//                        Spacer()
//                        Button{
//                            equipmentViewModel.data.weaponCat1[index].sel.toggle()
//                            if equipmentViewModel.data.weaponCat1[index].sel == true {
//
//                                equipmentViewModel.data.weaponSelected = equipmentViewModel.data.weaponCat1[index].sel
//                                equipmentViewModel.data.weaponName = equipmentViewModel.data.weaponCat1[index].name
//                                equipmentViewModel.data.weaponDamage = equipmentViewModel.data.weaponCat1[index].dam
//                            } else {
//                                equipmentViewModel.data.weaponCat1[index].sel = false
//                                equipmentViewModel.data.weaponSelected = equipmentViewModel.data.weaponCat1[index].sel
//                            }
//
//                        }label: {
//                            Image(systemName: equipmentViewModel.data.weaponCat1[index].sel ? "circle.fill" : "circle")
//                                .buttonStyleOn()
//                        }
//                        .onAppear{
//                            equipmentViewModel.data.weaponCat1[index].sel = false
//                        }
//                    }
//                    .frame(maxWidth: .infinity)
//                    .charInfoStyleBg()
//                }
//            }



    /// add a sheet to a forEach where each element can have an individual sheet

//      @State private var selectedWeaponInfo : Int?


//      Button{
//          selectedWeaponInfo = index
//      }label:{
//          Image(systemName: "book.circle")
//      }
//      .titleStyle()

//
//                        .sheet(item: $selectedWeaponInfo) { item in
//                            WeaponInfoView(weapon: character.weaponsArray[item])
//                        }



    /// mini icon in ZStack for editable items

//  ZStack {
//    Image(systemName: "square.and.pencil.circle.fill")
//        .foregroundColor(.white)
//        .shadow(radius: 1, y:1)
//        .offset(x: -18, y: 10)
//  }
