//
//  HealthAndPainPointCalculator.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 28/10/2022.
//

import Foundation

class HpPpCalc {
    
    static func isPlusButtonDisabled(actPoint: Int,  maxPoint: Int) -> Bool {
        
        if actPoint >= maxPoint {
            return true
        } else {
            return false
        }
    }
    
    static func isMinusButtonDisabled(actPoint: Int,  maxPoint: Int) -> Bool {
        
        if actPoint <= 0 {
            return true
        } else {
            return false
        }
    }
    
}
