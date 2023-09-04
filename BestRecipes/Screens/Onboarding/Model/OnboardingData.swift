//
//  OnboardingScreensModel.swift
//  BestRecipes
//
//  Created by Vitali Martsinovich on 2023-09-04.
//

import Foundation

struct OnboardingData: Hashable, Identifiable {
    let id: Int
    let backgroundImage: String
    let whiteText: String
    let goldText: String
    let thirdLineText: String
    let buttonText: String

    static let list: [OnboardingData] = [
        OnboardingData(id: 0,
                       backgroundImage: "Onboarding1",
                       whiteText: "Recipes from all",
                       goldText: "over the"
//"""
//over the
//World
//"""
                       ,
                       thirdLineText: "World",
                       buttonText: "Continue"),
        OnboardingData(id: 1,
                       backgroundImage: "Onboarding2",
                       whiteText: "Recipes with",
                       goldText: "each and every"
//"""
//each and every
//
//"""
                       ,
                       thirdLineText: "detail",
                       buttonText: "Continue"),
        OnboardingData(id: 2,
                       backgroundImage: "Onboarding3",
                       whiteText: "Cook it now or",
                       goldText: 
"""
save it for later
""",
                       thirdLineText: "",
                       buttonText: "Start Cooking"),
    ]
}
