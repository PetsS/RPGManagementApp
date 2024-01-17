//
//  Character+CoreDataProperties.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 17/11/2022.
//
//

import Foundation
import CoreData


extension Character {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Character> {
        return NSFetchRequest<Character>(entityName: "Character")
    }

    @NSManaged public var addCe: Int16
    @NSManaged public var addKe: Int16
    @NSManaged public var addTe: Int16
    @NSManaged public var addVe: Int16
    @NSManaged public var agility: Int16
    @NSManaged public var agilityModified: Int16
    @NSManaged public var alignment: String?
    @NSManaged public var astral: Int16
    @NSManaged public var beauty: Int16
    @NSManaged public var ce: Int16
    @NSManaged public var charDescription: String?
    @NSManaged public var charPhoto: Data?
    @NSManaged public var endurance: Int16
    @NSManaged public var health: Int16
    @NSManaged public var healthPoint: Int16
    @NSManaged public var healthPointAct: Int16
    @NSManaged public var hm: Int16
    @NSManaged public var id: UUID?
    @NSManaged public var intelligence: Int16
    @NSManaged public var ke: Int16
    @NSManaged public var level: Int16
    @NSManaged public var name: String?
    @NSManaged public var painPoint: Int16
    @NSManaged public var painPointAct: Int16
    @NSManaged public var perception: Int16
    @NSManaged public var primaryCaste: String?
    @NSManaged public var race: String?
    @NSManaged public var religion: String?
    @NSManaged public var secondaryCaste: String?
    @NSManaged public var speed: Int16
    @NSManaged public var speedModified: Int16
    @NSManaged public var strength: Int16
    @NSManaged public var te: Int16
    @NSManaged public var ve: Int16
    @NSManaged public var willpower: Int16
    @NSManaged public var xp: Int64
    @NSManaged public var notes: String?
    
    @NSManaged public var weaponId: UUID?
    @NSManaged public var weapon2Id: UUID?
    @NSManaged public var weaponEquipped: String?
    @NSManaged public var weapon2Equipped: String?
    @NSManaged public var weaponName: String?
    @NSManaged public var weaponAttack: Int16
    @NSManaged public var weaponCe: Int16
    @NSManaged public var weaponDamage: Int16
    @NSManaged public var weaponDamageShow: String?
    @NSManaged public var weaponDistance: Int16
    @NSManaged public var weaponKe: Int16
    @NSManaged public var weaponTe: Int16
    @NSManaged public var weaponVe: Int16
    
    @NSManaged public var armorId: UUID?
    @NSManaged public var armorEquipped: String?
    @NSManaged public var armorMGT: Int16
    @NSManaged public var armorSFE: Int16
    
    @NSManaged public var modifierName: String?
    @NSManaged public var modifierKe: Int16
    @NSManaged public var modifierTe: Int16
    @NSManaged public var modifierVe: Int16
    @NSManaged public var modifierCe: Int16
    @NSManaged public var modifierDescription: String?
    
    @NSManaged public var disadvantageName: String?
    @NSManaged public var disadvantageTe: Int16
    @NSManaged public var disadvantageVe: Int16
    
    @NSManaged public var targetName: String?
    @NSManaged public var targetDesc: String?
    @NSManaged public var targetValue: Int16
    
    @NSManaged public var weapons: NSSet?
    @NSManaged public var equipments: NSSet?
    @NSManaged public var modifiers: NSSet?
    @NSManaged public var disadvantages: NSSet?
    @NSManaged public var targets: NSSet?
    @NSManaged public var skills: NSSet?
    @NSManaged public var armors: NSSet?
    
    public var weaponsArray: [Weapon] {
        let set = weapons as? Set<Weapon> ?? []
        return set.sorted {
            $0.wrappedWeaponName < $1.wrappedWeaponName
        }
    }
 
    public var equipmentsArray: [Equipment] {
        let set = equipments as? Set<Equipment> ?? []
        return set.sorted {
            $0.wrappedEquipmentName < $1.wrappedEquipmentName
        }
    }
    
    public var modifiersArray: [Modifier] {
        let set = modifiers as? Set<Modifier> ?? []
        return set.sorted {
            $0.wrappedModifierName < $1.wrappedModifierName
        }
    }
    
    public var disadvantagesArray: [Disadvantage] {
        let set = disadvantages as? Set<Disadvantage> ?? []
        return set.sorted {
            $0.wrappedDisadvantageName < $1.wrappedDisadvantageName
        }
    }
    
    public var targetsArray: [Target] {
        let set = targets as? Set<Target> ?? []
        return set.sorted {
            $0.wrappedTargetName < $1.wrappedTargetName
        }
    }
    
    public var skillsArray: [Skill] {
        let set = skills as? Set<Skill> ?? []
        return set.sorted {
            $0.wrappedSkillName < $1.wrappedSkillName
        }
    }
    
    public var armorsArray: [Armor] {
        let set = armors as? Set<Armor> ?? []
        return set.sorted {
            $0.wrappedArmorName < $1.wrappedArmorName
        }
    }
    
    public var wrappedPrimaryCaste: String {
        primaryCaste ?? "Főkaszt"
    }
    public var wrappedSecondaryCaste: String {
        secondaryCaste ?? "Alkaszt"
    }
    public var wrappedWeaponEquipped: String {
        weaponEquipped ?? "Puszta kéz"
    }
    public var wrappedWeapon2Equipped: String {
        weapon2Equipped ?? "Nincs"
    }
    public var wrappedWeaponDamageShow: String {
        weaponDamageShow ?? "N/A"
    }
    public var wrappedDisadvantageName: String {
        disadvantageName ?? "Túlerő név"
    }
    public var wrappedName: String {
        name ?? "Név"
    }
    public var wrappedRace: String {
        race ?? "Faj"
    }
    public var wrappedTargetName: String {
        targetName ?? "Célzás módosító név"
    }
    public var wrappedAlignment: String {
        alignment ?? "Jellem"
    }
    public var wrappedReligion: String {
        religion ?? "Vallás"
    }
    public var wrappedNotes: String {
        notes ?? ""
    }
    public var wrappedCharDescription: String {
        charDescription ?? ""
    }
    public var wrappedArmorEquipped: String {
        armorEquipped ?? "Nincs"
    }
}

// MARK: Generated accessors for weapons
extension Character {

    @objc(addWeaponsObject:)
    @NSManaged public func addToWeapons(_ value: Weapon)

    @objc(removeWeaponsObject:)
    @NSManaged public func removeFromWeapons(_ value: Weapon)

    @objc(addWeapons:)
    @NSManaged public func addToWeapons(_ values: NSSet)

    @objc(removeWeapons:)
    @NSManaged public func removeFromWeapons(_ values: NSSet)
    
}

// MARK: Generated accessors for equipments
extension Character {

    @objc(addEquipmentsObject:)
    @NSManaged public func addToEquipments(_ value: Equipment)

    @objc(removeEquipmentsObject:)
    @NSManaged public func removeFromEquipments(_ value: Equipment)

    @objc(addEquipments:)
    @NSManaged public func addToEquipments(_ values: NSSet)

    @objc(removeEquipments:)
    @NSManaged public func removeFromEquipments(_ values: NSSet)

}

// MARK: Generated accessors for modifiers
extension Character {

    @objc(addModifiersObject:)
    @NSManaged public func addToModifiers(_ value: Modifier)

    @objc(removeModifiersObject:)
    @NSManaged public func removeFromModifiers(_ value: Modifier)

    @objc(addModifiers:)
    @NSManaged public func addToModifiers(_ values: NSSet)

    @objc(removeModifiers:)
    @NSManaged public func removeFromModifiers(_ values: NSSet)

}

// MARK: Generated accessors for disadvantages
extension Character {

    @objc(addDisadvantagesObject:)
    @NSManaged public func addToDisadvantages(_ value: Disadvantage)

    @objc(removeDisadvantagesObject:)
    @NSManaged public func removeFromDisadvantages(_ value: Disadvantage)

    @objc(addDisadvantages:)
    @NSManaged public func addToDisadvantages(_ values: NSSet)

    @objc(removeDisadvantages:)
    @NSManaged public func removeFromDisadvantages(_ values: NSSet)

}

// MARK: Generated accessors for targets
extension Character {

    @objc(addTargetsObject:)
    @NSManaged public func addToTargets(_ value: Target)

    @objc(removeTargetsObject:)
    @NSManaged public func removeFromTargets(_ value: Target)

    @objc(addTargets:)
    @NSManaged public func addToTargets(_ values: NSSet)

    @objc(removeTargets:)
    @NSManaged public func removeFromTargets(_ values: NSSet)

}

// MARK: Generated accessors for skills
extension Character {

    @objc(addSkillsObject:)
    @NSManaged public func addToSkills(_ value: Skill)

    @objc(removeSkillsObject:)
    @NSManaged public func removeFromSkills(_ value: Skill)

    @objc(addSkills:)
    @NSManaged public func addToSkills(_ values: NSSet)

    @objc(removeSkills:)
    @NSManaged public func removeFromSkills(_ values: NSSet)
    
}

// MARK: Generated accessors for armors
extension Character {

    @objc(addArmorsObject:)
    @NSManaged public func addToArmors(_ value: Armor)

    @objc(removeArmorsObject:)
    @NSManaged public func removeFromArmors(_ value: Armor)

    @objc(addArmors:)
    @NSManaged public func addToArmors(_ values: NSSet)

    @objc(removeArmors:)
    @NSManaged public func removeFromArmors(_ values: NSSet)
    
}

extension Character : Identifiable {

}

