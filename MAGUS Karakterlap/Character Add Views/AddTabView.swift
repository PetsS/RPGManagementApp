//
//  AddTabView.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 24/09/2022.
//
import SwiftUI

struct AddTabView: View {
    
    @State var currentTab: Int = 0
    
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var moc
    
    @State private var showAlert = false
    @State private var showAlertBack = false
    
    
    var body: some View {
        
        VStack {
            VStack (alignment: .leading, spacing: 0){
                VStack{ }
                    .padding(.vertical, 4)
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 1, alignment: .center)
                    .opacity(0.3)
                    .shadow(radius: 2, y: 1)
                    .padding(.horizontal, 10)
            }
            
            // Tab Bar
            
            TabBarView(currentTab: self.$currentTab)

            // Body
            
            TabView(selection: self.$currentTab) {
                AddInfoView().tag(0)
                AddPropertiesView().tag(1)
                AddHealthPointsView().tag(2)
                AddFightPointsView().tag(3)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
//            .edgesIgnoringSafeArea(.all)
            
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading){
                HStack{
                    Button {
                        showAlertBack = true
                    } label: {
                        Image(systemName: "arrow.left")
                        .buttonStyleOn()
                    }
                    .alert("Kilépés", isPresented: $showAlertBack) {
                        Button ("OK") {
                            dismiss()
                        }
                        Button ("Mégse", role: .cancel) { }
                    }message: {
                        Text("összes beállítás elvész")
                    }
                    Spacer()
                }
            }
            ToolbarItem(placement: .principal) {
                VStack (alignment: .center, spacing: 0){
                    HStack (alignment: .center, spacing: 0) {
                        Text("Karakter alkotás")
                            .titleStyle()
                    }
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack{
                    Spacer()
                    Button {
                        showAlert = true
                        saveMoc()
                    } label: {
                        Image(systemName: listViewModel.hasValidEntry ? "square.and.arrow.down.fill" : "square.and.arrow.down")
                            .buttonStyleDisabled(isValid: listViewModel.hasValidEntry)
                    }
                    .disabled(listViewModel.hasValidEntry == false)
                    .alert("Karakterlap mentve!", isPresented: $showAlert) {
                        Button ("OK") {
                            dismiss()
                        }
                    }
                }
            }
        }
        
    }
    
    func saveMoc() {
        let newEntry = Character(context: moc)
        newEntry.id = UUID()
        newEntry.name = listViewModel.data.name
        newEntry.primaryCaste = listViewModel.data.primaryCaste
        newEntry.secondaryCaste = listViewModel.data.secondaryCaste
        newEntry.race = listViewModel.data.race
        newEntry.alignment = listViewModel.data.alignment
        newEntry.religion = listViewModel.data.religion
        newEntry.level = Int16(listViewModel.data.level)
        newEntry.xp = Int64(listViewModel.data.xp)
        newEntry.charDescription = listViewModel.data.charDescription
        newEntry.strength = Int16(listViewModel.data.strength)
        newEntry.speed = Int16(listViewModel.data.speed)
        newEntry.agility = Int16(listViewModel.data.agility)
        newEntry.endurance = Int16(listViewModel.data.endurance)
        newEntry.health = Int16(listViewModel.data.health)
        newEntry.beauty = Int16(listViewModel.data.beauty)
        newEntry.intelligence = Int16(listViewModel.data.intelligence)
        newEntry.willpower = Int16(listViewModel.data.willpower)
        newEntry.astral = Int16(listViewModel.data.astral)
        newEntry.perception = Int16(listViewModel.data.perception)
        newEntry.healthPoint = Int16(listViewModel.data.healthPoint)
        newEntry.healthPointAct = Int16(listViewModel.data.healthPointAct)
        newEntry.painPoint = Int16(listViewModel.data.painPoint)
        newEntry.painPointAct = Int16(listViewModel.data.painPointAct)
        newEntry.ke = Int16(listViewModel.data.ke)
        newEntry.te = Int16(listViewModel.data.te)
        newEntry.ve = Int16(listViewModel.data.ve)
        newEntry.ce = Int16(listViewModel.data.ce)
        newEntry.hm = Int16(listViewModel.data.hm)
        newEntry.addKe = Int16(listViewModel.data.addKe)
        newEntry.addTe = Int16(listViewModel.data.addTe)
        newEntry.addVe = Int16(listViewModel.data.addVe)
        newEntry.addCe = Int16(listViewModel.data.addCe)

        if moc.hasChanges {
            try? moc.save()
        }
    }
}

struct CharGenTabView_Previews: PreviewProvider {
    static var previews: some View {
        AddTabView()
    }
}

struct TabBarView: View {
    @Binding var currentTab: Int
    @Namespace var namespace
    
    var tabBarOptions: [String] = ["Info", "Főértékek", "Ép/Fp", "Harcértékek"]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(Array(zip(self.tabBarOptions.indices, self.tabBarOptions)), id: \.0) { index, name in
                    TabBarItem(currentTab: self.$currentTab, namespace: namespace.self, tabBarItemName: name, tab: index)
                }
            }
            .padding(.horizontal)
        }
        .frame(height: 5)
        .padding()
        .edgesIgnoringSafeArea(.all)
    }
}

struct TabBarItem: View {
    @Binding var currentTab: Int
    let namespace: Namespace.ID
    
    var tabBarItemName: String
    var tab: Int
    
    var body: some View {
        Button {
            self.currentTab = tab
        } label: {
            VStack (alignment: .leading) {
                Spacer()
                Text(tabBarItemName)
                    .font(.system(size: 16).smallCaps().weight(.light))
                    .foregroundColor(currentTab == tab ? .orange.opacity(0.6) : .primary)
                if currentTab == tab {
                    Color.orange.opacity(0.6)
                        .frame(height: 2)
                        .matchedGeometryEffect(id: "underline", in: namespace, properties: .frame)
                } else {
                    Color.clear.frame(height: 2)
                }
            }
            .animation(.spring(response: 1, dampingFraction: 1, blendDuration: 5), value: self.currentTab)
        }
        .buttonStyle(.plain)
    }
}
