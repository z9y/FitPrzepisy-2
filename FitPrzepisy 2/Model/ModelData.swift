//
//  ModelData.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 29/01/2022.
//

import Combine
import CoreData
import Foundation
import SwiftUI

@MainActor class ModelData: ObservableObject {
    @Published private(set) var recipes = [Recipe]()
    @Published var showDetail: Bool = false
    
    private var cancellable: Cancellable?
    
    init() {
        Task {
            await loadData()
        }
    }
    
    //HOMEVIEW MODEL
    var categories: [String: [Recipe]] {
        Dictionary (
            grouping: recipes,
            by: { $0.category.rawValue}
        )
    }
    
    //HOMEVIEW MODEL 
    var features: [Recipe] {
        recipes.filter { $0.isFeatured }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://zarowka2137.free.beeceptor.com/fitprzepisy") else {
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
}
