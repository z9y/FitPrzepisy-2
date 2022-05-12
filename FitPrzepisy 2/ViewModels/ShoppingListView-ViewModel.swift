//
//  ShoppingListView-ViewModel.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 12/05/2022.
//
//
//import CoreData
//import SwiftUI
//
//extension ShoppingListView {
//    @MainActor class ViewModel: ObservableObject {
//        @Environment(\.managedObjectContext) var moc
//        @Published var items: [Item] = []
//        
//        var dataController: DataController
//        
//        init() {
//            dataController = DataController()
//            fetchRequest()
//        }
//        
//        func fetchRequest() {
//            let request = NSFetchRequest<Item>(entityName: "Item")
//            
//            do {
//                items = try dataController.container.viewContext.fetch(request)
//            } catch let error {
//                print("Error fetching \(error)")
//            }
//        }
//        
//        func saveData() {
//            do {
//                try dataController.container.viewContext.save()
//                fetchRequest()
//            } catch let error {
//                print("Error saving. \(error)")
//            }
//        }
//        
//        func deleteItem() {
//            for item in items {
//                dataController.container.viewContext.delete(item)
//            }
//            saveData()
//        }
//        
//        func changeBool(item: Item) {
//            item.isBought = !item.isBought
//            
//            try? moc.save()
//        }
//    }
//}
