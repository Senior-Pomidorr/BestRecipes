//
//  CategoryMenu.swift
//  BestRecipes
//
//  Created by Artem on 03.09.2023.
//

import SwiftUI

struct CategoryMenu: View {
    @State var categoryIndex = 0
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12){
                    ForEach(0..<categories.count, id: \.self){data in
                        Categories(recipeIndex: data, selectedIndex: $categoryIndex)
                    }
                }
                .padding(.horizontal, 8)
            }
        }
    }
}

struct CategoryMenu_Previews: PreviewProvider {
    static var previews: some View {
        CategoryMenu()
    }
}
