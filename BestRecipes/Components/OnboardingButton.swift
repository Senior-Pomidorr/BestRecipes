//
//  OnboardingButton.swift
//  BestRecipes
//
//  Created by Vitali Martsinovich on 2023-09-04.
//

import SwiftUI

struct OnboardingButton: View {
    var buttonText: String
    var buttonAction: () -> Void
    
    var body: some View {
            Button {
                buttonAction()
            } label: {
                Text(buttonText)
                    .foregroundColor(Color.theme.сustomWhite)
                    .font(.custom(Poppins.Medium, size: 20))
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal, 50)
            .padding(.vertical, 5)
            .background(Color.theme.customPink)
            .cornerRadius(50)
        }
}

struct OnboardingButton_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingButton(buttonText: "Continue", buttonAction: {
            print("tapped")
        }
        )
    }
}
