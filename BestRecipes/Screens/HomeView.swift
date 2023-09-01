//
//  HomeView.swift
//  BestRecipes
//
//  Created by Лилия Феодотова on 27.08.2023.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var tabbarRouter: TabbarRouter
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Home View")
                NavigationLink {
                    DetailRecipeView(recipeID: "716300")
                } label: {
                    Text("Recipe detail")
                }
                .buttonStyle(.bordered)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
