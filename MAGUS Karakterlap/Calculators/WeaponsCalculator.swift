//
//  WeaponsCalculator.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 06/11/2022.
//

import Foundation
import SwiftUI

class WeaponsCalculator {
    
    //calculate weapon damage
    static func damageCalc(equippedWeapon: String) -> Int {
        
        let k6a = Int.random(in: 1...6)
//        let k6b = Int.random(in: 1...6)
//        let k6c = Int.random(in: 1...6)
        let k10 = Int.random(in: 1...10)
        let k3 = Int.random(in: 1...3)
        
        var damage = 0
        
        switch equippedWeapon {
        case "Puszta kéz":
            damage = k3
        case "Rövid kard":
            damage = k6a + 1
        case "Hosszú kard":
            damage = k10
            
        default:
            damage = 0
        }
        return damage
    }
    
    //// try
    static func damShowCalc(string: String) -> Int {
        
        let k3a = Int.random(in: 1...3)
        let k3b = Int.random(in: 1...3)
        let k3c = Int.random(in: 1...3)
        let k3d = Int.random(in: 1...3)
        let k3e = Int.random(in: 1...3)
        let k3f = Int.random(in: 1...3)
        let k6a = Int.random(in: 1...6)
        let k6b = Int.random(in: 1...6)
        let k6c = Int.random(in: 1...6)
        let k6d = Int.random(in: 1...6)
        let k6e = Int.random(in: 1...6)
        let k6f = Int.random(in: 1...6)
        let k10a = Int.random(in: 1...10)
        let k10b = Int.random(in: 1...10)
        let k10c = Int.random(in: 1...10)
        let k10d = Int.random(in: 1...10)
        let k10e = Int.random(in: 1...10)
        let k10f = Int.random(in: 1...10)
        
        var number = 0
        
        switch string {
        case "k3":
            number = k3a
        case "k3+1":
            number = k3a + 1
        case "k3+2":
            number = k3a + 2
        case "k3+3":
            number = k3a + 3
        case "k3+4":
            number = k3a + 4
        case "k3+5":
            number = k3a + 5
        case "k3+6":
            number = k3a + 6
        case "k3+7":
            number = k3a + 7
        case "k3+8":
            number = k3a + 8
        case "k3+9":
            number = k3a + 9
        case "k3+10":
            number = k3a + 10
        
        case "2k3":
            number = k3a + k3b
        case "2k3+1":
            number = k3a + k3b + 1
        case "2k3+2":
            number = k3a + k3b + 2
        case "2k3+3":
            number = k3a + k3b + 3
        case "2k3+4":
            number = k3a + k3b + 4
        case "2k3+5":
            number = k3a + k3b + 5
        case "2k3+6":
            number = k3a + k3b + 6
        case "2k3+7":
            number = k3a + k3b + 7
        case "2k3+8":
            number = k3a + k3b + 8
        case "2k3+9":
            number = k3a + k3b + 9
        case "2k3+10":
            number = k3a + k3b + 10
        
        case "3k3":
            number = k3a + k3b + k3c
        case "3k3+1":
            number = k3a + k3b + k3c + 1
        case "3k3+2":
            number = k3a + k3b + k3c + 2
        case "3k3+3":
            number = k3a + k3b + k3c + 3
        case "3k3+4":
            number = k3a + k3b + k3c + 4
        case "3k3+5":
            number = k3a + k3b + k3c + 5
        case "3k3+6":
            number = k3a + k3b + k3c + 6
        case "3k3+7":
            number = k3a + k3b + k3c + 7
        case "3k3+8":
            number = k3a + k3b + k3c + 8
        case "3k3+9":
            number = k3a + k3b + k3c + 9
        case "3k3+10":
            number = k3a + k3b + k3c + 10
            
        case "4k3":
            number = k3a + k3b + k3c + k3d
        case "4k3+1":
            number = k3a + k3b + k3c + k3d + 1
        case "4k3+2":
            number = k3a + k3b + k3c + k3d + 2
        case "4k3+3":
            number = k3a + k3b + k3c + k3d + 3
        case "4k3+4":
            number = k3a + k3b + k3c + k3d + 4
        case "4k3+5":
            number = k3a + k3b + k3c + k3d + 5
        case "4k3+6":
            number = k3a + k3b + k3c + k3d + 6
        case "4k3+7":
            number = k3a + k3b + k3c + k3d + 7
        case "4k3+8":
            number = k3a + k3b + k3c + k3d + 8
        case "4k3+9":
            number = k3a + k3b + k3c + k3d + 9
        case "4k3+10":
            number = k3a + k3b + k3c + k3d + 10
            
        case "5k3":
            number = k3a + k3b + k3c + k3d + k3e
        case "5k3+1":
            number = k3a + k3b + k3c + k3d + k3e + 1
        case "5k3+2":
            number = k3a + k3b + k3c + k3d + k3e + 2
        case "5k3+3":
            number = k3a + k3b + k3c + k3d + k3e + 3
        case "5k3+4":
            number = k3a + k3b + k3c + k3d + k3e + 4
        case "5k3+5":
            number = k3a + k3b + k3c + k3d + k3e + 5
        case "5k3+6":
            number = k3a + k3b + k3c + k3d + k3e + 6
        case "5k3+7":
            number = k3a + k3b + k3c + k3d + k3e + 7
        case "5k3+8":
            number = k3a + k3b + k3c + k3d + k3e + 8
        case "5k3+9":
            number = k3a + k3b + k3c + k3d + k3e + 9
        case "5k3+10":
            number = k3a + k3b + k3c + k3d + k3e + 10
            
        case "6k3":
            number = k3a + k3b + k3c + k3d + k3e + k3f
        case "6k3+1":
            number = k3a + k3b + k3c + k3d + k3e + k3f + 1
        case "6k3+2":
            number = k3a + k3b + k3c + k3d + k3e + k3f + 2
        case "6k3+3":
            number = k3a + k3b + k3c + k3d + k3e + k3f + 3
        case "6k3+4":
            number = k3a + k3b + k3c + k3d + k3e + k3f + 4
        case "6k3+5":
            number = k3a + k3b + k3c + k3d + k3e + k3f + 5
        case "6k3+6":
            number = k3a + k3b + k3c + k3d + k3e + k3f + 6
        case "6k3+7":
            number = k3a + k3b + k3c + k3d + k3e + k3f + 7
        case "6k3+8":
            number = k3a + k3b + k3c + k3d + k3e + k3f + 8
        case "6k3+9":
            number = k3a + k3b + k3c + k3d + k3e + k3f + 9
        case "6k3+10":
            number = k3a + k3b + k3c + k3d + k3e + k3f + 10
            
        case "k6":
            number = k6a
        case "k6+1":
            number = k6a + 1
        case "k6+2":
            number = k6a + 2
        case "k6+3":
            number = k6a + 3
        case "k6+4":
            number = k6a + 4
        case "k6+5":
            number = k6a + 5
        case "k6+6":
            number = k6a + 6
        case "k6+7":
            number = k6a + 7
        case "k6+8":
            number = k6a + 8
        case "k6+9":
            number = k6a + 9
        case "k6+10":
            number = k6a + 10
        
        case "2k6":
            number = k6a + k6b
        case "2k6+1":
            number = k6a + k6b + 1
        case "2k6+2":
            number = k6a + k6b + 2
        case "2k6+3":
            number = k6a + k6b + 3
        case "2k6+4":
            number = k6a + k6b + 4
        case "2k6+5":
            number = k6a + k6b + 5
        case "2k6+6":
            number = k6a + k6b + 6
        case "2k6+7":
            number = k6a + k6b + 7
        case "2k6+8":
            number = k6a + k6b + 8
        case "2k6+9":
            number = k6a + k6b + 9
        case "2k6+10":
            number = k6a + k6b + 10
        
        case "3k6":
            number = k6a + k6b + k6c
        case "3k6+1":
            number = k6a + k6b + k6c + 1
        case "3k6+2":
            number = k6a + k6b + k6c + 2
        case "3k6+3":
            number = k6a + k6b + k6c + 3
        case "3k6+4":
            number = k6a + k6b + k6c + 4
        case "3k6+5":
            number = k6a + k6b + k6c + 5
        case "3k6+6":
            number = k6a + k6b + k6c + 6
        case "3k6+7":
            number = k6a + k6b + k6c + 7
        case "3k6+8":
            number = k6a + k6b + k6c + 8
        case "3k6+9":
            number = k6a + k6b + k6c + 9
        case "3k6+10":
            number = k6a + k6b + k6c + 10
            
        case "4k6":
            number = k6a + k6b + k6c + k6d
        case "4k6+1":
            number = k6a + k6b + k6c + k6d + 1
        case "4k6+2":
            number = k6a + k6b + k6c + k6d + 2
        case "4k6+3":
            number = k6a + k6b + k6c + k6d + 3
        case "4k6+4":
            number = k6a + k6b + k6c + k6d + 4
        case "4k6+5":
            number = k6a + k6b + k6c + k6d + 5
        case "4k6+6":
            number = k6a + k6b + k6c + k6d + 6
        case "4k6+7":
            number = k6a + k6b + k6c + k6d + 7
        case "4k6+8":
            number = k6a + k6b + k6c + k6d + 8
        case "4k6+9":
            number = k6a + k6b + k6c + k6d + 9
        case "4k6+10":
            number = k6a + k6b + k6c + k6d + 10
            
        case "5k6":
            number = k6a + k6b + k6c + k6d + k6e
        case "5k6+1":
            number = k6a + k6b + k6c + k6d + k6e + 1
        case "5k6+2":
            number = k6a + k6b + k6c + k6d + k6e + 2
        case "5k6+3":
            number = k6a + k6b + k6c + k6d + k6e + 3
        case "5k6+4":
            number = k6a + k6b + k6c + k6d + k6e + 4
        case "5k6+5":
            number = k6a + k6b + k6c + k6d + k6e + 5
        case "5k6+6":
            number = k6a + k6b + k6c + k6d + k6e + 6
        case "5k6+7":
            number = k6a + k6b + k6c + k6d + k6e + 7
        case "5k6+8":
            number = k6a + k6b + k6c + k6d + k6e + 8
        case "5k6+9":
            number = k6a + k6b + k6c + k6d + k6e + 9
        case "5k6+10":
            number = k6a + k6b + k6c + k6d + k6e + 10
            
        case "6k6":
            number = k6a + k6b + k6c + k6d + k6e + k6f
        case "6k6+1":
            number = k6a + k6b + k6c + k6d + k6e + k6f + 1
        case "6k6+2":
            number = k6a + k6b + k6c + k6d + k6e + k6f + 2
        case "6k6+3":
            number = k6a + k6b + k6c + k6d + k6e + k6f + 3
        case "6k6+4":
            number = k6a + k6b + k6c + k6d + k6e + k6f + 4
        case "6k6+5":
            number = k6a + k6b + k6c + k6d + k6e + k6f + 5
        case "6k6+6":
            number = k6a + k6b + k6c + k6d + k6e + k6f + 6
        case "6k6+7":
            number = k6a + k6b + k6c + k6d + k6e + k6f + 7
        case "6k6+8":
            number = k6a + k6b + k6c + k6d + k6e + k6f + 8
        case "6k6+9":
            number = k6a + k6b + k6c + k6d + k6e + k6f + 9
        case "6k6+10":
            number = k6a + k6b + k6c + k6d + k6e + k6f + 10
            
        case "k10":
            number = k10a
        case "k10+1":
            number = k10a + 1
        case "k10+2":
            number = k10a + 2
        case "k10+3":
            number = k10a + 3
        case "k10+4":
            number = k10a + 4
        case "k10+5":
            number = k10a + 5
        case "k10+6":
            number = k10a + 6
        case "k10+7":
            number = k10a + 7
        case "k10+8":
            number = k10a + 8
        case "k10+9":
            number = k10a + 9
        case "k10+10":
            number = k10a + 10
        
        case "2k10":
            number = k10a + k10b
        case "2k10+1":
            number = k10a + k10b + 1
        case "2k10+2":
            number = k10a + k10b + 2
        case "2k10+3":
            number = k10a + k10b + 3
        case "2k10+4":
            number = k10a + k10b + 4
        case "2k10+5":
            number = k10a + k10b + 5
        case "2k10+6":
            number = k10a + k10b + 6
        case "2k10+7":
            number = k10a + k10b + 7
        case "2k10+8":
            number = k10a + k10b + 8
        case "2k10+9":
            number = k10a + k10b + 9
        case "2k10+10":
            number = k10a + k10b + 10
        
        case "3k10":
            number = k10a + k10b + k10c
        case "3k10+1":
            number = k10a + k10b + k10c + 1
        case "3k10+2":
            number = k10a + k10b + k10c + 2
        case "3k10+3":
            number = k10a + k10b + k10c + 3
        case "3k10+4":
            number = k10a + k10b + k10c + 4
        case "3k10+5":
            number = k10a + k10b + k10c + 5
        case "3k10+6":
            number = k10a + k10b + k10c + 6
        case "3k10+7":
            number = k10a + k10b + k10c + 7
        case "3k10+8":
            number = k10a + k10b + k10c + 8
        case "3k10+9":
            number = k10a + k10b + k10c + 9
        case "3k10+10":
            number = k10a + k10b + k10c + 10
            
        case "4k10":
            number = k10a + k10b + k10c + k10d
        case "4k10+1":
            number = k10a + k10b + k10c + k10d + 1
        case "4k10+2":
            number = k10a + k10b + k10c + k10d + 2
        case "4k10+3":
            number = k10a + k10b + k10c + k10d + 3
        case "4k10+4":
            number = k10a + k10b + k10c + k10d + 4
        case "4k10+5":
            number = k10a + k10b + k10c + k10d + 5
        case "4k10+6":
            number = k10a + k10b + k10c + k10d + 6
        case "4k10+7":
            number = k10a + k10b + k10c + k10d + 7
        case "4k10+8":
            number = k10a + k10b + k10c + k10d + 8
        case "4k10+9":
            number = k10a + k10b + k10c + k10d + 9
        case "4k10+10":
            number = k10a + k10b + k10c + k10d + 10
            
        case "5k10":
            number = k10a + k10b + k10c + k10d + k10e
        case "5k10+1":
            number = k10a + k10b + k10c + k10d + k10e + 1
        case "5k10+2":
            number = k10a + k10b + k10c + k10d + k10e + 2
        case "5k10+3":
            number = k10a + k10b + k10c + k10d + k10e + 3
        case "5k10+4":
            number = k10a + k10b + k10c + k10d + k10e + 4
        case "5k10+5":
            number = k10a + k10b + k10c + k10d + k10e + 5
        case "5k10+6":
            number = k10a + k10b + k10c + k10d + k10e + 6
        case "5k10+7":
            number = k10a + k10b + k10c + k10d + k10e + 7
        case "5k10+8":
            number = k10a + k10b + k10c + k10d + k10e + 8
        case "5k10+9":
            number = k10a + k10b + k10c + k10d + k10e + 9
        case "5k10+10":
            number = k10a + k10b + k10c + k10d + k10e + 10
            
        case "6k10":
            number = k10a + k10b + k10c + k10d + k10e + k10f
        case "6k10+1":
            number = k10a + k10b + k10c + k10d + k10e + k10f + 1
        case "6k10+2":
            number = k10a + k10b + k10c + k10d + k10e + k10f + 2
        case "6k10+3":
            number = k10a + k10b + k10c + k10d + k10e + k10f + 3
        case "6k10+4":
            number = k10a + k10b + k10c + k10d + k10e + k10f + 4
        case "6k10+5":
            number = k10a + k10b + k10c + k10d + k10e + k10f + 5
        case "6k10+6":
            number = k10a + k10b + k10c + k10d + k10e + k10f + 6
        case "6k10+7":
            number = k10a + k10b + k10c + k10d + k10e + k10f + 7
        case "6k10+8":
            number = k10a + k10b + k10c + k10d + k10e + k10f + 8
        case "6k10+9":
            number = k10a + k10b + k10c + k10d + k10e + k10f + 9
        case "6k10+10":
            number = k10a + k10b + k10c + k10d + k10e + k10f + 10
            
        default:
            number = 0
            
        }
        
        
        return number
    }
    ////
    
    
    
    
    // display weapon description
//    static func weaponDesc(weapon: String) -> String {
//        
//        var description = ""
//        
//        switch weapon {
//        case "Rövid kard":
//            description = "A rövid kard 40-60 cm hosszú, egyenes pengéje mindkét oldalon ki van élezve. Gyakran íjászok második fegyvere."
//        case "Hosszú kard":
//            description = "A hosszú kard pengéje 60-80 cm-es, egyenes és kétélű. Általában gyalogos katonák fő fegyvere."
//        default:
//            description = "N/A"
//        }
//        return description
//    }
    
}
