//
//  Tab.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 14/05/2022.
//

import SwiftUI

struct TabItem: Identifiable {
    var id = UUID()
    var text: String
    var icon: String
    var tab: Tab
    var color: Color
}

var tabItems = [
    TabItem(text: "Nowość", icon: "safari", tab: .home, color: .green),
    TabItem(text: "Kategorie", icon: "square.fill.text.grid.1x2", tab: .category, color: .teal),
    TabItem(text: "Ulubione", icon: "heart", tab: .favorites, color: .red),
    TabItem(text: "Lista zakupów", icon: "checklist", tab: .shoppingList, color: .purple)
]

enum Tab: String {
    case home
    case category
    case favorites
    case shoppingList
}

struct TabPreferanceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
