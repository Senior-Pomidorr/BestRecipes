//
//  OnboardingFirstScreen.swift
//  BestRecipes
//
//  Created by Vitali Martsinovich on 2023-09-04.
//

import SwiftUI

struct OnboardingMain: View {
    @State private var isOnboardingPresented = false
    
    let firstLineText = "onboardingMain.best".localized
    let secondLineText = "onboardingMain.recipe".localized
    let secondaryText = "onboardingMain.findbestrecipesforcooking".localized
    let buttonText = "onboardingMain.getstarted".localized
    let topLabelText = "onboardingMain.100k+Premium recipes".localized
    
    var body: some View {
        ZStack(alignment: .top) {
            OnboardingBackground(imageName: "OnboardingMain")
            Label {
                Text(topLabelText)
                    .font(.custom(Poppins.Regular, size: 16))
                    .foregroundColor(Color.theme.сustomWhite)
            } icon: {
                Image(systemName: "star.fill")
            }
            VStack(alignment: .center, spacing: 20) {
                Spacer()
                VStack {
                    Text(firstLineText)
                        .font(.custom(Poppins.SemiBold, size: 56))
                        .foregroundColor(Color.theme.сustomWhite)
                    Text(secondLineText)
                        .font(.custom(Poppins.SemiBold, size: 56))
                        .foregroundColor(Color.theme.сustomWhite)
                }
                Text(secondaryText)
                    .foregroundColor(Color.theme.сustomWhite)
                    .font(.custom(Poppins.Regular, size: 16))
                Button {
                    getStartedTapped()
                } label: {
                    Text(buttonText)
                        .font(.custom(Poppins.SemiBold, size: 16))
                        .foregroundColor(Color.theme.сustomWhite)
                }
                .padding(.horizontal, 32)
                .padding(.vertical, 16)
                .background(Color.theme.customPink)
                .cornerRadius(8)
                .fullScreenCover(isPresented: $isOnboardingPresented, content: {
                                   OnboardingTabView()
                               })
            }
            .padding(.bottom, 50)
        }
    }
    
    private func getStartedTapped() {
        isOnboardingPresented = true
    }
}

struct OnboardingFirstScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingMain()
    }
}
