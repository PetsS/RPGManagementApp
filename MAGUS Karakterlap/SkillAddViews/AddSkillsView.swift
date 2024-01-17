//
//  AddSkillsView.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 06/11/2022.
//

import SwiftUI

struct AddSkillsView: View {
    let character: Character
    
    @EnvironmentObject var skillViewModel: SkillViewModel
    @Environment(\.managedObjectContext) var moc
    
    @FocusState private var keyboardIsFocused: Bool
    
    @Binding var showSheetAddSkills: Bool
    
    @State private var selectedSkillInfo : String?
    @State private var showAddAlert: Bool = false
    
    var body: some View {
        ScrollView {
        
            Image(systemName: "circle.grid.cross.up.filled")
                .padding()
                .foregroundColor(.gray)
            
            HStack {
                Text("Harci képzettségek")
                    .headerStyle()
                Spacer()
            }
            
            VStack (alignment: .leading, spacing: 0){
                ForEach(Array(skillViewModel.data.skillCat1.enumerated()), id: \.offset) { index, item in
                    HStack {
                        HStack {
                            if selectedSkillInfo == item.name {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.orange.opacity(0.6))
                            } else {
                                Image(systemName: "circle")
                                    .foregroundColor(.gray.opacity(0.5))
                            }
                            Text(item.name)
                        }
                        .titleStyle()
                        .onTapGesture {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 1)){
                                if selectedSkillInfo != item.name {
                                    selectedSkillInfo = item.name
                                } else {
                                    selectedSkillInfo = nil
                                }
                            }
                        }
                        Spacer()
                        
                        Button{
                            skillViewModel.data.skillName = item.name
                            skillViewModel.data.skillCategory = item.cat
                            skillViewModel.data.af = Int16(item.kpAf)
                            skillViewModel.data.mf = Int16(item.kpMf)
                            skillViewModel.data.skillDescription = item.desc
                            
                            saveMoc()
                            showAddAlert = true
                        }label: {
                            Image(systemName: "plus")
                                .buttonStyleDisabled(isValid: !character.skillsArray.contains(where: { $0.wrappedSkillName == item.name }))
                        }
                        .disabled(character.skillsArray.contains(where: { $0.wrappedSkillName == item.name }))
                        
                    }
                    .charInfoStyleBg()
                    .alert("\(skillViewModel.data.skillName) hozzáadva!", isPresented: $showAddAlert){
                        Button("OK") {
                            showSheetAddSkills = false
                        }
                    }
                    
                    Group {
                        if selectedSkillInfo == item.name {
                            VStack {
                                HStack (alignment: .center, spacing: 0){
                                    Text("\(item.desc)")
                                        .titleInfoStyle()
                                }
                                .frame(maxWidth: .infinity)
                                .charInfoStyleBg()

                                VStack (alignment: .trailing, spacing: 4){
                                    LazyVGrid (
                                        columns: [
                                            GridItem(.flexible(minimum: 180)),
                                            GridItem(.flexible()),
                                            GridItem(.flexible())
                                        ]
                                    ){
                                        Text("Típus")

                                        Text("AF")

                                        Text("MF")

                                    }
                                    .font(.system(size: 12).smallCaps().weight(.light))

                                    Rectangle()
                                        .frame(maxWidth: .infinity, maxHeight: 0.5, alignment: .center)
                                        .foregroundColor(Color.primary.opacity(0.2))

                                    LazyVGrid (
                                        columns: [
                                            GridItem(.flexible(minimum: 180)),
                                            GridItem(.flexible()),
                                            GridItem(.flexible())
                                        ]
                                    ){

                                        Text("\(item.cat)")
                                        
                                        Text("\(item.kpAf)")
                                        
                                        Text("\(item.kpMf)")

                                    }
                                    .font(.system(size: 14).smallCaps().weight(.light))
                                }
                                .padding(.horizontal)
                                .padding(.vertical, 5)
                                .charInfoStyleBg()
                            }
                            .padding(.leading)
                            .padding(.bottom)
                        }
                    }
                }
            }
            Spacer()
        }
        .padding(.top)
        
        //bottom bar
        HStack {
            Button {
                showSheetAddSkills.toggle()
            } label: {
                Image(systemName: "arrow.left")
                    .buttonStyleOn()
            }
            Spacer()
            Text("Képzettség hozzáadása")
                .titleStyle()
            Spacer()
            Button {
                
            } label: {
                Text("OK")
                    .buttonStyleOn()
            }
            .opacity(0)
            
        }
        .padding()
    }
    
    func saveMoc() {
        let addSkill = Skill(context: moc)
        addSkill.skillName = skillViewModel.data.skillName
        addSkill.skillCategory = skillViewModel.data.skillCategory
        addSkill.skillDescription = skillViewModel.data.skillDescription
        addSkill.af = Int16(skillViewModel.data.af)
        addSkill.mf = Int16(skillViewModel.data.mf)
        
        character.addToSkills(addSkill)
        
        if moc.hasChanges {
            try? moc.save()
        }
    }
    
}
//struct AddWeaponsView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddWeaponsView()
//    }
//}

