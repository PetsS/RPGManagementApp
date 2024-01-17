//
//  Armor+CoreDataProperties.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 08/06/2023.
//
//

import Foundation
import CoreData


extension Armor {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Armor> {
        return NSFetchRequest<Armor>(entityName: "Armor")
    }

    @NSManaged public var armorId: UUID?
    @NSManaged public var armorName: String?
    @NSManaged public var armorMGT: Int16
    @NSManaged public var armorSFE: Int16
    @NSManaged public var armorDescription: String?
    @NSManaged public var armorType: String?
    @NSManaged public var character: Character?
    
    public var wrappedArmorName: String {
        armorName ?? "Vértezet név"
    }

    public var wrappedArmorDescription: String {
        armorDescription ?? "Vértezet leírás"
    }
    
    public var wrappedArmorType: String {
        armorType ?? "Vértezet típusa"
    }
    
    public var wrappedArmorId: UUID {
        armorId ?? UUID()
    }
}

extension Armor : Identifiable {

}
