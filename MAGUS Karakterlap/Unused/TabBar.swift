//
//  TabBar.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 16/09/2022.
//

import Foundation
import SwiftUI

struct TabBarIcon: View {
    
    @StateObject var pageSelector: PageSelector
    
    let assignedPage: PageSelector.Page
    let width, height: CGFloat
    let systemIconName, tabName: String
    
    var body: some View {
        VStack {
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(.top, 10)
            Text(tabName)
                .font(.footnote)
            Spacer()
        }
        .onTapGesture {
            pageSelector.currentPage = assignedPage
        }
        .foregroundColor(pageSelector.currentPage == assignedPage ? Color("TabBarHighlight") : .gray)
    }
}

struct PopUpMenu: View {
    
    @StateObject var pageSelector: PageSelector
    let width, height: CGFloat
    
    var body: some View {
        HStack (spacing: 50) {
            ZStack {
                Circle()
                    .foregroundColor(Color("DarkBlue"))
                    .frame(width: width, height: height)
                Image(systemName: "trophy")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
                    .frame(width: width, height: height)
                    .foregroundColor(.white)
                
            }
            .onTapGesture {
                pageSelector.currentPage = .fight
            }
            ZStack {
                Circle()
                    .foregroundColor(Color("DarkBlue"))
                    .frame(width: width, height: height)
                Image(systemName: "waveform")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
                    .frame(width: width, height: height)
                    .foregroundColor(.white)
                
            }
            .onTapGesture {
                pageSelector.currentPage = .fight
            }
        }
        .transition(.scale)
    }
    
}
