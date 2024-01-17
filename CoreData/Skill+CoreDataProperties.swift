//
//  Skill+CoreDataProperties.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 06/06/2023.
//
//

import Foundation
import CoreData


extension Skill {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Skill> {
        return NSFetchRequest<Skill>(entityName: "Skill")
    }

    @NSManaged public var skillName: String?
    @NSManaged public var skillDescription: String?
    @NSManaged public var skillCategory: String?
    @NSManaged public var af: Int16
    @NSManaged public var mf: Int16
    @NSManaged public var character: Character?
    
    public var wrappedSkillName: String {
        skillName ?? "Képzettség név"
    }
    public var wrappedSkillDescription: String {
        skillDescription ?? "Képzettség leírása"
    }
    public var wrappedSkillCategory: String {
        skillCategory ?? "Kategória név"
    }

}

extension Skill : Identifiable {

}
