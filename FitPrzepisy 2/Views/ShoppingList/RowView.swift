//
//  RowView.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 19/03/2022.
//

import SwiftUI

struct RowView: View {
    @EnvironmentObject var modelData: ModelData
    
    let cos = ShoppingListView()
    
    let item: Item
    
    var body: some View {
        HStack {
            Button{
                cos.changeBool(item: item)
            } label: {
                Image(systemName: item.isBought ? "checkmark.circle" : "circle")
            }
            
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
