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
    let firstLineWhiteText: String
    let secondLineGoldText: String
    let thirdLineGoldText: String
    let buttonText: String

    static let list: [OnboardingData] = [
        OnboardingData(id: 0,
                       backgroundImage: "Onboarding1",
                       firstLineWhiteText: "Recipes from all",
                       secondLineGoldText: "over the",
                       thirdLineGoldText: "World",
                       buttonText: "Continue"),
        OnboardingData(id: 1,
                       backgroundImage: "Onboarding2",
                       firstLineWhiteText: "Recipes with",
                       secondLineGoldText: "each and every",
                       thirdLineGoldText: "detail",
                       buttonText: "Continue"),
        OnboardingData(id: 2,
                       backgroundImage: "Onboarding3",
                       firstLineWhiteText: "Cook it now or",
                       secondLineGoldText: "save it for later",
                       thirdLineGoldText: "",
                       buttonText: "Start Cooking"),
    ]
}
