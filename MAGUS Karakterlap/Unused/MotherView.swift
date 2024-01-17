//
//  MotherView.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 10/09/2022.
//

import SwiftUI

struct MotherView: View {
    let character: Character
    
    @StateObject var pageSelector: PageSelector
    @State var showPopUp = false
     
    var body: some View {
        GeometryReader { geometry in
            VStack { // this is the Mother page where all Child pages will load in
                switch pageSelector.currentPage {
                case .character:
                    Spacer()
                    Text("WCharacter")
                    Spacer()
                case .values:
                    Spacer()
                    Text("Values")
                    Spacer()
                case .weapons:
                    Spacer()
                    Text("Weapons")
                    Spacer()
                case .magic:
                    Spacer()
                    Text("Magic")
                    Spacer()
                case .items:
                    Spacer()
                    Text("Items")
                    Spacer()
                case .skills:
                    Spacer()
                    Text("Skills")
                    Spacer()
                case .fight:
                    Spacer()
                    Text("Fight")
                    Spacer()
                }

                
                VStack { // this is the menu below
                    ZStack {
                        if showPopUp {
                            PopUpMenu(pageSelector: pageSelector, width: geometry.size.width/7, height: geometry.size.height/12)
                                .offset(y: -geometry.size.height/6)
                        }
                        HStack {
                            TabBarIcon(pageSelector: pageSelector, assignedPage: .character, width: geometry.size.width/10, height: geometry.size.height/21, systemIconName: "person.circle", tabName: "Karak")
                            TabBarIcon(pageSelector: pageSelector, assignedPage: .values, width: geometry.size.width/10, height: geometry.size.height/21, systemIconName: "heart.circle", tabName: "Érték")
                            TabBarIcon(pageSelector: pageSelector, assignedPage: .weapons, width: geometry.size.width/10, height: geometry.size.height/21, systemIconName: "arrow.up.forward.circle", tabName: "Fegyv")
                            ZStack {
                                Circle()
                                    .foregroundColor(.white)
                                    .frame(width: geometry.size.width/7, height: geometry.size.height/12)
                                    .shadow(radius: 4)
                                Image(systemName: "command.circle.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding(2)
                                    .frame(width: geometry.size.width/7, height: geometry.size.height/12)
                                    .foregroundColor(Color("DarkBlue"))
                                    .rotationEffect(Angle(degrees: showPopUp ? 90 : 0))
                            }
                            .offset(y: -geometry.size.height/8/2)
                            .onTapGesture {
                                withAnimation {
                                    showPopUp.toggle()
                                }
                            }
                            TabBarIcon(pageSelector: pageSelector, assignedPage: .magic, width: geometry.size.width/10, height: geometry.size.height/21, systemIconName: "book.circle.fill", tabName: "Mágia")
                            TabBarIcon(pageSelector: pageSelector, assignedPage: .items, width: geometry.size.width/10, height: geometry.size.height/21, systemIconName: "bag.circle", tabName: "Felsz")
                            TabBarIcon(pageSelector: pageSelector, assignedPage: .skills, width: geometry.size.width/10, height: geometry.size.height/21, systemIconName: "paperclip.circle.fill", tabName: "Képz")
                        }
                    }
                }
                .frame(width: geometry.size.width, height: geometry.size.height/8)
                .background(Color("TabBarBackground").shadow(radius: 2))
                
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarHidden(true)
        }
    }
}

//struct MotherView_Previews: PreviewProvider {
//    static var previews: some View {
//        MotherView()
//    }
//}
