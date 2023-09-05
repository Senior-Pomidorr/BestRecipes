//
//  OnboardingView.swift
//  BestRecipes
//
//  Created by Vitali Martsinovich on 2023-09-04.
//

import SwiftUI

struct OnboardingTabView: View {
    @State private var currentTab = 0
    
    var body: some View {
        ZStack {
            TabView(selection: $currentTab) {
                    ForEach(OnboardingData.list) { viewData in
                        OnboardingScreens(data: viewData, selectedTab: $currentTab)
                            .tag(viewData.id)
                    }
                }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingTabView()
    }
}
