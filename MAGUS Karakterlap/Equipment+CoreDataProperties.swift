//
//  Equipment+CoreDataProperties.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 15/01/2023.
//
//

import Foundation
import CoreData


extension Equipment {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Equipment> {
        return NSFetchRequest<Equipment>(entityName: "Equipment")
    }

    @NSManaged public var equipmentName: String?
    @NSManaged public var equipmentId: UUID?
    @NSManaged public var character: Character?

}

extension Equipment : Identifiable {

}
