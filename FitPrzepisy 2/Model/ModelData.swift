//
//  ModelData.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 29/01/2022.
//

import Foundation
import Combine

@MainActor
class ModelData: ObservableObject {
    @Published var recipes = [Recipe]()
    
    init() {
        Task {
            await loadData()
        }
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
}
