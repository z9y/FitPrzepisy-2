//
//  Suggestion.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 22/05/2022.
//

import Foundation

struct Suggestion: Identifiable {
    let id = UUID()
    let text: String
}

let suggestions = [
    Suggestion(text: "Kurczak"),
    Suggestion(text: "Owsianka"),
    Suggestion(text: "Dorsz")
]
