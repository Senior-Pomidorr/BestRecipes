//
//  ContentView.swift
//  BestRecipes
//
//  Created by Лилия Феодотова on 27.08.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {
            HomeView()
                .tabItem {
                    Image("home")
                }
            SavedRecipesView()
                .tabItem {
                    Image("save")
                }
            AddRecipeView()
                .tabItem {
                    Image("add")
                }
            Text("CallView")
                .tabItem {
                    Image("call")
                }
            TrendingNowView()
                .tabItem {
                    Image("user")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
