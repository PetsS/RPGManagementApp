//
//  TargetData.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 05/10/2022.
//

import Foundation
import SwiftUI

struct TargetData {
    
    var targetName: String
    var targetDesc: String
    var targetValue: Int
    
    var targetCat1 : [(name:String, val:Int, desc:String)]
    var targetCat2 : [(name:String, val:Int, desc:String)]
    var targetCat3 : [(name:String, val:Int, desc:String)]
}
