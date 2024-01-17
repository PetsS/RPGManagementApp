//
//  ArmorData.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 05/10/2022.
//

import Foundation
import SwiftUI

struct ArmorData {
    
    var armorName: String
    var armorMGT: Int
    var armorSFE: Int
    var armorDescription: String
    var armorType: String
    
    var armorCat1 : [(name:String, type:String, mgt:Int, sfe:Int, desc:String)]
}
