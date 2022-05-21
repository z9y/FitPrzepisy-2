//
//  Favorites.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 12/04/2022.
//

import Foundation

class Favorites: ObservableObject {
    private var recipes: Set<String>
    private let saveKey = "Favorites"
    
    init() {
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decoded = try? JSONDecoder().decode(Set<String>.self, from: data) {
                recipes = decoded
                return
            }
        }
        
        recipes = []
    }
    
    func contains(_ recipe: Recipe) -> Bool {
        recipes.contains(recipe.id)
    }
    
    func add(_ recipe: Recipe) {
        objectWillChange.send()
        recipes.insert(recipe.id)
        save()
    }
    
    func remove(_ recipe: Recipe) {
        objectWillChange.send()
        recipes.remove(recipe.id)
        save()
    }
    
    func save() {
        if let data = try? JSONEncoder().encode(recipes) {
            UserDefaults.standard.set(data, forKey: saveKey)
        }
    }
    
    static let example = Favorites()
}
