//
//  Recipe.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 29/01/2022.
//

import Foundation
import SwiftUI

struct Recipe: Codable, Identifiable {
    let id: String
    let name: String
    let category: String
    let tag: [String]
    let isFeatured: Bool
    let details: [String: Int]
    let ingredients: [String]
    let preparation: [String]
    
    var featureImage: Image? {
        isFeatured ? Image(id) : nil
    }
}
