//
//  ListViewModel.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 05/10/2022.
//

import Foundation
import SwiftUI

class ListViewModel: ObservableObject, Identifiable {
    
    @Environment(\.managedObjectContext) var moc
    
    @Published var data = CharacterData(
        name: "",
        primaryCaste: "Válassz",
        secondaryCaste: "Válassz",
        race: "Ember",
        alignment:"Rend",
        religion: "",
        level: 1,
        charDescription: "",
        xp: 0,
        
        strength: 0,
        speed: 0,
        agility: 0,
        endurance: 0,
        health: 0,
        beauty: 0,
        intelligence: 0,
        willpower: 0,
        astral: 0,
        perception: 0,
        
        healthPoint: 0,
        healthPointAct: 0,
        painPoint: 0,
        painPointAct: 0,
        
        ke: 0,
        te: 0,
        ve: 0,
        ce: 0,
        hm: 0,
        
        addKe: 0,
        addTe: 0,
        addVe: 0,
        addCe: 0,
        
        weaponEquipped: "",
        weapon2Equipped: "",
        weaponName: "",
        weaponAttack: 0,
        weaponCe: 0,
        weaponDamage: 0,
        weaponDamageShow: "",
        weaponDistance: 0,
        weaponKe: 0,
        weaponTe: 0,
        weaponVe: 0,
        
        primaryCastes: ["Harcos", "Szerencsevadász", "Pap", "Harcművész", "Mágiahasználó"],
        
        warriorCastes: ["Harcos", "Gladiátor", "Fejvadász", "Lovag", "Amazon", "Barbár", "Bajvívó"],
        adventurerCastes: ["Tolvaj", "Bárd"],
        priestCastes: ["Pap", "Paplovag", "Szerzetes", "Sámán"],
        martialCastes: ["Harcművész", "Kardművész"],
        mageCastes: ["Boszorkány", "Boszorkánymester", "Tűzvarázsló", "Varázsló"],
        races: ["Amund", "Dzsenn", "Ember", "Elf", "Félelf", "Khál", "Törpe", "Udvari ork", "Wier"],
        alignments: ["Rend", "Káosz", "Élet", "Halál", "Rend/Élet", "Rend/Halál", "Káosz/Élet", "Káosz/Halál", "Élet/Rend", "Élet/Káosz", "Halál/Rend", "Halál/Káosz"],
        
        isKfTapped: (false,false,false,false,false,false,false,false,false,false)
    )
    
    func castesSelection() -> [String] {
        
        switch data.primaryCaste {
        case "Szerencsevadász":
            return data.adventurerCastes
        case "Pap":
            return data.priestCastes
        case "Harcművész":
            return data.martialCastes
        case "Mágiahasználó":
            return data.mageCastes
        default:
            return data.warriorCastes
        }
    }
    
    func firstSecondaryCaste() -> String {
        
        switch data.primaryCaste {
        case "Válassz":
            return "Válassz"
        case "Szerencsevadász":
            return data.adventurerCastes[0]
        case "Pap":
            return data.priestCastes[0]
        case "Harcművész":
            return data.martialCastes[0]
        case "Mágiahasználó":
            return data.mageCastes[0]
        default:
            return data.warriorCastes[0]
        }
        
    }
    
    func emptyCache() {
        data.name = ""
        data.primaryCaste = "Válassz"
        data.secondaryCaste = "Válassz"
        data.race = "Ember"
        data.alignment = "Rend"
        data.religion = ""
        data.level = 1
        data.xp = 0
        data.charDescription = ""
        data.strength = 0
        data.speed = 0
        data.agility = 0
        data.endurance = 0
        data.health = 0
        data.beauty = 0
        data.intelligence = 0
        data.willpower = 0
        data.astral = 0
        data.perception = 0
        data.healthPoint = 0
        data.healthPointAct = 0
        data.painPoint = 0
        data.painPointAct = 0
        data.ke = 0
        data.te = 0
        data.ve = 0
        data.ce = 0
        data.hm = 0
        data.addKe = 0
        data.addTe = 0
        data.addVe = 0
        data.addCe = 0
    }
    
    func eraseProps() {
        data.strength = 0
        data.speed = 0
        data.agility = 0
        data.endurance = 0
        data.health = 0
        data.beauty = 0
        data.intelligence = 0
        data.willpower = 0
        data.astral = 0
        data.perception = 0
        data.isKfTapped.strength = false
        data.isKfTapped.speed = false
        data.isKfTapped.agility = false
        data.isKfTapped.health = false
        data.isKfTapped.endurance = false
        data.isKfTapped.beauty = false
        data.isKfTapped.intelligence = false
        data.isKfTapped.willpower = false
        data.isKfTapped.astral = false
    }
    
    func calcProps() {
        data.strength = propCalculator.propCalc(data.secondaryCaste).strength + raceModifCalculator.raceModifCalc(data.race).strength
        data.speed = propCalculator.propCalc(data.secondaryCaste).speed + raceModifCalculator.raceModifCalc(data.race).speed
        data.agility = propCalculator.propCalc(data.secondaryCaste).agility + raceModifCalculator.raceModifCalc(data.race).agility
        data.endurance = propCalculator.propCalc(data.secondaryCaste).endurance + raceModifCalculator.raceModifCalc(data.race).endurance
        data.health = propCalculator.propCalc(data.secondaryCaste).health + raceModifCalculator.raceModifCalc(data.race).health
        data.beauty = propCalculator.propCalc(data.secondaryCaste).beauty + raceModifCalculator.raceModifCalc(data.race).beauty
        data.intelligence = propCalculator.propCalc(data.secondaryCaste).intelligence + raceModifCalculator.raceModifCalc(data.race).intelligence
        data.willpower = propCalculator.propCalc(data.secondaryCaste).willpower + raceModifCalculator.raceModifCalc(data.race).willpower
        data.astral = propCalculator.propCalc(data.secondaryCaste).astral + raceModifCalculator.raceModifCalc(data.race).astral
        data.perception = propCalculator.propCalc(data.secondaryCaste).perception + raceModifCalculator.raceModifCalc(data.race).perception
        
    }
    
    var hasValidEntry: Bool {
        if data.name.isEmpty {
            return false
        }
        return true
    }
    
}

