//
//  ViewRouter.swift
//  MAGUS Karakterlap
//
//  Created by Peter Szots on 15/09/2022.
//

import SwiftUI

class PageSelector: ObservableObject {
    
    @Published var currentPage: Page = .character
    
    enum Page {
        case character
        case values
        case weapons
        case magic
        case items
        case skills
        case fight
    }
}
