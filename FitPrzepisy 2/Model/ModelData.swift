//
//  ModelData.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 29/01/2022.
//

import CoreData
//import Combine
import Foundation
import SwiftUI

@MainActor
class ModelData: ObservableObject {
    @Published var recipes = [Recipe]()
//    @Environment(\.managedObjectContext) var moc
//    @FetchRequest(sortDescriptors: [
//        SortDescriptor(\.isBought),
//        SortDescriptor(\.name)
//    ]) var items: FetchedResults<Item>
    
//    @Published var items: [ItemModel] = [] {
//        didSet {
//            saveItem()
//        }
//    }
    
    @Published var favorites: [Recipe] = [] {
        didSet {
            saveFavorites()
        }
    }
    
    let itemsKey: String = "itemsList"
    let favoritesKey: String = "favoritesList"
    
    init() {
        Task {
            await loadData()
        }
        getFavorites()
    }
    
    var categories: [String: [Recipe]] {
        Dictionary (
            grouping: recipes,
            by: { $0.category.rawValue}
        )
    }
    
    var features: [Recipe] {
        recipes.filter { $0.isFeatured }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://z999y.free.beeceptor.com/fitprzepisy") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            if let decodedResponse = try? JSONDecoder().decode([Recipe].self, from: data) {
                recipes = decodedResponse
            }
        } catch {
            print("Invalid data")
        }
    }
    
    //skasowac powtarzanie
    func getFavorites() {
        guard let data = UserDefaults.standard.data(forKey: favoritesKey) else { return }
        guard let savedFavorites = try? JSONDecoder().decode([Recipe].self, from: data) else { return }
        
        self.favorites = savedFavorites
    }
    
    func saveFavorites() {
        if let encodedData = try? JSONEncoder().encode(favorites) {
            UserDefaults.standard.set(encodedData, forKey: favoritesKey)
        }
    }
    
    func addToFavorites(recipe: Recipe) {
        let newFavorite = recipe
        favorites.append(newFavorite)
    }
    
//    func getItems() {
//        guard let data = UserDefaults.standard.data(forKey: itemsKey) else { return }
//        guard let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data) else { return }
//        
//        self.items = savedItems
//    }
//    func changeCompletion(id: UUID, name: String, isBought: Bool) -> Item {
//        return Item(context: moc)
//    }
//
//    func saveItem() {
//        if let encodedData = try? JSONEncoder().encode(items) {
//            UserDefaults.standard.set(encodedData, forKey: itemsKey)
//        }
//    }
//
//    func addItem(name: String) {
//        let newItem = ItemModel(name: name, isBought: false)
//        items.append(newItem)
//    }
//
//    func changeCompletion(item: Item) {
//        if let index = items.firstIndex(where: { $0.id == item.id }) {
//            items[index] = item.changeCompletion()
//
//            let element = items.remove(at: index)
//
//            if item.isBought == false {
//                items.insert(element, at: items.count)
//            } else {
//                items.insert(element, at: 0)
//            }
//        }
//    }
}
