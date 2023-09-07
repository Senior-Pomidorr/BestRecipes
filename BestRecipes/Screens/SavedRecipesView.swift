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
    @State private var savedBookmarks: [BookmarkRecipe] = []
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView {
                    ForEach(networkAggregateModel.bookmarkedRecipes ?? [], id: \.id) { recipe in
                        NavigationLink(destination: DetailRecipeView(recipeID: String(recipe.id ?? 1))) {
                            LazyVStack {
                                BookmarksCell(title: recipe.title ,
                                              subtitle: "Subtitle",
                                              image: recipe.image,
                                              autorImage: "author",
                                              autorName: "Zeelicious foods",
                                              scoreNumber: 5.0,
                                              recipe: BookmarkRecipe(id: recipe.id,  title: recipe.title, image: recipe.image, isBookmarked: true),
                                              widthBackground: 364,
                                              heightBackground: 220
                                )
                            }
                            .padding(.vertical, 8)
                        }
                    }
                }
                .navigationTitle("Saved recipes")
                .font(.custom(Poppins.SemiBold, size: 24))
                .padding(.bottom, geometry.safeAreaInsets.bottom + 20)
            }
        }
    }
}

struct SavedRecipesView_Previews: PreviewProvider {
    static var previews: some View {
        SavedRecipesView()
    }
}
