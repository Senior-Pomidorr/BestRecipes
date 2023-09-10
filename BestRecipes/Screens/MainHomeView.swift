//
//  MainHomeView.swift
//  BestRecipes
//
//  Created by Artem on 29.08.2023.
//

import SwiftUI
import Kingfisher

struct MainHomeView: View {
    
    @EnvironmentObject var networkAggregateModel: NetworkAggregateModel
    @State var searchFieldText: String = ""
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(alignment: .leading, spacing: 16) {
                        
                        Text("Get amazing recipes for cooking")
                            .font(.title)
                            .fontWeight(.semibold)
                            .padding(.leading, 16)
                        
                        SearchBarView(searchText: $searchFieldText)
                            .padding(.bottom, -4)
//MARK: - Trending now
                        
                        HStack {
                            Text("Trending now🔥")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding(.leading)
                            Spacer()
                            NavigationLink(destination: TrendingNowView(recipes: networkAggregateModel.shortRecipeListTrendingNow, screenTitle: "Trending now", cuisine: nil)) {
                                SeeAllButton()
                            }
                        }
                        
                        LazyVStack(alignment: .leading) {
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack(spacing: 16) {
                                    ForEach(networkAggregateModel.shortRecipeListTrendingNow, id: \.self) { recipe in
                                        let recipeID = recipe.id ?? 0
                                        let isBookmarked = networkAggregateModel.bookmarkedRecipes?.contains(where: { $0.id == recipeID }) ?? false
                                        NavigationLink(destination: DetailRecipeView(recipeID: String(recipeID))
                                            .onAppear(perform: {
                                                if networkAggregateModel.recentRecipeList.last != recipe { networkAggregateModel.recentRecipeList.append(recipe)
                                                    UserDefaultService.shared.saveStructs(
                                                        structs: networkAggregateModel.recentRecipeList,
                                                        forKey: "Recent")
                                                }
                                            })
                                                )
                                        {
                                            BookmarksCell(title: recipe.title ?? "How to sharwama at home",
                                                          subtitle: "Subtitle",
                                                          image: recipe.image ?? "",
                                                          autorImage: "author",
                                                          autorName: "Zeelicious foods",
                                                          scoreNumber: recipe.rating ??
                                                          (Double.random(in: 3.5...5.0) * 10).rounded() / 10.0,
                                                          recipe: BookmarkRecipe.init(id: recipe.id, title: recipe.title ?? "", image: recipe.image ?? "bbq", isBookmarked: isBookmarked),
                                                          widthBackground: 280,
                                                          heightBackground: 180
                                            )
                                        }
                                    }
                                }
                                .padding([.leading, .trailing], 16)
                                .task {
                                    networkAggregateModel.searchRecipeShort(params: ["sort":"popularity"], requestTag: .trendingNow)
                                }
                            }
//MARK: - Popular Category
                            
                            Text("Popular Category")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding([.leading,.top])
                            CategoryMenu()
                                .padding(.vertical,8)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack(spacing: 16) {
                                    ForEach(networkAggregateModel.shortRecipeListPopularCategory, id: \.self) { recipe in
                                        let recipeID = recipe.id ?? 1
                                        let isBookmarked = networkAggregateModel.bookmarkedRecipes?.contains(where: { $0.id == recipeID }) ?? false
                                        NavigationLink(destination: DetailRecipeView(recipeID: String(recipeID))
                                            .onAppear(perform: {
                                                if networkAggregateModel.recentRecipeList.last != recipe { networkAggregateModel.recentRecipeList.append(recipe)
                                                    UserDefaultService.shared.saveStructs(
                                                        structs: networkAggregateModel.recentRecipeList,
                                                        forKey: "Recent")
                                                }
                                            })
                                                )
                                        {
                                            PopularCategoryCell(width: 150, height: 250, recipe: BookmarkRecipe(id: recipe.id, title: recipe.title ?? "", image: recipe.image ?? "bbq", isBookmarked: isBookmarked), imageName: recipe.image ?? "", tabName: recipe.title ?? "",time: "5  мин")
                                        }                                      
                                    }
                                }
                                .padding(.horizontal,16)
                                .task {
                                    networkAggregateModel.searchRecipeShort(
                                        params: ["query" : categories[networkAggregateModel.categoryIndex].lowercased()],
                                        requestTag: .popularCategory)
                                }
//MARK: - Recent recipes
                                
                            }
                            HStack {
                                Text("Recent recipes")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .padding(.leading)
                                
                                Spacer()
                                
                                NavigationLink(destination: TrendingNowView(recipes: networkAggregateModel.recentRecipeList, screenTitle: "Recent recipes", cuisine: nil)) {
                                    SeeAllButton()
                                }
                            }
                            .padding(.top, 16)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack(spacing: 16) {
                                    ForEach(networkAggregateModel.recentRecipeList.reversed()) { recipe in
                                        let recipeID = recipe.id ?? 1
                                        let isBookmarked = networkAggregateModel.bookmarkedRecipes?.contains(where: { $0.id == recipeID }) ?? false
                                        NavigationLink(destination: DetailRecipeView(recipeID: String(recipeID))) {
                                            RecentsRecipeCell(title: recipe.title ?? "How to sharwama at home",
                                                              subtitle: "Subtitle",
                                                              image: recipe.image ?? "",
                                                              autorImage: "author",
                                                              autorName: "Zeelicious foods",
                                                              scoreNumber: 5.0,
                                                              recipe: BookmarkRecipe.init(id: recipe.id, title: recipe.title ?? "", image: recipe.image ?? "bbq", isBookmarked: isBookmarked),
                                                              widthBackground: 280,
                                                              heightBackground: 180
                                            )
                                        }
                                    }
                                }
                                .padding(.horizontal, 16)
                            }
                            .frame(height: 250)
                        }
//MARK: - Popular cuisines
                        Text("Popular cuisines")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding([.leading, .top])
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(spacing: 16) {
                                ForEach(cuisines, id: \.self) {
                                    cuisine in
                                    NavigationLink (destination: TrendingNowView(recipes: networkAggregateModel.shortRecipeListCuisines, screenTitle: "\(cuisine) cuisine", cuisine: cuisine)) {
                                        AutorCell(avatar: cuisine, authorName: cuisine)
                                    }
                                }
                            }
                            .padding(.horizontal, 16)
                            .frame(height: 160)
                        }
                    }
                    .padding(.bottom, geometry.safeAreaInsets.bottom + 50)
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct HomeCustomView_Previews: PreviewProvider {
    static var previews: some View {
        MainHomeView()
            .environmentObject(NetworkAggregateModel(networkService: NetworkService()))
    }
}
