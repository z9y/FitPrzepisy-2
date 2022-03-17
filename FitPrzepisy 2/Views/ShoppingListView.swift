//
//  ShoppingListView.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 14/03/2022.
//

import SwiftUI

struct ShoppingListView: View {
    var body: some View {
        NavigationView {
            Text("Lista zakupów")
                .navigationTitle("List zakupów")
        }
        .navigationViewStyle(.stack)
    }
}

struct ShoppingListView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingListView()
    }
}
