//
//  DataController.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 04/04/2022.
//

import CoreData
import SwiftUI

@MainActor
class DataController: ObservableObject {
    @Published var items: [Item] = []
    @Published var showAddedToast = false
    @Published var showDeleteToast = false
    
    let container = NSPersistentContainer(name: "Item")
    
    let haptic = UINotificationFeedbackGenerator()

    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
        fetchRequest()
    }
    
    func fetchRequest() {
        let request = NSFetchRequest<Item>(entityName: "Item")
        
        do {
            items = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching \(error)")
        }
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchRequest()
            print("saved")
        } catch let error {
            print("Error saving. \(error)")
        }
    }
    
    func deleteItem() {
        for item in items {
            container.viewContext.delete(item)
        }
        haptic.notificationOccurred(.success)
        saveData()
    }
    
    func changeBool(item: Item) {
        item.isBought = !item.isBought

        saveData()
    }
    
    func addItem(recipe: Recipe) {
        _ = recipe.ingredients.map { ingredient in

            var amount: String {
                switch ingredient.amount {
                case 0:
                    return "-"
                case floor(ingredient.amount):
                    return "\(Int(ingredient.amount))"
                default:
                    return String(format: "%.2f", ingredient.amount)
                }
            }

            let newItem = Item(context: container.viewContext)
            newItem.id = UUID()
            newItem.isBought = false
            newItem.name = "\(ingredient.ingredient)" + " " + "\(amount)" + " " + "\(ingredient.unit)"

            haptic.notificationOccurred(.success)
        }
        saveData()
    }
}
