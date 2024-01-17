//
//  MAGUS_KarakterlapApp.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 10/09/2022.
//

import SwiftUI

@main
struct MAGUS_KarakterlapApp: App {

    @StateObject private var dataController: DataController = DataController()
    @StateObject private var listViewModel: ListViewModel = ListViewModel()
    @StateObject private var equipmentViewModel: EquipmentViewModel = EquipmentViewModel()
    @StateObject private var skillViewModel: SkillViewModel = SkillViewModel()
    
    var body: some Scene {
        WindowGroup {
            
                ListView()
            
            .environment(\.managedObjectContext, dataController.container.viewContext)
            .environmentObject(listViewModel)
            .environmentObject(equipmentViewModel)
            .environmentObject(skillViewModel)
            .onAppear { UIApplication.shared.isIdleTimerDisabled = true }
        }
    }
}




