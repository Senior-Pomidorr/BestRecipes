//
//  OnboardingScreens.swift
//  BestRecipes
//
//  Created by Vitali Martsinovich on 2023-09-04.
//

import SwiftUI

struct OnboardingScreens: View {
    var data: OnboardingData
    @Binding var selectedTab: Int
    
    var body: some View {
        ZStack() {
            OnboardingBackground(imageName: data.backgroundImage)
            VStack(alignment: .center, spacing: 40) {
                Spacer()
                VStack() {
                    Text(data.firstLineWhiteText)
                        .font(.custom(Poppins.SemiBold, size: 40))
                        .foregroundColor(Color.theme.сustomWhite)
                    Text(data.secondLineGoldText)
                        .font(.custom(Poppins.SemiBold, size: 40))
                        .foregroundColor(Color.theme.customGold)
                    Text(data.thirdLineGoldText)
                        .font(.custom(Poppins.SemiBold, size: 40))
                        .foregroundColor(Color.theme.customGold)
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
                    // Conditionally show the "Skip" button
                    if selectedTab != OnboardingData.list.count - 1 {
                        Button {
                            skipTapped()
                        } label: {
                            Text("Skip")
                                .font(.custom(Poppins.Medium, size: 10))
                                .foregroundColor(Color.theme.сustomWhite)
                        }
                    } else {
                        // Add a Spacer to occupy the space if the "Skip" button is hidden
                        Spacer()
                            .frame(height: 10)
                    }
                }
            }
        }
    }
    
    private func buttonTapped() {
        print("buttonTapped")
    }
    
    private func skipTapped() {
        print("skipTapped")
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
