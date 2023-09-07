//
//  TrendingNowView.swift
//  BestRecipes
//
//  Created by Лилия Феодотова on 27.08.2023.
//

import SwiftUI

struct TrendingNowView: View {
    @EnvironmentObject var networkAggregateModel: NetworkAggregateModel
    
    var recipeInoutList: [RecipeShort]
    var screenTitle: String
    
    var cuisine: String?
    
    init(recipes: [RecipeShort], screenTitle: String, cuisine: String?) {
        self.recipeInoutList = recipes
        self.screenTitle = screenTitle
        self.cuisine = cuisine
    }
 
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                ForEach(recipeInoutList, id: \.self) { recipe in
                    let recipeID = recipe.id ?? 0
                    NavigationLink(destination: DetailRecipeView(recipeID: String(recipeID))) {
                        LazyVStack {
                            TrendingNowCell(title: recipe.title ?? "detailRecipe.nonameofrecipe".localized,
                                            subtitle: "Subtitle",
                                            image: recipe.image ?? "",
                                            scoreNumber: 5.0,
                                            ingredintsCount: 9,
                                            receptMinutes: 25)
                        }
                        .padding(.bottom, 16)
                    }
                }
                .padding(.vertical, 16)
                .task({
                    if cuisine != nil {
                        networkAggregateModel.searchRecipeShort(params: ["cuisine": cuisine ?? "italian"], requestTag: .cuisines)

                    }
                })
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        VStack {
                            Text(screenTitle)
                                .font(.custom(Poppins.SemiBold, size: 24))
                                .foregroundColor(.black)
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: CustomBackButton())
            .padding(.bottom, geometry.safeAreaInsets.bottom)
        }
    }
    

}

//struct TrendingNowView_Previews: PreviewProvider {
//    static var previews: some View {
//        TrendingNowView()
//            .environmentObject(NetworkAggregateModel(networkService: NetworkService()))
//    }
//}
