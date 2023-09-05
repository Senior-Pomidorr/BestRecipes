//
//  Categories.swift
//  BestRecipes
//
//  Created by Artem on 03.09.2023.
//

import SwiftUI

struct Categories: View {
    var recipeIndex: Int
    @Binding var selectedIndex: Int
    var body: some View{

            VStack(spacing: 0){
                Text(categories[recipeIndex])
                    .font(selectedIndex == recipeIndex ?
                        .custom(Poppins.SemiBold, size: 14) : .custom(Poppins.Medium, size: 14))
                    .foregroundColor(selectedIndex == recipeIndex ? Color.theme.сustomWhite : Color.theme.customPink.opacity(0.6))
                    .padding(.vertical,8)
                    .padding(.horizontal, 12)
                    .background {
                        RoundedRectangle(cornerRadius: 12).foregroundColor(Color.theme.customPink).opacity(selectedIndex == recipeIndex ? 1 : 0)
                    }
            }.onTapGesture {
                withAnimation {
                    selectedIndex = recipeIndex
                }
            }
        }
    }
