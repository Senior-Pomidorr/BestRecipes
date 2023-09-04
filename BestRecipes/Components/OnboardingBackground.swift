//
//  OnboardingBackground.swift
//  BestRecipes
//
//  Created by Vitali Martsinovich on 2023-09-04.
//

import SwiftUI

struct OnboardingBackground: View {
    let imageName: String

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .background(
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                )
            LinearGradient(
                gradient: Gradient(colors: [.clear, .black]),
                startPoint: .top,
                endPoint: .bottom
            )
        }
        .edgesIgnoringSafeArea(.all)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct OnboardingBackground_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingBackground(imageName: "OnboardingMain")
    }
}
