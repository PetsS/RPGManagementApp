//
//  StartView.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 15/09/2022.
//

import SwiftUI

struct IndexView: View {
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                VStack {
                    Image("indexLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width/1)
                        .padding()
                    
                    NavigationLink {
//                        ListView()
                    }label: {
                        Text("Tovább")
                    }
                    .foregroundColor(.white)
                    .font(.headline)
//                    .frame(width: 30)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 15)
                    .background(.gray.opacity(1))
                    .cornerRadius(15)
                    .shadow(radius: 2, y: 2)
                }
                .navigationViewStyle(StackNavigationViewStyle())
                .navigationBarHidden(true)
            }

        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        IndexView()
    }
}
