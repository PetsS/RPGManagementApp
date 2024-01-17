//
//  EditEquipmentItemView.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 27/10/2022.
//

import SwiftUI

struct EditEquipmentItemView: View {
    let equipment: Equipment

    @Environment(\.managedObjectContext) var moc
    
    @Binding var showSheetEditEquipmentItem: Bool
    @FocusState private var keyboardIsFocused: Bool
    
    @State private var actualQty = 0
    @State private var newQty = 1
    @State private var newComm = ""
     
    var body: some View {
        VStack {
            VStack (alignment: .leading) {
                Text("Aktuális darab: \(equipment.equipmentQty)")
                    .headerStyle()
                HStack {
                    Button {
                        actualQty -= newQty
                        if actualQty < 0 {
                            actualQty = 0
                        }
                    } label: {
                        Image(systemName: "minus")
                            .buttonStyleDisabled(isValid: actualQty > 0)
                    }
                    .disabled(actualQty <= 0)
                    Spacer()
                    Text("\(actualQty)")
                        .charInfoStyle()
                    Spacer()
                    Button {
                        actualQty += newQty
                        if actualQty >= 100 {
                            actualQty = 100
                        }
                    } label: {
                        Image(systemName: "plus")
                            .buttonStyleDisabled(isValid: actualQty < 100)
                    }
                    .disabled(actualQty >= 100)
                }
                .charInfoStyleBg()
                HStack {
                    Picker("", selection: $newQty) {
                        ForEach(1..<6, id:\.self) { number in
                            Text("\(number)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                .padding(.horizontal)
            }
            .padding(.top)
            .onAppear {
                actualQty = Int(equipment.equipmentQty)
            }
            
            Image(systemName: "circle.grid.cross.up.filled")
                .padding()
                .foregroundColor(.gray)
            
            VStack (alignment: .leading){
                Text("Megjegyzés:")
                    .headerStyle()
                    .padding(.top)
                HStack (alignment: .top, spacing: 0) {
                    TextEditor(text: $newComm)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .cornerRadius(6)
                        .focused($keyboardIsFocused)
                        .padding(.horizontal, 8)
                        .onAppear {
                            newComm = equipment.wrappedEquipmentComm
                        }
                    Button {
                        keyboardIsFocused = false
                    } label: {
                        Image(systemName: "checkmark")
//                        Text("OK")
                            .buttonStyleOn()
                    }
                }
                .titleInfoStyle()
            }
            .charInfoStyleBg()
        }
        
        HStack {
            Button {
                showSheetEditEquipmentItem.toggle()
            } label: {
                Image(systemName: "arrow.left")
                .buttonStyleOn()
            }
            Spacer()
            Text("\(equipment.wrappedEquipmentName) módosítása")
                .titleStyle()
            Spacer()
            Button {
                
                equipment.equipmentQty = Int16(actualQty)
                equipment.equipmentComm = newComm
                
                if moc.hasChanges {
                    try? moc.save()
                }
                showSheetEditEquipmentItem = false
            } label: {
                Text("OK")
                .buttonStyleOn()
            }
        }
        .padding(.top, 5)
        .padding(.horizontal)
        .padding(.bottom)
    }
    
}

