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
    let category: Category
    let tag: [String]
    let isFeatured: Bool
    let details: Details
    let ingredients: [Ingredient]
    let preparation: [String]
    let macro: Macro
    
    var featureImage: Image? {
        isFeatured ? Image(id) : nil
    }
    
    struct Ingredient: Codable, Hashable {
        let ingredient: String
        let amount: Double
        let unit: String
    }
    
    struct Macro: Codable {
        let kcal: Double
        let carbohydrates: Double
        let protein: Double
        let fat: Double
    }
    
    struct Details: Codable {
        let level: Int
        let preparationTime: Int
        let totalTime: Int
        let servings: Int
    }
    
    enum Category: String, CaseIterable, Codable, Identifiable {
        var id: String { self.rawValue }
        
        case breakfast = "Śniadanie"
        case lunch = "Obiad"
        case dessert = "Deser"
        case dinner = "Kolacja"
    }
    
    static let example = Recipe(id: "example", name: "This is example recipe", category: Category.breakfast, tag: ["Śniadanie", "Kurczak", "Papryka"], isFeatured: false, details: Recipe.Details(level: 1, preparationTime: 45, totalTime: 60, servings: 3) , ingredients: [Ingredient(ingredient: "Bułka", amount: 0.5, unit: "gram"), Ingredient(ingredient: "Pomarańcze", amount: 2, unit: "sztuki"), Ingredient(ingredient: "Bułka", amount: 0.5, unit: "gram"), Ingredient(ingredient: "Bułka", amount: 0.5, unit: "gram"), Ingredient(ingredient: "Bułka", amount: 0.5, unit: "gram"), Ingredient(ingredient: "Bułka", amount: 0.5, unit: "gram"),], preparation: ["Bułkę/chleb pokrój i zapiecz na grzanki (można też skropić je lekko oliwą).", "Awokado (musi być dojrzałe) rozgnieć widelcem ze szczyptą soli, pieprzem i sokiem z cytryny.", "Na chleb nałóż pastę z awokado, na nią pokrusz ser feta (albo pokrój, ale ja zawsze go kruszę, dla mnie to wygodniejsze i ładniej wygląda), a na to ulubione dodatki.", "Posyp świeżo mielonym pieprzem i podawaj z pokrojonymi pomidorkami koktajlowymi."], macro: Recipe.Macro(kcal: 100, carbohydrates: 100, protein: 100, fat: 100))
}
