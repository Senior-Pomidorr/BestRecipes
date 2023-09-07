//
//  CategoryMenu.swift
//  BestRecipes
//
//  Created by Artem on 03.09.2023.
//

import SwiftUI

struct CategoryMenu: View {
    @EnvironmentObject var networkAggregateModel: NetworkAggregateModel
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12){
                    ForEach(0..<categories.count, id: \.self){data in
                        Categories(recipeIndex: data, selectedIndex: $networkAggregateModel.categoryIndex)
                    }
                }
                .padding(.horizontal, 8)
            }
        }
    }
}


