import Foundation

// MARK: - ListOfRecipeShort
struct ListOfRecipeShort: Codable {
    let results: [RecipeShort]?
    let offset, number, totalResults: Int?
}

// MARK: - Result
struct RecipeShort: Codable, Hashable, Identifiable {
    let id: Int?
    let title: String?
    let image: String?
    let imageType: ImageType?
}

enum ImageType: String, Codable {
    case jpg = "jpg"
}
