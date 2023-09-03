//
//  CategoryMenu.swift
//  BestRecipes
//
//  Created by Artem on 03.09.2023.
//

import SwiftUI

struct CategoryMenu: View {
    @State var categoryIndex = 0
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12){
                    ForEach(0..<categories.count, id: \.self){data in
                        Categories(recipeIndex: data, selectedIndex: $categoryIndex)
                    }
                }
                .padding(.horizontal, 8)
            }
        }
    }
}

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

struct CategoryMenu_Previews: PreviewProvider {
    static var previews: some View {
        CategoryMenu()
    }
}
