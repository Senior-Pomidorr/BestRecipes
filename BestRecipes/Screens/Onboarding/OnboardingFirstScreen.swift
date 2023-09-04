//
//  OnboardingFirstScreen.swift
//  BestRecipes
//
//  Created by Vitali Martsinovich on 2023-09-04.
//

import SwiftUI

struct OnboardingFirstScreen: View {
    let mainText =
    """
    Best
    Recipe
    """
    let subText = "Find best recipes for cooking"
    let buttonText = "Get started"
    let topLabelText = "100k+ Premium recipes"
    
    var body: some View {
        ZStack(alignment: .top) {
            OnboardingBackground(imageName: "Onboarding1")
            Label {
                Text(topLabelText)
                    .font(.custom(Poppins.Regular, size: 16))
                    .foregroundColor(Color.theme.сustomWhite)
            } icon: {
                Image(systemName: "star.fill")
            }
            VStack(alignment: .center, spacing: 20) {
                Spacer()
                Text(mainText)
                    .font(.custom(Poppins.SemiBold, size: 56))
                    .foregroundColor(Color.theme.сustomWhite)
                Text(subText)
                    .foregroundColor(Color.theme.сustomWhite)
                    .font(.custom(Poppins.Regular, size: 16))
                OnboardingButton(buttonText: buttonText) {
                    getStartedTapped()
                }
            }
            .padding(.bottom, 50)
        }
    }
    
    private func getStartedTapped() {
        print("Tapped")
    }
}

struct OnboardingFirstScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingFirstScreen()
    }
}
