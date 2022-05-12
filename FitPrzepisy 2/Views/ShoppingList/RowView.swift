//
//  RowView.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 19/03/2022.
//

import SwiftUI

struct RowView: View {
    @EnvironmentObject var modelData: ModelData
    @StateObject var viewModel = DataController()
    
    let shoppingList = ShoppingListView()
    let item: Item
    
    var body: some View {
        HStack {
            Button{
                viewModel.changeBool(item: item)
            } label: {
                Image(systemName: item.isBought ? "checkmark.circle" : "circle")
            }
            .foregroundColor(.primary)
            
            Text(item.name ?? "Unknown")
                .font(.callout)
                .strikethrough(item.isBought ? true : false)
                .lineLimit(nil)
            
            Spacer()
        }
        .padding()
        .cornerRadius(15)
    }
}
