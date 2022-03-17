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
//    let category: String
    let category: Category
    let tag: [String]
    let isFeatured: Bool
    let details: [String: Int]
    let ingredients: [String]
    let preparation: [String]
    
    var featureImage: Image? {
        isFeatured ? Image(id) : nil
    }
    
    
    
    enum Category: String, CaseIterable, Codable, Identifiable {
        var id: String { self.rawValue }
        
        case breakfast = "Śniadanie"
        case lunch = "Obiad"
        case dessert = "Deser"
        case dinner = "Kolacja"
    }
    
    static let example = Recipe(id: "example", name: "This is example recipe", category: Category.breakfast, tag: ["Śniadanie", "Kurczak", "Papryka"], isFeatured: false, details: ["level": 2, "preparationTime": 15, "totalTime": 25, "servings": 3], ingredients: ["bułka lub chleb - 70g (1 szt.)", "awokado hass - 70g (1/2 szt.)", "ser feta - 40g (2 plastry)", "troszkę soku z cytryny", "pieprz, czosnek, sól (odrobina, ser już jest słony)", "pomidorki koktajlowe - bez ograniczeń", "dodatki: np. kiełki, posiekane orzechy włoskie, sezam, nasiona konopii"], preparation: ["Bułkę/chleb pokrój i zapiecz na grzanki (można też skropić je lekko oliwą).", "Awokado (musi być dojrzałe) rozgnieć widelcem ze szczyptą soli, pieprzem i sokiem z cytryny.", "Na chleb nałóż pastę z awokado, na nią pokrusz ser feta (albo pokrój, ale ja zawsze go kruszę, dla mnie to wygodniejsze i ładniej wygląda), a na to ulubione dodatki.", "Posyp świeżo mielonym pieprzem i podawaj z pokrojonymi pomidorkami koktajlowymi."])
}
