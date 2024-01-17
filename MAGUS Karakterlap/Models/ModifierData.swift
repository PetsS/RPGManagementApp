//
//  ModifierData.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 05/10/2022.
//

import Foundation
import SwiftUI

struct ModifierData {
    
    var modifierId: UUID
    
    var modifierName: String
    var modifierDamage: Int
    var modifierDamageShow: String
    var modifierKe: Int
    var modifierTe: Int
    var modifierVe: Int
    var modifierCe: Int
    var modifierAttack: Int
    var modifierDistance: Int
    var modifierDescription: String
    
    var modifierCat1 : [(name:String, ke:Int, te:Int, ve:Int, ce:Int, desc:String)]
    var customModifierCat : [(name:String, damShow:String, ke:Int, te:Int, ve:Int, ce:Int, atk:Int, dist:Int, desc:String)]
    
    
}
