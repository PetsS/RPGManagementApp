//
//  Equipment+CoreDataProperties.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 16/01/2023.
//
//

import Foundation
import CoreData


extension Equipment {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Equipment> {
        return NSFetchRequest<Equipment>(entityName: "Equipment")
    }

    @NSManaged public var equipmentName: String?
    @NSManaged public var equipmentQty: Int16
    @NSManaged public var equipmentComm: String?
    @NSManaged public var equipmentDesc: String?
    @NSManaged public var character: Character?
    
    public var wrappedEquipmentName: String {
        equipmentName ?? "Felszerelés név"
    }
    public var wrappedEquipmentComm: String {
        equipmentComm ?? "Nincs megjegyzés"
    }
    public var wrappedEquipmentDesc: String {
        equipmentDesc ?? "Nincs leírás"
    }
}

extension Equipment : Identifiable {

}
