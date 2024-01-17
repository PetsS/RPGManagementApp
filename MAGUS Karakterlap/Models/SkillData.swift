//
//  WeaponData.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 05/10/2022.
//

import Foundation
import SwiftUI

struct SkillData {
    
    var skillName: String
    var skillDescription: String
    var skillCategory: String
    var af: Int16
    var mf: Int16
    
    var skillCat1 : [(name:String, cat:String, kpAf:Int, kpMf:Int, desc:String)]
}
