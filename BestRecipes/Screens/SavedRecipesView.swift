//
//  SavedRecipesView.swift
//  BestRecipes
//
//  Created by Лилия Феодотова on 27.08.2023.
//

import SwiftUI

struct SavedRecipesView: View {
    @EnvironmentObject var networkAggregateModel: NetworkAggregateModel
    @EnvironmentObject var tabbarRouter: TabbarRouter
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(networkAggregateModel.bookmarkedRecipes, id: \.id) { recipe in
                    LazyVStack(spacing: 0) {
                        BookmarksCell(title: recipe.title ,
                                      subtitle: "Subtitle",
                                      image: recipe.image,
                                      autorImage: "author",
                                      autorName: "Zeelicious foods",
                                      scoreNumber: 5.0,
                                      recipe: BookmarkRecipe(id: recipe.id,  title: recipe.title, image: recipe.image)
                                    )
                    }
                }
            }
            .navigationTitle("Saved recipes")
            .font(.custom(Poppins.SemiBold, size: 24))
        }
    }
}

struct SavedRecipesView_Previews: PreviewProvider {
    static var previews: some View {
        SavedRecipesView()
    }
}
