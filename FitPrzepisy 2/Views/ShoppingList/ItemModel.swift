//
//  ItemModel.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 19/03/2022.
//

import Foundation
import SwiftUI

struct ItemModel: Identifiable, Codable {
    let id: UUID
    let name: String
    let isBought: Bool
    
    init(id: UUID = UUID(), name: String, isBought: Bool) {
        self.id = id
        self.name = name
        self.isBought = isBought
    }
    
    func changeCompletion() -> ItemModel {
        return ItemModel(id: id, name: name, isBought: !isBought)
    }
}
