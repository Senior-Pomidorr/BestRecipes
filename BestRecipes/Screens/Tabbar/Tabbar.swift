//
//  Tabbar.swift
//  BestRecipes
//
//  Created by Alexandr Rodionov on 27.08.23.
//

import SwiftUI

struct Tabbar: View {
    
    @StateObject var tabbarRouter = TabbarRouter()
    @State var isShowPopUp = false
    
    @ViewBuilder
    var contentView: some View {
        switch tabbarRouter.currentPage {
        case .home:
            HomeView()
                .environmentObject(tabbarRouter)
        case .favourites:
            SavedRecipesView()
                .environmentObject(tabbarRouter)
        case .news:
           TrendingNowView()
                .environmentObject(tabbarRouter)
        case .profile:
            ProfileView()
                .environmentObject(tabbarRouter)
        case .add:
            AddRecipeView()
                .environmentObject(tabbarRouter)
        }
    }
    
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                // Content View
                contentView
               // Text("Home")
                Spacer()
                // Tabbar
                HStack {
                    //Tabbar items
                    TabItem(width: geometry.size.width / 5, height: geometry.size.height / 28, systemIconName: "house", tabName: "Home", tabbarRouter: tabbarRouter, assignedPage: .home)
                    TabItem(width: geometry.size.width / 5, height: geometry.size.height / 28, systemIconName: "heart", tabName: "Favourites", tabbarRouter: tabbarRouter, assignedPage: .favourites)
                    TabPlusButton(width: geometry.size.width / 7, height: geometry.size.width / 7, systemIconName: "plus", tabName: "Add", acttion: showPopUp)
                        .offset(y: -geometry.size.height / 8/2)
                    TabItem(width: geometry.size.width / 5, height: geometry.size.height / 28, systemIconName: "bell", tabName: "News", tabbarRouter: tabbarRouter, assignedPage: .news)
                    TabItem(width: geometry.size.width / 5, height: geometry.size.height / 28, systemIconName: "person", tabName: "Profile", tabbarRouter: tabbarRouter, assignedPage: .profile)
                    
                }
                .frame(width: geometry.size.width, height: geometry.size.height / 8)
                .background(Color.theme.сustomWhite)
                .shadow(radius: 2)
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .sheet(isPresented: $isShowPopUp) {
            
        } content: {
            AddRecipeView()
        }


    }
    
    func showPopUp() {
        isShowPopUp = true
    }
}

struct Tabbar_Previews: PreviewProvider {
    static var previews: some View {
        Tabbar()
    }
}
