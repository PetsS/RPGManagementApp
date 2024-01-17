//
//  PropCalculator.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 17/09/2022.
//

import Foundation

class raceModifCalculator {
    
    static func raceModifCalc(_ race: String) -> (strength: Int, speed: Int, agility: Int, endurance: Int, health: Int, beauty: Int, intelligence: Int, willpower: Int, astral: Int, perception: Int) {
        
        var tuple: (strength: Int, speed: Int, agility: Int, endurance: Int, health: Int, beauty: Int, intelligence: Int, willpower: Int, astral: Int, perception: Int) = (0,0,0,0,0,0,0,0,0,0)

        if race == "Amund" {
            tuple = (
                strength: 1,
                speed: 0,
                agility: 0,
                endurance: 1,
                health: 0,
                beauty: 2,
                intelligence: 0,
                willpower: 0,
                astral: -1,
                perception: 0
            )
        } else if race == "Dzsenn" {
            tuple = (
                strength: 0,
                speed: 0,
                agility: 0,
                endurance: 0,
                health: 0,
                beauty: 0,
                intelligence: 2,
                willpower: 0,
                astral: 0,
                perception: 0
            )
        } else if race == "Ember" {
            tuple = (
                strength: 0,
                speed: 0,
                agility: 0,
                endurance: 0,
                health: 0,
                beauty: 0,
                intelligence: 0,
                willpower: 0,
                astral: 0,
                perception: 0
            )
        } else if race == "Elf" {
            tuple = (
                strength: -2,
                speed: 1,
                agility: 1,
                endurance: -1,
                health: 0,
                beauty: 1,
                intelligence: 0,
                willpower: 0,
                astral: 0,
                perception: 0
            )
        } else if race == "Félelf" {
            tuple = (
                strength: -1,
                speed: 1,
                agility: 0,
                endurance: 0,
                health: 0,
                beauty: 0,
                intelligence: 0,
                willpower: 0,
                astral: 0,
                perception: 0
            )
        } else if race == "Khál" {
            tuple = (
                strength: 3,
                speed: 2,
                agility: 1,
                endurance: 2,
                health: 3,
                beauty: 0,
                intelligence: -1,
                willpower: 0,
                astral: -5,
                perception: 0
            )
        } else if race == "Törpe" {
            tuple = (
                strength: 1,
                speed: 0,
                agility: 0,
                endurance: 1,
                health: 1,
                beauty: -2,
                intelligence: -1,
                willpower: 0,
                astral: -1,
                perception: 0
            )
        } else if race == "Udvari ork" {
            tuple = (
                strength: 2,
                speed: 0,
                agility: 0,
                endurance: 1,
                health: 2,
                beauty: -3,
                intelligence: 1,
                willpower: 0,
                astral: -3,
                perception: 0
            )
        } else if race == "Wier" {
            tuple = (
                strength: 0,
                speed: 0,
                agility: 0,
                endurance: 0,
                health: 0,
                beauty: 1,
                intelligence: 1,
                willpower: 0,
                astral: 0,
                perception: 0
            )
        }
        return tuple
    }
    
    static func raceModifShow(_ race: String) -> (strength: String, speed: String, agility: String, endurance: String, health: String, beauty: String, intelligence: String, willpower: String, astral: String, perception: String) {
        
        var tuple: (strength: String, speed: String, agility: String, endurance: String, health: String, beauty: String, intelligence: String, willpower: String, astral: String, perception: String) = ("","","","","","","","","","")
        
        if race == "Amund" {
            tuple = (
                strength: "+1",
                speed: "0",
                agility: "0",
                endurance: "+1",
                health: "0",
                beauty: "+2",
                intelligence: "0",
                willpower: "0",
                astral: "-1",
                perception: "0"
            )
        } else if race == "Dzsenn" {
            tuple = (
                strength: "0",
                speed: "0",
                agility: "0",
                endurance: "0",
                health: "0",
                beauty: "0",
                intelligence: "+2",
                willpower: "0",
                astral: "0",
                perception: "0"
            )
        } else if race == "Ember" {
            tuple = (
                strength: "0",
                speed: "0",
                agility: "0",
                endurance: "0",
                health: "0",
                beauty: "0",
                intelligence: "0",
                willpower: "0",
                astral: "0",
                perception: "0"
            )
        } else if race == "Elf" {
            tuple = (
                strength: "-2",
                speed: "+1",
                agility: "+1",
                endurance: "-1",
                health: "0",
                beauty: "+1",
                intelligence: "0",
                willpower: "0",
                astral: "0",
                perception: "0"
            )
        } else if race == "Félelf" {
            tuple = (
                strength: "-1",
                speed: "+1",
                agility: "0",
                endurance: "0",
                health: "0",
                beauty: "0",
                intelligence: "0",
                willpower: "0",
                astral: "0",
                perception: "0"
            )
        } else if race == "Khál" {
            tuple = (
                strength: "+3",
                speed: "+2",
                agility: "+1",
                endurance: "+2",
                health: "+3",
                beauty: "0",
                intelligence: "-1",
                willpower: "0",
                astral: "-5",
                perception: "0"
            )
        } else if race == "Törpe" {
            tuple = (
                strength: "+1",
                speed: "0",
                agility: "0",
                endurance: "+1",
                health: "+1",
                beauty: "-2",
                intelligence: "-1",
                willpower: "0",
                astral: "-1",
                perception: "0"
            )
        } else if race == "Udvari ork" {
            tuple = (
                strength: "+2",
                speed: "0",
                agility: "0",
                endurance: "+1",
                health: "+2",
                beauty: "-3",
                intelligence: "+1",
                willpower: "0",
                astral: "-3",
                perception: "0"
            )
        } else if race == "Wier" {
            tuple = (
                strength: "0",
                speed: "0",
                agility: "0",
                endurance: "0",
                health: "0",
                beauty: "+1",
                intelligence: "+1",
                willpower: "0",
                astral: "0",
                perception: "0"
            )
        }
        return tuple
    }
}

class diceCalculator {

    static func diceCalc(_ secCaste: String) -> (strength: String, speed: String, agility: String, endurance: String, health: String, beauty: String, intelligence: String, willpower: String, astral: String, perception: String) {

        var tuple: (strength: String, speed: String, agility: String, endurance: String, health: String, beauty: String, intelligence: String, willpower: String, astral: String, perception: String) = ("","","","","","","","","","")

        if secCaste == "Harcos" {
            tuple = (
                strength: "k6+12+kf",
                speed: "2k6+6+kf",
                agility: "2k6+6+kf",
                endurance: "k10+8+kf",
                health: "k10+10",
                beauty: "3k6 (2x)",
                intelligence: "3k6 (2x)",
                willpower: "2k6+6",
                astral: "3k6 (2x)",
                perception: "2K6+6"
            )
        } else if secCaste == "Gladiátor" {
            tuple = (
                strength: "k6+12+kf",
                speed: "2k6+6+kf",
                agility: "2k6+6+kf",
                endurance: "k6+12+kf",
                health: "k10+10",
                beauty: "2k6+6",
                intelligence: "3k6",
                willpower: "3k6",
                astral: "3k6",
                perception: "2K6+6"
            )
        } else if secCaste == "Fejvadász" {
            tuple = (
                strength: "2k6+6",
                speed: "k6+12+kf",
                agility: "k10+10",
                endurance: "k6+12+kf",
                health: "k10+10",
                beauty: "3k6",
                intelligence: "3k6 (2x)",
                willpower: "k10+8",
                astral: "2k6+6",
                perception: "K6+12"
            )
        } else if secCaste == "Lovag" {
            tuple = (
                strength: "k6+12+kf",
                speed: "3k6 (2x)",
                agility: "3k6 (2x)",
                endurance: "k10+8+kf",
                health: "k10+10",
                beauty: "2k6+6+kf",
                intelligence: "2k6+6",
                willpower: "k10+8",
                astral: "3k6 (2x)",
                perception: "2K6+6"
            )
        } else if secCaste == "Amazon" {
            tuple = (
                strength: "2k6+6",
                speed: "k10+8",
                agility: "k10+8",
                endurance: "2k6+6",
                health: "2k6+6",
                beauty: "k10+8",
                intelligence: "3k6 (2x)",
                willpower: "2k6+6",
                astral: "3k6 (2x)",
                perception: "K10+8"
            )
        } else if secCaste == "Barbár" {
            tuple = (
                strength: "k6+14+kf",
                speed: "k10+8",
                agility: "2k6+6",
                endurance: "k6+14",
                health: "k10+10",
                beauty: "3k6 (2x)",
                intelligence: "3k6",
                willpower: "2k6+6",
                astral: "3k6-1",
                perception: "K10+8"
            )
        } else if secCaste == "Bajvívó" {
            tuple = (
                strength: "2k6+6",
                speed: "k10+8+kf",
                agility: "k10+8+kf",
                endurance: "3k6 (2x)",
                health: "3k6",
                beauty: "3k6 (2x)",
                intelligence: "3k6 (2x)",
                willpower: "3k6",
                astral: "k6+12",
                perception: "K10+8"
            )
        } else if secCaste == "Tolvaj" {
            tuple = (
                strength: "3k6 (2x)",
                speed: "k10+8+kf",
                agility: "k6+12+kf",
                endurance: "3k6 (2x)",
                health: "3k6 (2x)",
                beauty: "2k6+6",
                intelligence: "2k6+6",
                willpower: "3k6 (2x)",
                astral: "3k6 (2x)",
                perception: "K6+12"
            )
        } else if secCaste == "Bárd" {
            tuple = (
                strength: "k10+8",
                speed: "k10+8+kf",
                agility: "k10+8",
                endurance: "2k6+6",
                health: "2k6+6",
                beauty: "k6+12+kf",
                intelligence: "k10+8 (2x)",
                willpower: "2k6+6",
                astral: "k10+8",
                perception: "K10+8"
            )
        } else if secCaste == "Pap" {
            tuple = (
                strength: "2k6+6",
                speed: "3k6 (2x)",
                agility: "3k6 (2x)",
                endurance: "2k6+6",
                health: "k10+8",
                beauty: "k10+10",
                intelligence: "k10+8",
                willpower: "k10+8+kf",
                astral: "k6+12+kf",
                perception: "K10+8"
            )
        } else if secCaste == "Paplovag" {
            tuple = (
                strength: "k10+8+kf",
                speed: "3k6 (2x)",
                agility: "3k6 (2x)",
                endurance: "k10+8",
                health: "k10+10",
                beauty: "k10+8",
                intelligence: "2k6+6",
                willpower: "k10+8",
                astral: "k6+12",
                perception: "K10+8"
            )
        } else if secCaste == "Szerzetes" {
            tuple = (
                strength: "2k6+6",
                speed: "2k6+6",
                agility: "2k6+6",
                endurance: "k6+12",
                health: "3k6 (2x)",
                beauty: "3k6 (2x)",
                intelligence: "2k6+6+kf",
                willpower: "k6+12+kf",
                astral: "k6+12+kf",
                perception: "K10+8"
            )
        } else if secCaste == "Sámán" {
            tuple = (
                strength: "3k6 (2x)",
                speed: "3k6 (2x)",
                agility: "3k6 (2x)",
                endurance: "2k6+6 (2x)",
                health: "k10+6",
                beauty: "3k6",
                intelligence: "2k6+6",
                willpower: "k6+12+kf",
                astral: "k10+8+kf",
                perception: "2K6+6"
            )
        } else if secCaste == "Harcművész" {
            tuple = (
                strength: "k10+8",
                speed: "k6+14",
                agility: "k6+12",
                endurance: "k6+12",
                health: "k10+10",
                beauty: "3k6 (2x)",
                intelligence: "3k6 (2x)",
                willpower: "k6+12",
                astral: "k10+8",
                perception: "k6+12"
            )
        } else if secCaste == "Kardművész" {
            tuple = (
                strength: "k10+8",
                speed: "k6+12+kf",
                agility: "k6+14",
                endurance: "k10+8",
                health: "k10+8",
                beauty: "3k6 (2x)",
                intelligence: "2k6+6",
                willpower: "k6+12",
                astral: "k10+8",
                perception: "k6+12"
            )
        } else if secCaste == "Boszorkány" {
            tuple = (
                strength: "3k6",
                speed: "2k6+6",
                agility: "k10+8",
                endurance: "3k6",
                health: "2k6+6",
                beauty: "k6+14",
                intelligence: "2k6+6",
                willpower: "2k6+6",
                astral: "k6+12+kf",
                perception: "2k6+6"
            )
        } else if secCaste == "Boszorkánymester" {
            tuple = (
                strength: "3k6 (2x)",
                speed: "k10+8",
                agility: "k6+12+kf",
                endurance: "3k6 (2x)",
                health: "2k6+6",
                beauty: "3k6",
                intelligence: "2k6+6",
                willpower: "2k6+6",
                astral: "k6+12",
                perception: "2k6+6"
            )
        } else if secCaste == "Tűzvarázsló" {
            tuple = (
                strength: "2k6+6",
                speed: "3k6 (2x)",
                agility: "3k6 (2x)",
                endurance: "2k6+6",
                health: "2k6+6",
                beauty: "3k6",
                intelligence: "2k6+6",
                willpower: "2k6+6",
                astral: "2k6+6",
                perception: "2k6+6"
            )
        } else if secCaste == "Varázsló" {
            tuple = (
                strength: "3k6",
                speed: "3k6 (2x)",
                agility: "3k6 (2x)",
                endurance: "3k6",
                health: "3k6 (2x)",
                beauty: "3k6",
                intelligence: "k6+12+kf",
                willpower: "k6+12+kf",
                astral: "k6+12+kf",
                perception: "2k6+6"
            )
        }
        return tuple
    }
}

class propCalculator {

    static func propCalc(_ secCaste: String) -> (strength: Int, speed: Int, agility: Int, endurance: Int, health: Int, beauty: Int, intelligence: Int, willpower: Int, astral: Int, perception: Int) {

        let k6a = Int.random(in: 1...6)
        let k6b = Int.random(in: 1...6)
        let k6c = Int.random(in: 1...6)
        let k10 = Int.random(in: 1...10)
        
        var tuple: (strength: Int, speed: Int, agility: Int, endurance: Int, health: Int, beauty: Int, intelligence: Int, willpower: Int, astral: Int, perception: Int) = (0,0,0,0,0,0,0,0,0,0)

        if secCaste == "Harcos" {
            tuple = (
                strength: k6a + 12,
                speed: k6a + k6b + 6,
                agility: k6a + k6b + 6,
                endurance: k10 + 8,
                health: k10 + 10,
                beauty: k6a + k6b + k6c,
                intelligence: k6a + k6b + k6c,
                willpower: k6a + k6b + 6,
                astral: k6a + k6b + k6c,
                perception: k6a + k6b + 6
            )
        } else if secCaste == "Gladiátor" {
            tuple = (
                strength: k6a + 12,
                speed: k6a + k6b + 6,
                agility: k6a + k6b + 6,
                endurance: k6a + 12,
                health: k10 + 10,
                beauty: k6a + k6b + 6,
                intelligence: k6a + k6b + k6c,
                willpower: k6a + k6b + k6c,
                astral: k6a + k6b + k6c,
                perception: k6a + k6b + 6
            )
        } else if secCaste == "Fejvadász" {
            tuple = (
                strength: k6a + k6b + 6,
                speed: k6a + 12,
                agility: k10 + 8,
                endurance: k6a + 12,
                health: k10 + 10,
                beauty: k6a + k6b + k6c,
                intelligence: k6a + k6b + k6c,
                willpower: k10 + 8,
                astral: k6a + k6b + 6,
                perception: k6a + 12
            )
        } else if secCaste == "Lovag" {
            tuple = (
                strength: k6a + 12,
                speed: k6a + k6b + k6c,
                agility: k6a + k6b + k6c,
                endurance: k10 + 8,
                health: k10 + 10,
                beauty: k6a + k6b + 6,
                intelligence: k6a + k6b + 6,
                willpower: k10 + 8,
                astral: k6a + k6b + k6c,
                perception: k6a + k6b + 6
            )
        } else if secCaste == "Amazon" {
            tuple = (
                strength: k6a + k6b + 6,
                speed: k10 + 8,
                agility: k10 + 8,
                endurance: k6a + k6b + 6,
                health: k6a + k6b + 6,
                beauty: k10 + 8,
                intelligence: k6a + k6b + k6c,
                willpower: k6a + k6b + 6,
                astral: k6a + k6b + k6c,
                perception: k10 + 8
            )
        } else if secCaste == "Barbár" {
            tuple = (
                strength: k6a + 14,
                speed: k10 + 8,
                agility: k6a + k6b + 6,
                endurance: k6a + 14,
                health: k10 + 10,
                beauty: k6a + k6b + k6c,
                intelligence: k6a + k6b + k6c,
                willpower: k6a + k6b + 6,
                astral: k6a + k6b + k6c - 1,
                perception: k10 + 8
            )
        } else if secCaste == "Bajvívó" {
            tuple = (
                strength: k6a + k6b + 6,
                speed: k10 + 8,
                agility: k10 + 8,
                endurance: k6a + k6b + k6c,
                health: k6a + k6b + k6c,
                beauty: k6a + k6b + k6c,
                intelligence: k6a + k6b + k6c,
                willpower: k6a + k6b + k6c,
                astral: k6a + 12,
                perception: k10 + 8
            )
        } else if secCaste == "Tolvaj" {
            tuple = (
                strength: k6a + k6b + k6c,
                speed: k10 + 8,
                agility: k6a + 12,
                endurance: k6a + k6b + k6c,
                health: k6a + k6b + k6c,
                beauty: k6a + k6b + 6,
                intelligence: k6a + k6b + 6,
                willpower: k6a + k6b + k6c,
                astral: k6a + k6b + k6c,
                perception: k6a + 12
            )
        } else if secCaste == "Bárd" {
            tuple = (
                strength: k10 + 8,
                speed: k10 + 8,
                agility: k10 + 8,
                endurance: k6a + k6b + 6,
                health: k6a + k6b + 6,
                beauty: k6a + 12,
                intelligence: k10 + 8,
                willpower: k6a + k6b + 6,
                astral: k10 + 8,
                perception: k10 + 8
            )
        } else if secCaste == "Pap" {
            tuple = (
                strength: k6a + k6b + 6,
                speed: k6a + k6b + k6c,
                agility: k6a + k6b + k6c,
                endurance: k6a + k6b + 6,
                health: k10 + 8,
                beauty: k10 + 10,
                intelligence: k10 + 8,
                willpower: k10 + 8,
                astral: k6a + 12,
                perception: k10 + 8
            )
        } else if secCaste == "Paplovag" {
            tuple = (
                strength: k10 + 8,
                speed: k6a + k6b + k6c,
                agility: k6a + k6b + k6c,
                endurance: k10 + 8,
                health: k10 + 10,
                beauty: k10 + 8,
                intelligence: k6a + k6b + 6,
                willpower: k10 + 8,
                astral: k6a + 12,
                perception: k10 + 8
            )
        } else if secCaste == "Szerzetes" {
            tuple = (
                strength: k6a + k6b + 6,
                speed: k6a + k6b + 6,
                agility: k6a + k6b + 6,
                endurance: k6a + 12,
                health: k6a + k6b + k6c,
                beauty: k6a + k6b + k6c,
                intelligence: k6a + k6b + 6,
                willpower: k6a + 12,
                astral: k6a + 12,
                perception: k10 + 8
            )
        } else if secCaste == "Sámán" {
            tuple = (
                strength: k6a + k6b + k6c,
                speed: k6a + k6b + k6c,
                agility: k6a + k6b + k6c,
                endurance: k6a + k6b + 6,
                health: k10 + 6,
                beauty: k6a + k6b + k6c,
                intelligence: k6a + k6b + 6,
                willpower: k6a + 12,
                astral: k10 + 8,
                perception: k6a + k6b + 6
            )
        } else if secCaste == "Harcművész" {
            tuple = (
                strength: k10 + 8,
                speed: k6a + 14,
                agility: k6a + 12,
                endurance: k6a + 12,
                health: k10 + 10,
                beauty: k6a + k6b + k6c,
                intelligence: k6a + k6b + k6c,
                willpower: k6a + 12,
                astral: k10 + 8,
                perception: k6a + 12
            )
        } else if secCaste == "Kardművész" {
            tuple = (
                strength: k10 + 8,
                speed: k6a + 12,
                agility: k6a + 14,
                endurance: k10 + 8,
                health: k10 + 8,
                beauty: k6a + k6b + k6c,
                intelligence: k6a + k6b + 6,
                willpower: k6a + 12,
                astral: k10 + 8,
                perception: k6a + 12
            )
        } else if secCaste == "Boszorkány" {
            tuple = (
                strength: k6a + k6b + k6c,
                speed: k6a + k6b + 6,
                agility: k10 + 8,
                endurance: k6a + k6b + k6c,
                health: k6a + k6b + 6,
                beauty: k6a + 14,
                intelligence: k6a + k6b + 6,
                willpower: k6a + k6b + 6,
                astral: k6a + 12,
                perception: k6a + k6b + 6
            )
        } else if secCaste == "Boszorkánymester" {
            tuple = (
                strength: k6a + k6b + k6c,
                speed: k10 + 8,
                agility: k6a + 12,
                endurance: k6a + k6b + k6c,
                health: k6a + k6b + 6,
                beauty: k6a + k6b + k6c,
                intelligence: k6a + k6b + 6,
                willpower: k6a + k6b + 6,
                astral: k6a + 12,
                perception: k6a + k6b + 6
            )
        } else if secCaste == "Tűzvarázsló" {
            tuple = (
                strength: k6a + k6b + 6,
                speed: k6a + k6b + k6c,
                agility: k6a + k6b + k6c,
                endurance: k6a + k6b + 6,
                health: k6a + k6b + 6,
                beauty: k6a + k6b + k6c,
                intelligence: k6a + k6b + 6,
                willpower: k6a + k6b + 6,
                astral: k6a + k6b + 6,
                perception: k6a + k6b + 6
            )
        } else if secCaste == "Varázsló" {
            tuple = (
                strength: k6a + k6b + k6c,
                speed: k6a + k6b + k6c,
                agility: k6a + k6b + k6c,
                endurance: k6a + k6b + k6c,
                health: k6a + k6b + k6c,
                beauty: k6a + k6b + k6c,
                intelligence: k6a + 12,
                willpower: k6a + 12,
                astral: k6a + 12,
                perception: k6a + k6b + 6
            )
        }
        return tuple
    }
}

class healthPointCalculator {

    static func healthPointCalc(_ secCaste: String) -> (healthPoint: Int, painPoint: Int, painPointPerLevel: Int) {

        let k6 = Int.random(in: 1...6)
        
        var tuple: (healthPoint: Int, painPoint: Int, painPointPerLevel: Int) = (0,0,0)

        if secCaste == "Harcos" {
            tuple = (
                healthPoint: 7,
                painPoint: 6,
                painPointPerLevel: k6 + 4
            )
        } else if secCaste == "Gladiátor" {
            tuple = (
                healthPoint: 8,
                painPoint: 7,
                painPointPerLevel: k6 + 5
            )
        } else if secCaste == "Fejvadász" {
            tuple = (
                healthPoint: 6,
                painPoint: 7,
                painPointPerLevel: k6 + 5
            )
        } else if secCaste == "Lovag" {
            tuple = (
                healthPoint: 7,
                painPoint: 6,
                painPointPerLevel: k6 + 5
            )
        } else if secCaste == "Amazon" {
            tuple = (
                healthPoint: 7,
                painPoint: 7,
                painPointPerLevel: k6 + 4
            )
        } else if secCaste == "Barbár" {
            tuple = (
                healthPoint: 8,
                painPoint: 7,
                painPointPerLevel: k6 + 5
            )
        } else if secCaste == "Bajvívó" {
            tuple = (
                healthPoint: 5,
                painPoint: 5,
                painPointPerLevel: k6 + 3
            )
        } else if secCaste == "Tolvaj" {
            tuple = (
                healthPoint: 4,
                painPoint: 5,
                painPointPerLevel: k6 + 3
            )
        } else if secCaste == "Bárd" {
            tuple = (
                healthPoint: 5,
                painPoint: 6,
                painPointPerLevel: k6 + 3
            )
        } else if secCaste == "Pap" {
            tuple = (
                healthPoint: 6,
                painPoint: 6,
                painPointPerLevel: k6 + 2
            )
        } else if secCaste == "Paplovag" {
            tuple = (
                healthPoint: 8,
                painPoint: 7,
                painPointPerLevel: k6 + 5
            )
        } else if secCaste == "Szerzetes" {
            tuple = (
                healthPoint: 4,
                painPoint: 8,
                painPointPerLevel: k6 + 5
            )
        } else if secCaste == "Sámán" {
            tuple = (
                healthPoint: 4,
                painPoint: 6,
                painPointPerLevel: k6 + 2
            )
        } else if secCaste == "Harcművész" {
            tuple = (
                healthPoint: 4,
                painPoint: 8,
                painPointPerLevel: k6 + 5
            )
        } else if secCaste == "Kardművész" {
            tuple = (
                healthPoint: 4,
                painPoint: 8,
                painPointPerLevel: k6 + 5
            )
        } else if secCaste == "Boszorkány" {
            tuple = (
                healthPoint: 3,
                painPoint: 1,
                painPointPerLevel: k6
            )
        } else if secCaste == "Boszorkánymester" {
            tuple = (
                healthPoint: 3,
                painPoint: 4,
                painPointPerLevel: k6 + 1
            )
        } else if secCaste == "Tűzvarázsló" {
            tuple = (
                healthPoint: 5,
                painPoint: 4,
                painPointPerLevel: k6 + 1
            )
        } else if secCaste == "Varázsló" {
            tuple = (
                healthPoint: 3,
                painPoint: 2,
                painPointPerLevel: k6
            )
        }
        return tuple
    }
    
    static func healthPointShow(_ secCaste: String) -> String {
        
        var painPointPerLevel: String = ""

        if secCaste == "Harcos" {
            painPointPerLevel = "k6 + 4"
        } else if secCaste == "Gladiátor" {
            painPointPerLevel = "k6 + 5"
        } else if secCaste == "Fejvadász" {
            painPointPerLevel = "k6 + 5"
        } else if secCaste == "Lovag" {
            painPointPerLevel = "k6 + 5"
        } else if secCaste == "Amazon" {
            painPointPerLevel = "k6 + 4"
        } else if secCaste == "Barbár" {
            painPointPerLevel = "k6 + 5"
        } else if secCaste == "Bajvívó" {
            painPointPerLevel = "k6 + 3"
        } else if secCaste == "Tolvaj" {
            painPointPerLevel = "k6 + 3"
        } else if secCaste == "Bárd" {
            painPointPerLevel = "k6 + 3"
        } else if secCaste == "Pap" {
            painPointPerLevel = "k6 + 2"
        } else if secCaste == "Paplovag" {
            painPointPerLevel = "k6 + 5"
        } else if secCaste == "Szerzetes" {
            painPointPerLevel = "k6 + 5"
        } else if secCaste == "Sámán" {
            painPointPerLevel = "k6 + 2"
        } else if secCaste == "Harcművész" {
            painPointPerLevel = "k6 + 5"
        } else if secCaste == "Kardművész" {
            painPointPerLevel = "k6 + 5"
        } else if secCaste == "Boszorkány" {
            painPointPerLevel = "k6"
        } else if secCaste == "Boszorkánymester" {
            painPointPerLevel = "k6 + 1"
        } else if secCaste == "Tűzvarázsló" {
            painPointPerLevel = "k6 + 1"
        } else if secCaste == "Varázsló" {
            painPointPerLevel = "k6"
        }
        return painPointPerLevel
    }
}

class fightPointCalculator {

    static func fightPointCalc(_ secCaste: String) -> (ke: Int, te: Int, ve: Int, ce: Int, hm: Int) {
        
        var tuple: (ke: Int, te: Int, ve: Int, ce: Int, hm: Int) = (0,0,0,0,0)

        if secCaste == "Harcos" {
            tuple = (
                ke: 9,
                te: 20,
                ve: 75,
                ce: 0,
                hm: 11
            )
        } else if secCaste == "Gladiátor" {
            tuple = (
                ke: 9,
                te: 20,
                ve: 75,
                ce: 0,
                hm: 12
            )
        } else if secCaste == "Fejvadász" {
            tuple = (
                ke: 10,
                te: 20,
                ve: 75,
                ce: 0,
                hm: 11
            )
        } else if secCaste == "Lovag" {
            tuple = (
                ke: 5,
                te: 20,
                ve: 75,
                ce: 0,
                hm: 12
            )
        } else if secCaste == "Amazon" {
            tuple = (
                ke: 8,
                te: 22,
                ve: 73,
                ce: 10,
                hm: 10
            )
        } else if secCaste == "Barbár" {
            tuple = (
                ke: 10,
                te: 26,
                ve: 70,
                ce: 0,
                hm: 12
            )
        } else if secCaste == "Bajvívó" {
            tuple = (
                ke: 9,
                te: 20,
                ve: 75,
                ce: 0,
                hm: 12
            )
        } else if secCaste == "Tolvaj" {
            tuple = (
                ke: 8,
                te: 17,
                ve: 72,
                ce: 10,
                hm: 6
            )
        } else if secCaste == "Bárd" {
            tuple = (
                ke: 10,
                te: 20,
                ve: 75,
                ce: 15,
                hm: 9
            )
        } else if secCaste == "Pap" {
            tuple = (
                ke: 5,
                te: 17,
                ve: 72,
                ce: 0,
                hm: 8
            )
        } else if secCaste == "Paplovag" {
            tuple = (
                ke: 5,
                te: 20,
                ve: 75,
                ce: 0,
                hm: 9
            )
        } else if secCaste == "Szerzetes" {
            tuple = (
                ke: 5,
                te: 15,
                ve: 75,
                ce: 0,
                hm: 8
            )
        } else if secCaste == "Sámán" {
            tuple = (
                ke: 4,
                te: 15,
                ve: 70,
                ce: 0,
                hm: 5
            )
        } else if secCaste == "Harcművész" {
            tuple = (
                ke: 10,
                te: 20,
                ve: 75,
                ce: 0,
                hm: 8
            )
        } else if secCaste == "Kardművész" {
            tuple = (
                ke: 10,
                te: 20,
                ve: 75,
                ce: 0,
                hm: 8
            )
        } else if secCaste == "Boszorkány" {
            tuple = (
                ke: 6,
                te: 14,
                ve: 69,
                ce: 0,
                hm: 4
            )
        } else if secCaste == "Boszorkánymester" {
            tuple = (
                ke: 7,
                te: 17,
                ve: 72,
                ce: 5,
                hm: 7
            )
        } else if secCaste == "Tűzvarázsló" {
            tuple = (
                ke: 6,
                te: 17,
                ve: 72,
                ce: 0,
                hm: 8
            )
        } else if secCaste == "Varázsló" {
            tuple = (
                ke: 2,
                te: 15,
                ve: 70,
                ce: 0,
                hm: 4
            )
        }
        return tuple
    }
    
    static func hmPointCalc(_ secCaste: String, _ lvl: Int) -> (ke: Int, te: Int, ve: Int, ce: Int, keBonus: Int) {
        
        var tuple: (ke: Int, te: Int, ve: Int, ce: Int, keBonus: Int) = (0,0,0,0,0)

        if secCaste == "Harcos" {
            tuple = (
                ke: 0,
                te: 3,
                ve: 3,
                ce: 0,
                keBonus: 0
            )
        } else if secCaste == "Gladiátor" {
            tuple = (
                ke: 0,
                te: 4,
                ve: 4,
                ce: 0,
                keBonus: 0
            )
        } else if secCaste == "Fejvadász" {
            tuple = (
                ke: 0,
                te: 4,
                ve: 4,
                ce: 0,
                // every 2nd level gets 1 Bonus KE
                keBonus: lvl / 2
            )
            
        } else if secCaste == "Lovag" {
            tuple = (
                ke: 0,
                te: 5,
                ve: 5,
                ce: 0,
                keBonus: 0
            )
        } else if secCaste == "Amazon" {
            tuple = (
                ke: 0,
                te: 0,
                ve: 0,
                ce: 0,
                keBonus: 0
            )
        } else if secCaste == "Barbár" {
            tuple = (
                ke: 3,
                te: 5,
                ve: 0,
                ce: 0,
                keBonus: 0
            )
        } else if secCaste == "Bajvívó" {
            tuple = (
                ke: 0,
                te: 3,
                ve: 3,
                ce: 0,
                keBonus: 0
            )
        } else if secCaste == "Tolvaj" {
            tuple = (
                ke: 0,
                te: 1,
                ve: 1,
                ce: 0,
                keBonus: 1
            )
        } else if secCaste == "Bárd" {
            tuple = (
                ke: 0,
                te: 2,
                ve: 2,
                ce: 0,
                keBonus: 0
            )
        } else if secCaste == "Pap" {
            tuple = (
                ke: 0,
                te: 3,
                ve: 3,
                ce: 0,
                keBonus: 0
            )
        } else if secCaste == "Paplovag" {
            tuple = (
                ke: 0,
                te: 3,
                ve: 3,
                ce: 0,
                keBonus: 0
            )
        } else if secCaste == "Szerzetes" {
            tuple = (
                ke: 0,
                te: 2,
                ve: 4,
                ce: 0,
                keBonus: 0
            )
        } else if secCaste == "Sámán" {
            tuple = (
                ke: 0,
                te: 1,
                ve: 1,
                ce: 0,
                keBonus: 0
            )
        } else if secCaste == "Harcművész" {
            tuple = (
                ke: 0,
                te: 3,
                ve: 3,
                ce: 0,
                keBonus: 0
            )
        } else if secCaste == "Kardművész" {
            tuple = (
                ke: 0,
                te: 3,
                ve: 3,
                ce: 0,
                keBonus: 0
            )
        } else if secCaste == "Boszorkány" {
            tuple = (
                ke: 0,
                te: 1,
                ve: 1,
                ce: 0,
                keBonus: 0
            )
        } else if secCaste == "Boszorkánymester" {
            tuple = (
                ke: 0,
                te: 1,
                ve: 1,
                ce: 0,
                keBonus: 1
            )
        } else if secCaste == "Tűzvarázsló" {
            tuple = (
                ke: 0,
                te: 3,
                ve: 3,
                ce: 0,
                keBonus: 0
            )
        } else if secCaste == "Varázsló" {
            tuple = (
                ke: 0,
                te: 1,
                ve: 1,
                ce: 0,
                keBonus: 0
            )
        }
        return tuple
    }
    
    static func hmPointMandatoryShow(_ secCaste: String) -> String {
        
        var string = ""

        if secCaste == "Harcos" {
            string = "szintenként (már első szinten is) köteles 3 pontot a TÉ-re és 3 pontot a VÉ-re fordítani."
        } else if secCaste == "Gladiátor" {
            string = "szintenként (már első szinten is) köteles 4 pontot a TÉ-re és 4 pontot a VÉ-re fordítani."
        } else if secCaste == "Fejvadász" {
            string = "szintenként (már első szinten is) köteles 4 pontot a TÉ-re és 4 pontot a VÉ-re fordítani. KÉ-je minden második szinten automatikusan 1-el nő."
        } else if secCaste == "Lovag" {
            string = "szintenként (már első szinten is) köteles 5 pontot a TÉ-re és 5 pontot a VÉ-re fordítani."
        } else if secCaste == "Amazon" {
            string = "megkötések nélkül oszthatja szét HM pontjait."
        } else if secCaste == "Barbár" {
            string = "szintenként (már első szinten is) köteles 5 pontot a TÉ-re és 3 pontot a KÉ-re fordítani."
        } else if secCaste == "Bajvívó" {
            string = "szintenként (már első szinten is) köteles 3 pontot a TÉ-re és 3 pontot a VÉ-re fordítani."
        } else if secCaste == "Tolvaj" {
            string = "szintenként (már első szinten is) köteles 1 pontot a TÉ-re és 1 pontot a VÉ-re fordítani. KÉ-je minden szinten automatikusan 1-el nő."
        } else if secCaste == "Bárd" {
            string = "szintenként (már első szinten is) köteles 2 pontot a TÉ-re és 2 pontot a VÉ-re fordítani."
        } else if secCaste == "Pap" {
            string = "szintenként (már első szinten is) köteles 3 pontot a TÉ-re és 3 pontot a VÉ-re fordítani."
        } else if secCaste == "Paplovag" {
            string = "szintenként (már első szinten is) köteles 3 pontot a TÉ-re és 3 pontot a VÉ-re fordítani."
        } else if secCaste == "Szerzetes" {
            string = "szintenként (már első szinten is) köteles 2 pontot a TÉ-re és 4 pontot a VÉ-re fordítani."
        } else if secCaste == "Sámán" {
            string = "szintenként (már első szinten is) köteles 1 pontot a TÉ-re és 1 pontot a VÉ-re fordítani."
        } else if secCaste == "Harcművész" {
            string = "szintenként (már első szinten is) köteles 3 pontot a TÉ-re és 3 pontot a VÉ-re fordítani."
        } else if secCaste == "Kardművész" {
            string = "szintenként (már első szinten is) köteles 3 pontot a TÉ-re és 3 pontot a VÉ-re fordítani."
        } else if secCaste == "Boszorkány" {
            string = "szintenként (már első szinten is) köteles 1 pontot a TÉ-re és 1 pontot a VÉ-re fordítani."
        } else if secCaste == "Boszorkánymester" {
            string = "szintenként (már első szinten is) köteles 1 pontot a TÉ-re és 1 pontot a VÉ-re fordítani. KÉ-je minden szinten automatikusan 1-el nő."
        } else if secCaste == "Tűzvarázsló" {
            string = "szintenként (már első szinten is) köteles 3 pontot a TÉ-re és 3 pontot a VÉ-re fordítani."
        } else if secCaste == "Varázsló" {
            string = "szintenként (már első szinten is) köteles 1 pontot a TÉ-re és 1 pontot a VÉ-re fordítani."
        }
        return string
    }
    
    static func hmPointBonusShow(_ secCaste: String) -> String {
        
        var string = ""

        if secCaste == "Harcos" {
            string = ""
        } else if secCaste == "Gladiátor" {
            string = ""
        } else if secCaste == "Fejvadász" {
            string = "+1/2Sz"
        } else if secCaste == "Lovag" {
            string = ""
        } else if secCaste == "Amazon" {
            string = ""
        } else if secCaste == "Barbár" {
            string = ""
        } else if secCaste == "Bajvívó" {
            string = ""
        } else if secCaste == "Tolvaj" {
            string = "+1/Sz"
        } else if secCaste == "Bárd" {
            string = ""
        } else if secCaste == "Pap" {
            string = ""
        } else if secCaste == "Paplovag" {
            string = ""
        } else if secCaste == "Szerzetes" {
            string = ""
        } else if secCaste == "Sámán" {
            string = ""
        } else if secCaste == "Harcművész" {
            string = ""
        } else if secCaste == "Kardművész" {
            string = ""
        } else if secCaste == "Boszorkány" {
            string = ""
        } else if secCaste == "Boszorkánymester" {
            string = "+1/Sz"
        } else if secCaste == "Tűzvarázsló" {
            string = ""
        } else if secCaste == "Varázsló" {
            string = ""
        }
        return string
    }
}

class kfIsOnCalculator {

    static func kfIsOn(_ secCaste: String) -> (strength: Bool, speed: Bool, agility: Bool, endurance: Bool, health: Bool, beauty: Bool, intelligence: Bool, willpower: Bool, astral: Bool, perception: Bool) {

        var tuple: (strength: Bool, speed: Bool, agility: Bool, endurance: Bool, health: Bool, beauty: Bool, intelligence: Bool, willpower: Bool, astral: Bool, perception: Bool) = (false,false,false,false,false,false,false,false,false,false)
        
        if secCaste == "Harcos" {
            tuple = (
                strength: true,
                speed: true,
                agility: true,
                endurance: true,
                health: false,
                beauty: false,
                intelligence: false,
                willpower: false,
                astral: false,
                perception: false
            )
        } else if secCaste == "Gladiátor" {
            tuple = (
                strength: true,
                speed: true,
                agility: true,
                endurance: true,
                health: false,
                beauty: false,
                intelligence: false,
                willpower: false,
                astral: false,
                perception: false
            )
        } else if secCaste == "Fejvadász" {
            tuple = (
                strength: false,
                speed: true,
                agility: false,
                endurance: true,
                health: false,
                beauty: false,
                intelligence: false,
                willpower: false,
                astral: false,
                perception: false
            )
        } else if secCaste == "Lovag" {
            tuple = (
                strength: true,
                speed: false,
                agility: false,
                endurance: true,
                health: false,
                beauty: true,
                intelligence: false,
                willpower: false,
                astral: false,
                perception: false
            )
        } else if secCaste == "Amazon" {
            tuple = (
                strength: false,
                speed: false,
                agility: false,
                endurance: false,
                health: false,
                beauty: false,
                intelligence: false,
                willpower: false,
                astral: false,
                perception: false
            )
        } else if secCaste == "Barbár" {
            tuple = (
                strength: false,
                speed: false,
                agility: false,
                endurance: false,
                health: false,
                beauty: false,
                intelligence: false,
                willpower: false,
                astral: false,
                perception: false
            )
        } else if secCaste == "Bajvívó" {
            tuple = (
                strength: false,
                speed: true,
                agility: true,
                endurance: false,
                health: false,
                beauty: false,
                intelligence: false,
                willpower: false,
                astral: false,
                perception: false
            )
        } else if secCaste == "Tolvaj" {
            tuple = (
                strength: false,
                speed: true,
                agility: true,
                endurance: false,
                health: false,
                beauty: false,
                intelligence: false,
                willpower: false,
                astral: false,
                perception: false
            )
        } else if secCaste == "Bárd" {
            tuple = (
                strength: false,
                speed: true,
                agility: false,
                endurance: false,
                health: false,
                beauty: true,
                intelligence: false,
                willpower: false,
                astral: false,
                perception: false
            )
        } else if secCaste == "Pap" {
            tuple = (
                strength: false,
                speed: false,
                agility: false,
                endurance: false,
                health: false,
                beauty: false,
                intelligence: false,
                willpower: true,
                astral: true,
                perception: false
            )
        } else if secCaste == "Paplovag" {
            tuple = (
                strength: true,
                speed: false,
                agility: false,
                endurance: false,
                health: false,
                beauty: false,
                intelligence: false,
                willpower: false,
                astral: false,
                perception: false
            )
        } else if secCaste == "Szerzetes" {
            tuple = (
                strength: false,
                speed: false,
                agility: false,
                endurance: false,
                health: false,
                beauty: false,
                intelligence: true,
                willpower: true,
                astral: true,
                perception: false
            )
        } else if secCaste == "Sámán" {
            tuple = (
                strength: false,
                speed: false,
                agility: false,
                endurance: false,
                health: false,
                beauty: false,
                intelligence: false,
                willpower: true,
                astral: true,
                perception: false
            )
        } else if secCaste == "Harcművész" {
            tuple = (
                strength: false,
                speed: false,
                agility: false,
                endurance: false,
                health: false,
                beauty: false,
                intelligence: false,
                willpower: false,
                astral: false,
                perception: false
            )
        } else if secCaste == "Kardművész" {
            tuple = (
                strength: false,
                speed: true,
                agility: false,
                endurance: false,
                health: false,
                beauty: false,
                intelligence: false,
                willpower: false,
                astral: false,
                perception: false
            )
        } else if secCaste == "Boszorkány" {
            tuple = (
                strength: false,
                speed: false,
                agility: false,
                endurance: false,
                health: false,
                beauty: false,
                intelligence: false,
                willpower: false,
                astral: true,
                perception: false
            )
        } else if secCaste == "Boszorkánymester" {
            tuple = (
                strength: false,
                speed: false,
                agility: true,
                endurance: false,
                health: false,
                beauty: false,
                intelligence: false,
                willpower: false,
                astral: false,
                perception: false
            )
        } else if secCaste == "Tűzvarázsló" {
            tuple = (
                strength: false,
                speed: false,
                agility: false,
                endurance: false,
                health: false,
                beauty: false,
                intelligence: false,
                willpower: false,
                astral: false,
                perception: false
            )
        } else if secCaste == "Varázsló" {
            tuple = (
                strength: false,
                speed: false,
                agility: false,
                endurance: false,
                health: false,
                beauty: false,
                intelligence: true,
                willpower: true,
                astral: true,
                perception: false
            )
        }
        return tuple
    }
}

// kulonleges felkeszites calculator
class kfCalculator {
    
    static func kfCalc() -> Int {
        let roll = Int.random(in: 1...100)
        var rolled: Int
        
        switch roll {
        case 1:
            rolled = 0
        case 2...20:
            rolled = -Int.random(in: 1...6)
        case 21...50:
            rolled = -1
        case 51...75:
            rolled = 0
        case 76...95:
            rolled = 1
        case 96...100:
            rolled = 2
        default:
            rolled = 0
        }
        
        return rolled
    } 
}
