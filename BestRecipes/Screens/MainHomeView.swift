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
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(alignment: .leading, spacing: 16) {
                    
                    Text("Get amazing recipes for cooking")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.leading, 16)
                    
                    SearchBarView(searchText: $searchFieldText)
                        .padding(.bottom, -4)
                    
                    HStack {
                        Text("Tranding now🔥")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.leading)
                        Spacer()
                        NavigationLink(destination: TrendingNowView()) {
                            SeeAllButton()
                        }
                    }
                    
                    LazyVStack(alignment: .leading) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(spacing: 16) {
                                ForEach(networkAggregateModel.shortRecipeListTrendingNow, id: \.self) { recipe in
                                    let recipeID = recipe.id ?? 0
                                    NavigationLink(destination: DetailRecipeView(recipeID: String(recipeID))) {
                                        BookmarksCell(title: recipe.title ?? "How to sharwama at home",
                                                      subtitle: "Subtitle",
                                                      image: recipe.image ?? "",
                                                      autorImage: "author",
                                                      autorName: "Zeelicious foods",
                                                      scoreNumber: 5.0,
                                                      recipe: BookmarkRecipe.init(id: recipe.id, title: recipe.title ?? "", image: recipe.image ?? "bbq"),
                                                      widthBackground: 280,
                                                      heightBackground: 180
                                        )
                                    }
                                }
                            }
                            .padding([.leading, .trailing], 16)
                        }
                        
                        Text("Popular Category")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding([.leading,.top])
                        CategoryMenu()
                            .padding(.vertical,8)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(spacing: 16) {
                                PopularCategoryCell(width: 150, height: 250, imageName: "img-test", tabName: "Blini shawarma wrapped", time: "5 мин")
                                PopularCategoryCell(width: 150, height: 250, imageName: "img-test", tabName: "Blini shawarma wrapped", time: "5 мин")
                                PopularCategoryCell(width: 150, height: 250, imageName: "img-test", tabName: "Blini shawarma wrapped", time: "5 мин")
                                PopularCategoryCell(width: 150, height: 250, imageName: "img-test", tabName: "Blini shawarma wrapped", time: "5 мин")
                            }
                            .padding(.horizontal,16)
                        }
                        HStack {
                            Text("Recent recipes")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding(.leading)
                            Spacer()
                            Button {
                                print("All recipes")
                            } label: {
                                SeeAllButton()
                            }
                        }
                        .padding(.top, 16)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(spacing: 16) {
                                RecentRecipeCell(recipeImage: "img-test", recipeText: "Kelewele Ghanian Recipe", recipeCreator: "zeleecious food")
                                RecentRecipeCell(recipeImage: "img-test", recipeText: "Kelewele Ghanian Recipe", recipeCreator: "zeleecious food")
                                RecentRecipeCell(recipeImage: "img-test", recipeText: "Kelewele Ghanian Recipe", recipeCreator: "zeleecious food")
                                RecentRecipeCell(recipeImage: "img-test", recipeText: "Kelewele Ghanian Recipe", recipeCreator: "zeleecious food")
                                RecentRecipeCell(recipeImage: "img-test", recipeText: "Kelewele Ghanian Recipe", recipeCreator: "zeleecious food")
                                RecentRecipeCell(recipeImage: "img-test", recipeText: "Kelewele Ghanian Recipe", recipeCreator: "zeleecious food")
                            }
                            .frame(height: 250)
                            .padding(.horizontal, 16)
                        }
                        HStack {
                            Text("Popular creators")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding(.leading)
                            Spacer()
                            Button {
                                print("All authors")
                            } label: {
                                SeeAllButton()
                            }
                        }
                        .padding(.top, 16)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(spacing: 16) {
                                AutorCell(avatar: "img-test", authorName: "Artur O Brian")
                                AutorCell(avatar: "img-test", authorName: "Artur O Brian")
                                AutorCell(avatar: "img-test", authorName: "Artur O Brian")
                                AutorCell(avatar: "img-test", authorName: "Artur O Brian")
                                AutorCell(avatar: "img-test", authorName: "Artur O Brian")
                                AutorCell(avatar: "img-test", authorName: "Artur O Brian")
                                AutorCell(avatar: "img-test", authorName: "Artur O Brian")
                            }
                            .padding(.horizontal, 16)
                            .frame(height: 160)
                        }
                    }
                    .task {
                        networkAggregateModel.searchRecipeShort(params: ["sort":"popularity"], requestTag: .trendingNow)
                        print(networkAggregateModel.shortRecipeListTrendingNow)
                    }
                }
            }
        }
    }
}

struct HomeCustomView_Previews: PreviewProvider {
    static var previews: some View {
        MainHomeView()
            .environmentObject(NetworkAggregateModel(networkService: NetworkService()))
    }
}
