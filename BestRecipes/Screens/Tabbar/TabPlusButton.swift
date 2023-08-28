//
//  TabPlusButton.swift
//  BestRecipes
//
//  Created by Alexandr Rodionov on 27.08.23.
//

import SwiftUI

struct TabPlusButton: View {
    
    let width, height: CGFloat
    let systemIconName, tabName: String
    
    var acttion: () -> Void
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color.theme.customPink)
                .frame(width: width, height: height)
                .shadow(radius: 4)
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width / 2, height: height / 2)
                .foregroundColor(Color.theme.customBlack)
        }
        .onTapGesture {
            acttion()
        }
        .padding(.horizontal, -4)
    }
}
