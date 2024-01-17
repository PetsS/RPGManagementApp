//
//  Weapon+CoreDataProperties.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 17/11/2022.
//
//

import Foundation
import CoreData


extension Weapon {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Weapon> {
        return NSFetchRequest<Weapon>(entityName: "Weapon")
    }

    @NSManaged public var weaponAttack: Int16
    @NSManaged public var weaponCe: Int16
    @NSManaged public var weaponDamage: Int16
    @NSManaged public var weaponDamageShow: String?
    @NSManaged public var weaponDistance: Int16
    @NSManaged public var weaponId: UUID?
    @NSManaged public var weapon2Id: UUID?
    @NSManaged public var weaponKe: Int16
    @NSManaged public var weaponMGT: Int16
    @NSManaged public var weaponName: String?
    @NSManaged public var weaponTe: Int16
    @NSManaged public var weaponVe: Int16
    @NSManaged public var weaponSelected: Bool
    @NSManaged public var weaponDescription: String?
    @NSManaged public var character: Character?
    
    public var wrappedWeaponName: String {
        weaponName ?? "Név"
    }
    public var wrappedWeaponDamageShow: String {
        weaponDamageShow ?? "Fegyver Sebzés"
    }
    public var wrappedWeaponDescription: String {
        weaponDescription ?? "Fegyver Leírás"
    }

}

extension Weapon : Identifiable {

}
