//
//  CharacterData.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 05/10/2022.
//

import Foundation
import SwiftUI

struct CharacterData {
    
    var name: String
    var primaryCaste: String
    var secondaryCaste: String
    var race: String
    var alignment: String
    var religion: String
    var level: Int
    var charDescription: String
    
    var xp: Int
    
    var strength: Int
    var speed: Int
    var agility: Int
    var endurance: Int
    var health: Int
    var beauty: Int
    var intelligence: Int
    var willpower: Int
    var astral: Int
    var perception: Int
    
    var healthPoint: Int
    var healthPointAct: Int
    var painPoint: Int
    var painPointAct: Int
    
    var ke: Int
    var te: Int
    var ve: Int
    var ce: Int
    var hm: Int
    
    var addKe: Int
    var addTe: Int
    var addVe: Int
    var addCe: Int
    
    var weaponEquipped: String
    var weapon2Equipped: String
    var weaponName: String
    var weaponAttack: Int
    var weaponCe: Int
    var weaponDamage: Int
    var weaponDamageShow: String
    var weaponDistance: Int
    var weaponKe: Int
    var weaponTe: Int
    var weaponVe: Int
    
    var primaryCastes : [String]
    var warriorCastes : [String]
    var adventurerCastes : [String]
    var priestCastes : [String]
    var martialCastes : [String]
    var mageCastes : [String]
    var races : [String]
    var alignments : [String]
    
    var isKfTapped : (strength: Bool, speed: Bool, agility: Bool, endurance: Bool, health: Bool, beauty: Bool, intelligence: Bool, willpower: Bool, astral: Bool, perception: Bool)

}
