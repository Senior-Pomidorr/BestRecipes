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
                       firstLineWhiteText: "onboardingData.recipesfromall".localized,
                       secondLineGoldText: "onboardingData.overthe".localized,
                       thirdLineGoldText: "onboardingData.world".localized,
                       buttonText: "onboardingData.continue".localized),
        OnboardingData(id: 1,
                       backgroundImage: "Onboarding2",
                       firstLineWhiteText: "onboardingData.recipeswith".localized,
                       secondLineGoldText: "onboardingData.eachandevery".localized,
                       thirdLineGoldText: "onboardingData.detail".localized,
                       buttonText: "onboardingData.continue".localized),
        OnboardingData(id: 2,
                       backgroundImage: "Onboarding3",
                       firstLineWhiteText: "onboardingData.cookitnowor".localized,
                       secondLineGoldText: "onboardingData.saveitforlater".localized,
                       thirdLineGoldText: "",
                       buttonText: "onboardingData.startCooking".localized),
    ]
}
