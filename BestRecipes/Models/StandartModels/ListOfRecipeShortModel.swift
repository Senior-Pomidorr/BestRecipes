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
    let rating: Double?
    
    init(id: Int?, title: String?, image: String?, imageType: ImageType?, rating: Double?) {
        self.id = id
        self.title = title
        self.image = image
        self.imageType = imageType
        self.rating = (Double.random(in: 3.5...5.0)*100).rounded()/100
    }
}

enum ImageType: String, Codable {
    case jpg = "jpg"
}
