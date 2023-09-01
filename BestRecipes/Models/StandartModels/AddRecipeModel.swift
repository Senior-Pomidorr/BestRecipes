//
//  AddRecipeModel.swift
//  BestRecipes
//
//  Created by Daniil Kulikovskiy on 31.08.2023.
//

import Foundation


struct Ingredient: Identifiable {
    var id = UUID()
    var itemName = ""
    var quantity = ""
}
