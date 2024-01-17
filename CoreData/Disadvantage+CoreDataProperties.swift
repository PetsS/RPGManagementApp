//
//  Disadvantage+CoreDataProperties.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 22/01/2023.
//
//

import Foundation
import CoreData


extension Disadvantage {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Disadvantage> {
        return NSFetchRequest<Disadvantage>(entityName: "Disadvantage")
    }

    @NSManaged public var disadvantageName: String?
    @NSManaged public var disadvantage: Int16
    @NSManaged public var character: Character?

    public var wrappedDisadvantageName: String {
        disadvantageName ?? "Tulero név"
    }
}

extension Disadvantage : Identifiable {

}
