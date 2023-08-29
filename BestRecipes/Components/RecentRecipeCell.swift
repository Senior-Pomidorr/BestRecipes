//
//  RecentRecipeCell.swift
//  BestRecipes
//
//  Created by Artem on 29.08.2023.
//

import SwiftUI

struct RecentRecipeCell: View {
    
    let recipeImage, recipeText, recipeCreator: String
 
    var body: some View {
        VStack(spacing: 0) {
            
            Image(recipeImage)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 15))
            
            Text(recipeText)
                .font(.title2)
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
                .frame(width: 170, height: 70)
            
            Text("By \(recipeCreator)")
                .font(.caption)
                .foregroundColor(Color.theme.customGray)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 8)
        }
    }
    
    struct RecentRecipeCell_Previews: PreviewProvider {
        static var previews: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    
                    RecentRecipeCell(recipeImage: "img-test", recipeText: "Kelewele Ghanian Recipe", recipeCreator: "Zeleecious food")
                    RecentRecipeCell(recipeImage: "img-test", recipeText: "Kelewele Ghanian Recipe", recipeCreator: "zeleecious food")
                    RecentRecipeCell(recipeImage: "img-test", recipeText: "Kelewele Ghanian Recipe", recipeCreator: "zeleecious food")
                    RecentRecipeCell(recipeImage: "img-test", recipeText: "Kelewele Ghanian Recipe", recipeCreator: "zeleecious food")
                    
                }
                .frame(height: 250)
            }
        }
    }
}
