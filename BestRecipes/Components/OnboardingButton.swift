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
    var textSize: CGFloat?
    var textWight: String?
    
    var body: some View {
        Button {
            buttonAction()
        } label: {
            Text(buttonText)
        }
        .tint(Color.theme.сustomWhite)
        .font(.custom(textWight ?? Poppins.SemiBold,
                      size: textSize ?? 16
                     ))
        .padding(.horizontal, 32)
        .padding(.vertical, 16)
        .background(Color.theme.customPink)
        .cornerRadius(8)
    }
}

struct OnboardingButton_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingButton(buttonText: "Get started", buttonAction: {
            print("tapped")
        }
        )
    }
}
