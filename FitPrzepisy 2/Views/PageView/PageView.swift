//
//  PageView.swift
//  FitPrzepisy 2
//
//  Created by Pawel Slusarz on 29/01/2022.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    @State private var currentPage = 0

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: pages, currentPage: $currentPage)
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .padding(.horizontal)
                .frame(width: CGFloat(pages.count * 18))
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pages: ModelData().features.map { FeatureCard(recipe: $0) })
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}
