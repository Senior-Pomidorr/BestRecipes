//
//  OnboardingScreens.swift
//  BestRecipes
//
//  Created by Vitali Martsinovich on 2023-09-04.
//

import SwiftUI

struct OnboardingScreens: View {
    
    @AppStorage("onboardingHasShown")
    var onboardingHasShown = false
    
    var data: OnboardingData
    @Binding var selectedTab: Int
    @State private var isTabbarPresented = false

    
    var body: some View {
        ZStack() {
            OnboardingBackground(imageName: data.backgroundImage)
            VStack(alignment: .center, spacing: 40) {
                Spacer()
                VStack() {
                    Text(data.firstLineWhiteText)
                        .font(.custom(Poppins.SemiBold, size: 40))
                        .foregroundColor(Color.theme.сustomWhite)
                        .multilineTextAlignment(.center)
                    Text(data.secondLineGoldText)
                        .font(.custom(Poppins.SemiBold, size: 40))
                        .foregroundColor(Color.theme.customGold)
                        .multilineTextAlignment(.center)
                    Text(data.thirdLineGoldText)
                        .font(.custom(Poppins.SemiBold, size: 40))
                        .foregroundColor(Color.theme.customGold)
                        .multilineTextAlignment(.center)
                }
                HStack(spacing: 10) {
                    ForEach<[OnboardingData], Int, CustomTabBarItem>(OnboardingData.list, id: \.id) { viewData in
                        CustomTabBarItem(isSelected: viewData.id == selectedTab)
                    }
                }
                VStack(spacing: 10) {
                    OnboardingButton(buttonText: data.buttonText) {
                        buttonTapped()
                    }
                    .fullScreenCover(isPresented: $isTabbarPresented, content: {
                                       Tabbar()
                                   })
                    // Hide the "Skip" button for the last screen
                    if selectedTab != OnboardingData.list.count - 1 {
                        Button {
                            skipTapped()
                        } label: {
                            Text("onboardingData.skip".localized)
                                .font(.custom(Poppins.Medium, size: 10))
                                .foregroundColor(Color.theme.сustomWhite)
                        }
                    } else {
                        // Spacer for occupying the space when the "Skip" button is hidden
                        Spacer()
                            .frame(height: 15)
                    }
                }
            }
        }
    }
    
    private func buttonTapped() {
        if selectedTab == OnboardingData.list.count - 1 {
            isTabbarPresented = true
            onboardingHasShown = true
        } else {
            selectedTab += 1
        }
    }
    
    private func skipTapped() {
        isTabbarPresented = true
        onboardingHasShown = true
    }
}

struct OnboardingScreens_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreens(
            data: OnboardingData(id: 0,
                                 backgroundImage: "Onboarding2",
                                 firstLineWhiteText: "Recipes from all",
                                 secondLineGoldText: "over the",
                                 thirdLineGoldText: "",
                                 buttonText: "Continue"), selectedTab: .constant(1))
    }
}
