//
//  SkillsView.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 05/11/2022.
//

import SwiftUI

struct SkillsView: View {
    @StateObject var character = Character()
    
    @Environment(\.managedObjectContext) var moc
    
    @State private var selected : UUID?
    
    @FocusState private var keyboardIsFocused: Bool

    @State private var selectedSkillInfo : String?
    @State private var toBeDeleted = false
    @State private var showSheetAddSkills = false
    
//--
//    @State private var selectedEquipmentInfo : String?
//    @State private var showSheetAddEquipments = false
//    @State private var showSheetEditEquipmentItem = false
//    @State private var showSheetNotes = false
//    @State private var addNotes = ""
    
    var body: some View {
        ScrollView {
            HStack {
                Text("Képzettségek")
                Spacer()
            }
            .headerStyle()
            .padding(.top, 8)
            if !character.skillsArray.isEmpty {
                VStack {
                    ForEach(character.skillsArray, id: \.self) { item in
                        HStack (alignment: .center, spacing: 0) {
                            HStack {
                                if selectedSkillInfo == item.wrappedSkillName {
                                    Image(systemName: "circle.fill")
                                        .foregroundColor(.orange.opacity(0.6))
                                } else {
                                    Image(systemName: "circle")
                                        .foregroundColor(.gray.opacity(0.5))
                                }
                                Text(item.wrappedSkillName)
                            }
                            .onTapGesture {
                                withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                    toBeDeleted = false
                                    if selectedSkillInfo != item.wrappedSkillName {
                                        selectedSkillInfo = item.wrappedSkillName
                                    } else {
                                        selectedSkillInfo = nil
                                    }
                                }
                            }
                            Spacer()
                            
                            if selectedSkillInfo == item.wrappedSkillName {
                                Button{
                                    withAnimation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 1)){
                                        if toBeDeleted != true {
                                            toBeDeleted = true
                                        } else {
                                            toBeDeleted = false
                                        }
                                    }
                                }label: {
                                    Image(systemName: "trash")
                                        .foregroundColor(.primary)
                                }
                            }
                        }
                        .padding(.vertical, 1)
                        
                        Group {
                            if selectedSkillInfo == item.wrappedSkillName {
                                VStack {
                                    if toBeDeleted {
                                        HStack {
                                            Text("Törlés?")
                                                .titleStyle()
                                            Spacer()
                                            Button{
                                                withAnimation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 1)){
                                                    toBeDeleted = false
                                                }
                                            }label:{
                                                Image(systemName: "x.circle")
                                                    .titleStyle()
                                            }
                                            Button{
                                                withAnimation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 1)){
                                                    deleteSkillItem(item: item)
                                                }
                                            }label:{
                                                Image(systemName: "checkmark.circle")
                                                    .titleStyle()
                                            }
                                        }
                                        .frame(maxWidth: .infinity)
                                        .background(.red)
                                        .charInfoStyleBg()
                                    }
                                    SkillInfoView(skill: item)
                                }
                                .padding(.leading)
                                .padding(.bottom)
                            }
                        }
                    }
                }
                .titleStyle()
                .charInfoStyleBg()
            }
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 0.5, alignment: .center)
                .foregroundColor(Color.primary.opacity(0.2))
                .padding(.horizontal)
            HStack {
                Button {
                    showSheetAddSkills.toggle()
                } label: {
                    Image(systemName: "plus")
                    .buttonStyleOn()
                }
                .sheet(isPresented: $showSheetAddSkills) {
                    AddSkillsView(character: character, showSheetAddSkills: $showSheetAddSkills)
                }
                Text("Új képzettség hozzáadása")
                    .font(.system(size: 14).smallCaps().weight(.light))
                    .padding(.horizontal, 4)
                Spacer()
            }
            .charInfoStyleBg()
            
            Image(systemName: "circle.grid.cross.up.filled")
                .padding()
                .foregroundColor(.gray)
            
            Spacer()
        }
    }
    
    func deleteSkillItem(item: Skill) {
        character.removeFromSkills(item)
        moc.delete(item)
        try? moc.save()
    }
    
}

//struct EquipmentsView_Previews: PreviewProvider {
//    static var previews: some View {
//        EquipmentsView()
//    }
//}
