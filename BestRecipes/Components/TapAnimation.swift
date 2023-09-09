//
//  TapAnimation.swift
//  BestRecipes
//
//  Created by Daniil Kulikovskiy on 09.09.2023.
//

import SwiftUI

struct TapAnimation: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.85 : 1.0)
    }
}

