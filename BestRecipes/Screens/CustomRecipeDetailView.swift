//
//  CustomRecipeDetailView.swift
//  BestRecipes
//
//  Created by Vitali Martsinovich on 2023-09-08.
//

import SwiftUI

struct CustomRecipeDetailView: View {
    @Binding var recipe: MyRecipes?

    var body: some View {
        ScrollView {
            VStack {
                Text(recipe?.title ?? "Recipe Title")
                    .font(.custom(Poppins.Bold, size: 24))

                if let imageData = recipe?.imageData, let uiImage = UIImage(data: imageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFill()
                        .background(.thinMaterial)
                        .frame(width: 363, height: 220)
                        .cornerRadius(20)
                } else {
                    Image("bbq")
                        .resizable()
                        .scaledToFill()
                        .background(.thinMaterial)
                        .frame(width: 363, height: 220)
                        .cornerRadius(20)
                }

                VStack(alignment: .leading, spacing: 10) {
                    Text("Ingredients:")
                        .font(.custom(Poppins.Bold, size: 20))
                        .padding(.top, 20)

                    ForEach(recipe?.ingredients ?? [], id: \.id) { ingredient in
                        Text("\(ingredient.quantity ?? "") \(ingredient.itemName ?? "")")
                            .font(.custom(Poppins.Regular, size: 16))
                    }
                }
                .padding(.horizontal, 20)
            }
            .padding()
        }
        .navigationTitle("Recipe Details")
    }
}

struct CustomRecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleRecipe = MyRecipes(
            title: "Sample Recipe",
            ingredientsCount: 5,
            receptMinutes: 30,
            servesCount: 4,
            imageData: nil,
            ingredients: [
                Ingredient(itemName: "Ingredient 1", quantity: "2 cups"),
                Ingredient(itemName: "Ingredient 2", quantity: "1 tsp"),
            ]
        )

        return CustomRecipeDetailView(recipe: .constant(sampleRecipe))
    }
}
