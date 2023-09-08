//
//  AddRecipeModel.swift
//  BestRecipes
//
//  Created by Daniil Kulikovskiy on 31.08.2023.
//

import Foundation

struct Ingredient: Identifiable, Codable, Equatable {
    var id = UUID()
    var itemName = ""
    var quantity = ""
}

struct MyRecipes: Identifiable, Codable, Equatable {
    var id = UUID()
    let title: String?
    var ingredientsCount: Int?
    var receptMinutes: Int?
    var servesCount: Int?
    var imageData: Data?
    var ingredients: [Ingredient]?
}
