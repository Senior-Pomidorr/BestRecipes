//
//  TrendingNowView.swift
//  BestRecipes
//
//  Created by Лилия Феодотова on 27.08.2023.
//

import SwiftUI

struct TrendingNowView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                TrendingNowCell(title: "How to make yam & vegetable sauce at home",
                                subtitle: "Subtitle",
                                image: "fetasiers",
                                scoreNumber: 5.0,
                                ingredintsCount: 9,
                                receptMinutes: 25)
                TrendingNowCell(title: "How to make yam & vegetable sauce at home",
                                subtitle: "Subtitle",
                                image: "receptes",
                                scoreNumber: 5.0,
                                ingredintsCount: 9,
                                receptMinutes: 25)
                TrendingNowCell(title: "How to make yam & vegetable sauce at home",
                                subtitle: "Subtitle",
                                image: "bbq",
                                scoreNumber: 5.0,
                                ingredintsCount: 9,
                                receptMinutes: 25)
            }
        }
    }
}

struct TrendingNowView_Previews: PreviewProvider {
    static var previews: some View {
        TrendingNowView()
    }
}
