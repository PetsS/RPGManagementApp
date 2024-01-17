//
//  ListView.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 10/09/2022.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var colorScheme
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)], animation: .default) var characters: FetchedResults<Character>
    
    @State private var doDeleteAlert = false
    @State private var image: Image?
    
    var body: some View {
        NavigationView {
            VStack (alignment: .leading, spacing: 0){
                VStack{ }
                    .padding(.vertical, 4)
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 1, alignment: .center)
                    .opacity(0.3)
                    .shadow(radius: 2, y: 1)
                    .padding(.horizontal, 10)
                if characters.count == 0 {
                    Spacer()
                    VStack (alignment: .center, spacing: 0){
                        Text("Még nincs karaktered.")
                            .titleStyle()
                        NavigationLink {
                            AddTabView()
                        } label: {
                            Image(systemName: "plus")
                                .buttonStyleOn()
                        }
                        .padding()
                        Image("img_listView_noItem")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 100)
                            .padding()
                    }
                    .padding()
                    .background(Color(red: 0.95, green: 0.95, blue: 0.95).opacity(0.6))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .frame(maxWidth: .infinity, maxHeight:.infinity)
                    Spacer()
                }
                List {
                    ForEach(characters) { character in
                        NavigationLink {
                            CharacterTabView(character: character)
                        } label: {
                            HStack {
                                ZStack{
                                    VStack (alignment: .center, spacing: 0){
                                        Image(systemName: "person")
                                            .resizable()
                                            .scaledToFit()
                                    }
                                    .foregroundColor(.primary)
                                    .padding()
                                   
                                    if image != nil {
                                        image?
                                            .resizable()
                                            .scaledToFill()
                                        
                                    } else {
                                        Image(uiImage: UIImage(data: character.charPhoto ?? Data()) ?? UIImage())
                                            .resizable()
                                            .scaledToFill()
                                    }
                                }
                                .frame(width: 50, height: 60, alignment: .top)
                                .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                                        .stroke(Color.primary, lineWidth: 2)
                                )
                                
                                
                                VStack (alignment: .leading, spacing:0) {
                                    Text(character.name ?? "Név")
                                        .font(.system(size: 27, weight: .bold))
                                    HStack (alignment: .center, spacing: 0){
                                        Text("\(character.level). szintű ")
//                                        Text("\(character.primaryCaste ?? "Főkaszt") /")
                                        Text(character.secondaryCaste ?? "Alkaszt")
                                    }
                                    .font(.system(size: 18, weight: .light, design: .rounded).smallCaps())
                                    .foregroundColor(.primary)
                                }
                                Spacer()
                            }
                        }
                    }
                    .onDelete(perform: deleteEntry)
//                    .padding(.horizontal, 10)
                    .listRowSeparator(Visibility.hidden)
                    .listRowBackground(colorScheme == .dark ? Color(red: 0.95, green: 0.95, blue: 0.95).opacity(0.3) : Color(red: 0.95, green: 0.95, blue: 0.95).opacity(0.9))
                }
                .listStyle(PlainListStyle())
            }
            .background(
                Image("img_ListView")
                    .resizable()
                    .scaledToFit()
                    .blur(radius: characters.count == 0 ? 1.6 : 0)
                    .opacity(characters.count == 0 ? 0.2 : 1)
                    .opacity(colorScheme == .dark ? 0.2 : 1)
            )
            .onAppear {
                UIApplication.shared.isIdleTimerDisabled = true
                listViewModel.emptyCache()
            }
            //            .navigationViewStyle(StackNavigationViewStyle())
            .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack (alignment: .center, spacing: 0){
                        HStack (alignment: .center, spacing: 0) {
                            Text("Karakter lista")
                                .titleStyle()
                        }
                    }
                    .padding(.vertical)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    if characters.count != 0 {
                        HStack{
                            NavigationLink {
                                AddTabView()
                            } label: {
                                Image(systemName: "plus")
                                    .buttonStyleOn()
                            }
                        }
                        .padding(.vertical)
                    }
                }
            }
        }
        
    }
 
    func deleteEntry (at offsets: IndexSet) {
        for offset in offsets {
            let entry = characters[offset]
            moc.delete(entry)
        }
        try? moc.save()
    }
    
}

//struct ListView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            ListView()
//        }
//    }
//}
