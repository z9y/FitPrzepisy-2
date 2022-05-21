//
//  HomeCardView.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 14/05/2022.
//

import SwiftUI

struct HomeCardView: View {
    var recipe: Recipe
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            VStack {
                helper
                helper
                helper
            }
            
            Spacer()
            
            Text(recipe.name)
                .font(.title)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.linearGradient(colors: [.primary, .primary.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
            Text("\(recipe.details.totalTime) MIN - \(recipe.category.rawValue.uppercased())")
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundColor(.secondary)
        }
        .padding(.all, 20.0)
        .padding(.vertical, 20)
        .frame(height: 350.0)
        .background(.ultraThinMaterial)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle()
        .padding(.horizontal, 20)
    }
    
    var helper: some View {
        Image(systemName: "pencil")
            .resizable(resizingMode: .stretch)
            .aspectRatio(contentMode: .fit)
            .frame(width: 26, height: 26)
            .cornerRadius(10)
            .padding(9)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
            .strokeStyle(cornerRadius: 16)
    }
}

struct HomeCardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeCardView(recipe: Recipe.example)
            HomeCardView(recipe: Recipe.example)
                .preferredColorScheme(.dark)
        }
    }
}
