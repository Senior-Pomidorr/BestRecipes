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

struct MyRecipes: Codable, Hashable, Identifiable {
    var id = UUID()
    let title: String?
    let image: String?
    var ingredientsCount: Int?
    var receptMinutes: Int?
    var servesCount: Int?
//    var ingredients: [String]?
}
