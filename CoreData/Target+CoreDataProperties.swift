//
//  Target+CoreDataProperties.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 25/01/2023.
//
//

import Foundation
import CoreData


extension Target {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Target> {
        return NSFetchRequest<Target>(entityName: "Target")
    }

    @NSManaged public var targetName: String?
    @NSManaged public var targetDesc: String?
    @NSManaged public var targetValue: Int16
    @NSManaged public var character: Character?

    public var wrappedTargetName: String {
        targetName ?? "Célzó érték módosító név"
    }
    public var wrappedTargetDesc: String {
        targetDesc ?? "Célzó érték módosító leírás"
    }
}

extension Target : Identifiable {

}
