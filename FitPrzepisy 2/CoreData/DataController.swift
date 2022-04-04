//
//  DataController.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 04/04/2022.
//

import CoreData
import Foundation

@MainActor
class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Item")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
