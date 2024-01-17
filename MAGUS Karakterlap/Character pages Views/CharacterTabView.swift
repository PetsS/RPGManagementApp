//
//  HomeView.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 23/09/2022.
//

import SwiftUI

struct CharacterTabView: View {
    let character: Character
    
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var moc
    
    @FocusState private var keyboardIsFocused: Bool
    
    @State var currentTab = 0
    @State private var showSheetDiceRoller = false
    
    
    var body: some View {
        VStack (alignment: .center, spacing: 0){
            VStack (alignment: .leading, spacing: 0){
                VStack{ }
                    .padding(.vertical, 4)
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 1, alignment: .center)
                    .opacity(0.3)
                    .shadow(radius: 2, y: 1)
                    .padding(.horizontal, 10)
            }
            
            // TabView menu
            VStack (alignment: .center, spacing: 0){
                HStack(spacing: 0) {
                    VStack (spacing: 0){
                        Image(systemName: "person.fill")
                            .font(self.currentTab == 0 ? .headline.bold() : .headline)
                        Text("Info")
                    }
                    .foregroundColor(self.currentTab == 0 ? .white : .gray.opacity(0.7))
                    .font(.caption2)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .frame(width: 60, height: 47)
                    .background(.gray.opacity(self.currentTab == 0 ? 1 : 0))
                    .animation(.spring(response: 0.6), value: currentTab)
                    .cornerRadius(15)
                    .onTapGesture{
                        self.currentTab = 0
                    }
                    
                    Spacer(minLength: 0)
                    
                    VStack (spacing: 0){
                        Image(systemName: "briefcase.fill")
                            .font(self.currentTab == 1 ? .headline.bold() : .headline)
                        Text("Felsz")
                    }
                    .foregroundColor(self.currentTab == 1 ? .white : .gray.opacity(0.7))
                    .font(.caption2)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .frame(width: 60, height: 47)
                    .background(.gray.opacity(self.currentTab == 1 ? 1 : 0))
                    .animation(.spring(response: 0.6), value: currentTab)
                    .cornerRadius(15)
                    .onTapGesture{
                        self.currentTab = 1
                    }
                    
                    Spacer(minLength: 0)
                    
                    VStack (spacing: 0){
                        Image(systemName: "books.vertical.fill")
                            .font(self.currentTab == 2 ? .headline.bold() : .headline)
                        Text("Képz")
                    }
                    .foregroundColor(self.currentTab == 2 ? .white : .gray.opacity(0.7))
                    .font(.caption2)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .frame(width: 60, height: 47)
                    .background(.gray.opacity(self.currentTab == 2 ? 1 : 0))
                    .animation(.spring(response: 0.6), value: currentTab)
                    .cornerRadius(15)
                    .onTapGesture{
                        self.currentTab = 2
                    }
                    
                    Spacer(minLength: 0)
                    
                    VStack (spacing: 0){
                        Image(systemName: "asterisk")
                            .font(self.currentTab == 3 ? .headline.bold() : .headline)
                        Text("Mágia")
                    }
                    .foregroundColor(self.currentTab == 3 ? .white : .gray.opacity(0.7))
                    .font(.caption2)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .frame(width: 60, height: 47)
                    .background(.gray.opacity(self.currentTab == 3 ? 1 : 0))
                    .animation(.spring(response: 0.6), value: currentTab)
                    .cornerRadius(15)
                    .onTapGesture{
                        self.currentTab = 3
                    }
                    
                    Spacer(minLength: 0)
                    
                    VStack (spacing: 0){
                        Image(systemName: "flag.2.crossed.fill")
                            .font(self.currentTab == 4 ? .headline.bold() : .headline)
                        Text("Harc")
                    }
                    .foregroundColor(self.currentTab == 4 ? .white : .gray.opacity(0.7))
                    .font(.caption2)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .frame(width: 60, height: 47)
                    .background(.gray.opacity(self.currentTab == 4 ? 1 : 0))
                    .animation(.spring(response: 0.6), value: currentTab)
                    .cornerRadius(15)
                    .onTapGesture{
                        self.currentTab = 4
                    }
                }
                .background(.ultraThinMaterial)
                .cornerRadius(15)
                .padding(.horizontal)
//                .padding(.vertical, 8)
            }

            VStack (alignment: .leading, spacing: 0){
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 1, alignment: .center)
                    .opacity(0.3)
                    .shadow(radius: 2, y: 1)
                    .padding(.horizontal, 10)
            }
            
            // TabView pages
            
            TabView(selection: self.$currentTab){
                CharacterView(character: character).tag(0)
                EquipmentsView(character: character).tag(1)
                SkillsView(character: character).tag(2)
                View2().tag(3)
                FightView(character: character).tag(4)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .ignoresSafeArea(.all)
//            .background(Color.primary.opacity(0.5))
            
                
                Spacer(minLength: 0)
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    HStack{
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "arrow.left")
                            .buttonStyleOn()
                        }
                        Spacer()
                    }
                }
                ToolbarItem(placement: .principal) {
                    VStack (alignment: .center){
                        Text(character.name ?? "Név")
                            .font(.system(size: 16).weight(.medium))
                        HStack {
                            Text("\(character.race ?? "Ember")")
                            Text("|")
                                .foregroundColor(Color.orange.opacity(0.7))
                            Text(character.secondaryCaste ?? "Alkaszt")
                            Text("|")
                                .foregroundColor(Color.orange.opacity(0.7))
                            Text("\(character.level)")
                        }
                        .font(.system(size: 12).smallCaps().weight(.light))
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack{
                        Spacer()
                        Button {
                            showSheetDiceRoller.toggle()
                        } label: {
                            Image(systemName: "dice.fill")
                                .buttonStyleOn()
                        }
                    }
                }
            }
            .sheet(isPresented: $showSheetDiceRoller) {
                DiceRollerView(showSheetDiceRoller: $showSheetDiceRoller)
            }
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
