//
//  SkillInfoView.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 19/11/2022.
//

import SwiftUI

struct SkillInfoView: View {
    let skill: Skill
    
    var body: some View {
            HStack (alignment: .center, spacing: 0){
                Text("\(skill.wrappedSkillDescription)")
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
                    
                    Text("\(skill.wrappedSkillCategory)")
                    
                    Text("\(skill.af)")
                    
                    Text("\(skill.mf)")
                    
                }
                .font(.system(size: 14).smallCaps().weight(.light))
            }
            .padding(.horizontal)
            .padding(.vertical, 5)
            .charInfoStyleBg()
    }
}

