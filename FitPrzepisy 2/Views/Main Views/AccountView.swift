//
//  AccountView.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 14/05/2022.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        NavigationView {
            List {
                profile
                
                menu
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Konto")
        }
    }
    
    var profile: some View {
        VStack(spacing: 8) {
            Image(systemName: "person.crop.circle.fill.badge.checkmark")
                .symbolVariant(.circle.fill)
                .font(.system(size: 32))
                .symbolRenderingMode(.palette)
                .foregroundStyle(.blue, .blue.opacity(0.3))
                .padding()
                .background(Circle().fill(.ultraThinMaterial))
                .background(
                    HexagonView()
                        .offset(x: -50, y: -20)
                )
                .background(
                    BubbleView()
                        .offset(x: 200, y: 0)
                        .scaleEffect(0.6)
                )
            Text("Pawel Slusarz")
                .font(.title.weight(.semibold))
            HStack {
                Text("Konto FIT+")
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
    
    var menu: some View {
        Section {
            NavigationLink {
                HomeView()
            } label: {
                Label("Opcje", systemImage: "gear")
            }
            NavigationLink {
                HomeView()
            } label: {
                Label("Rachunki", systemImage: "creditcard")
            }
            NavigationLink {
                HomeView()
            } label: {
                Label("Pomoc", systemImage: "questionmark")
            }
        }
        .accentColor(.primary)
        .listRowSeparatorTint(.blue)
        .listRowSeparator(.hidden)
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
