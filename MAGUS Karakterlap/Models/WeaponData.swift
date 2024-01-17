//
//  WeaponData.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 05/10/2022.
//

import Foundation
import SwiftUI

struct WeaponData {
    
    var weaponId: UUID
    
    var weaponName: String
    var weaponDamage: Int
    var weaponDamageShow: String
    var weaponKe: Int
    var weaponTe: Int
    var weaponVe: Int
    var weaponCe: Int
    var weaponAttack: Int
    var weaponDistance: Int
    var weaponDescription: String
    var weaponMGT: Int
    
    var weaponSelected: Bool
    
    var weaponCat1 : [(name:String, damShow:String, ke:Int, te:Int, ve:Int, ce:Int, atk:Int, dist:Int, desc:String)]
    var weaponCat2 : [String]
    var weaponCat3 : [String]
    var weaponCat4 : [String]
    var weaponCat5 : [String]
    var weaponCat6 : [(name:String, damShow:String, ke:Int, mgt:Int, ve:Int, atk:Int, desc:String)]
    var customCat : [(name:String, damShow:String, ke:Int, te:Int, ve:Int, ce:Int, atk:Int, dist:Int, desc:String)]
}
