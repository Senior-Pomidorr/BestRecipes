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
            VStack(alignment: .center, spacing: 50) {
                Spacer()
                VStack() {
                    Text(data.whiteText)
                        .font(.custom(Poppins.SemiBold, size: 40))
                        .foregroundColor(Color.theme.сustomWhite)
                    Text(data.goldText)
                        .font(.custom(Poppins.SemiBold, size: 40))
                        .foregroundColor(Color.theme.customGold)
                    Text(data.thirdLineText)
                        .font(.custom(Poppins.SemiBold, size: 40))
                        .foregroundColor(Color.theme.customGold)
                    HStack(spacing: 10) {
                                            ForEach<[OnboardingData], Int, CustomTabBarItem>(OnboardingData.list, id: \.id) { viewData in
                                                CustomTabBarItem(isSelected: viewData.id == selectedTab)
                                            }
                    }
                }
                VStack(spacing: 10) {
                    OnboardingButton(buttonText: data.buttonText) {
                        buttonTapped()
                    }
                    Button {
                        skipTapped()
                    } label: {
                        Text("Skip")
                            .font(.custom(Poppins.Medium, size: 10))
                            .foregroundColor(Color.theme.сustomWhite)
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
                                 backgroundImage: "Onboarding1", whiteText: "Recipes from all",
                                 goldText: "over the"
                                 //"""
                                 //over the
                                 //World
                                 //"""
                                 ,
                                 thirdLineText: "World"
                                 ,
                                 buttonText: "Continue"), selectedTab: .constant(2))
    }
}
