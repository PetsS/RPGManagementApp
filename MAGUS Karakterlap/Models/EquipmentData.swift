//
//  EquipmentData.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 05/10/2022.
//

import Foundation
import SwiftUI

struct EquipmentData {
    
    var equipmentId: UUID
    
    var equipmentName: String
    var equipmentQty: Int
    var equipmentComm: String
    var equipmentDesc: String
    
    var equipmentCat1 : [(name:String, cost:Int, curr:String, desc:String)]
    var customEquipmentCat : [(name:String, qty:Int, cost:Int, curr:String, desc:String, comm:String)]
}
