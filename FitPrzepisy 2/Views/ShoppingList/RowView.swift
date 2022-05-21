//
//  RowView.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 19/03/2022.
//

import SwiftUI

struct RowView: View {
    @EnvironmentObject var modelData: ModelData
    @EnvironmentObject var viewModel: DataController
    
    let shoppingList = ShoppingListView()
    let item: Item
    
    var body: some View {
        HStack {
            Button {
                withAnimation(.default.delay(0.3)) {
                    viewModel.changeBool(item: item)
                }
            } label: {
                Image(systemName: item.isBought ? "checkmark.circle" : "circle")
            }
            .foregroundColor(item.isBought ? .secondary : .primary)
            
            Text(item.name ?? "Unknown")
                .font(.callout)
                .foregroundColor(item.isBought ? .secondary : .primary)
                .fixedSize(horizontal: false, vertical: true)
            
            Spacer()
        }
        .padding()
        .cornerRadius(15)
    }
}
