//
//  Modifier+CoreDataProperties.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 20/01/2023.
//
//

import Foundation
import CoreData


extension Modifier {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Modifier> {
        return NSFetchRequest<Modifier>(entityName: "Modifier")
    }

    @NSManaged public var modifierId: UUID?
    
    @NSManaged public var modifierCe: Int16
    @NSManaged public var modifierDescription: String?
    @NSManaged public var modifierKe: Int16
    @NSManaged public var modifierName: String?
    @NSManaged public var modifierTe: Int16
    @NSManaged public var modifierVe: Int16
    
    @NSManaged public var character: Character?
    
    public var wrappedModifierName: String {
        modifierName ?? "Harci helyzet módosító név"
    }
    
    public var wrappedModifierDescription: String {
        modifierDescription ?? "Harci helyzet leírás"
    }
}

extension Modifier : Identifiable {

}
