//
//  BookmarkRModel.swift
//  BestRecipes
//
//  Created by Daniil Kulikovskiy on 02.09.2023.
//

import Foundation

struct BookmarkRecipe: Codable {
    var id: Int?
    let title: String
    let image: String
    var isBookmarked: Bool
}
