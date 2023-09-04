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
                ForEach(networkAggregateModel.bookmarkedRecipes ?? [], id: \.id) { recipe in
                    LazyVStack {
                        BookmarksCell(title: recipe.title ,
                                      subtitle: "Subtitle",
                                      image: recipe.image,
                                      autorImage: "author",
                                      autorName: "Zeelicious foods",
                                      scoreNumber: 5.0,
                                      recipe: BookmarkRecipe(id: recipe.id,  title: recipe.title, image: recipe.image),
                                      widthBackground: 364,
                                      heightBackground: 220
                        )
                    }
                    .padding(.vertical, 8)
                }
            }
            .navigationTitle("Saved recipes")
            .font(.custom(Poppins.SemiBold, size: 24))
//            .onAppear {
//                if let bookmarks: [BookmarkRecipe] = UserDefaultService.shared.getStructs(forKey: "Bookmarks") {
//                    networkAggregateModel.bookmarkedRecipes = bookmarks
//                }
//            }
        }
    }
}

struct SavedRecipesView_Previews: PreviewProvider {
    static var previews: some View {
        SavedRecipesView()
    }
}
