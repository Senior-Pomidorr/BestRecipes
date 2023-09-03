//
//  MainHomeView.swift
//  BestRecipes
//
//  Created by Artem on 29.08.2023.
//

import SwiftUI

struct MainHomeView: View {
    
    @State var searchFieldText: String = ""
    
    var body: some View {
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
                    Button {
                        print("All tranding items")
                    } label: {
                        SeeAllButton()
                    }
                }
                
                LazyVStack(alignment: .leading) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 18) {
                            BookmarksCell(title: "How to sharwama at home",
                                          subtitle: "Subtitle",
                                          image: "receptes",
                                          autorImage: "author",
                                          autorName: "Zeelicious foods",
                                          scoreNumber: 5.0)
                            BookmarksCell(title: "How to sharwama at home",
                                          subtitle: "Subtitle",
                                          image: "receptes",
                                          autorImage: "author",
                                          autorName: "Zeelicious foods",
                                          scoreNumber: 5.0)
                            
                        }
                        .padding(.horizontal,16)
                        .frame(height: 320)
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
            }
        }
    }
}

struct HomeCustomView_Previews: PreviewProvider {
    static var previews: some View {
        MainHomeView()
    }
}
