import Foundation

// MARK: - RecipeFull
struct RecipeFull: Codable {
    let vegetarian, vegan, glutenFree, dairyFree: Bool?
    let veryHealthy, cheap, veryPopular, sustainable: Bool?
    let lowFodmap: Bool?
    let weightWatcherSmartPoints: Int?
    let gaps: String?
    let preparationMinutes, cookingMinutes, aggregateLikes, healthScore: Int?
    let creditsText, sourceName: String?
    let pricePerServing: Double?
    let extendedIngredients: [ExtendedIngredient]?
    let id: Int?
    let title: String?
    let readyInMinutes, servings: Int?
    let sourceURL: String?
    let image: String?
    let imageType, summary: String?
    let cuisines, dishTypes, diets, occasions: [String]?
    let winePairing: WinePairing?
    let instructions: String?
    let analyzedInstructions: [AnalyzedInstruction]?
    let spoonacularSourceURL: String?

    enum CodingKeys: String, CodingKey {
        case vegetarian, vegan, glutenFree, dairyFree, veryHealthy, cheap, veryPopular, sustainable, lowFodmap, weightWatcherSmartPoints, gaps, preparationMinutes, cookingMinutes, aggregateLikes, healthScore, creditsText, sourceName, pricePerServing, extendedIngredients, id, title, readyInMinutes, servings
        case sourceURL = "sourceUrl"
        case image, imageType, summary, cuisines, dishTypes, diets, occasions, winePairing, instructions, analyzedInstructions
        case spoonacularSourceURL = "spoonacularSourceUrl"
    }
}

// MARK: - AnalyzedInstruction
struct AnalyzedInstruction: Codable {
    let name: String?
    let steps: [Step]?
}

// MARK: - Step
struct Step: Codable {
    let number: Int?
    let step: String?
    let ingredients, equipment: [Ent]?
    let length: Length?
}

// MARK: - Ent
struct Ent: Codable {
    let id: Int?
    let name, localizedName, image: String?
    let temperature: Length?
}

// MARK: - Length
struct Length: Codable {
    let number: Int?
    let unit: String?
}

// MARK: - ExtendedIngredient
struct ExtendedIngredient: Codable {
    let id: Int?
    let aisle, image: String?
    let consistency: Consistency?
    let name, nameClean, original, originalName: String?
    let amount: Double?
    let unit: String?
    let meta: [String]?
    let measures: Measures?
}

enum Consistency: String, Codable {
    case liquid = "LIQUID"
    case solid = "SOLID"
}

// MARK: - Measures
struct Measures: Codable {
    let us, metric: Metric?
}

// MARK: - Metric
struct Metric: Codable {
    let amount: Double?
    let unitShort, unitLong: String?
}

// MARK: - WinePairing
struct WinePairing: Codable {
    let pairedWines: [String]?
    let pairingText: String?
    let productMatches: [ProductMatch]?
}

// MARK: - ProductMatch
struct ProductMatch: Codable {
    let id: Int?
    let title, description, price: String?
    let imageURL: String?
    let averageRating: Double?
    let ratingCount: Int?
    let score: Double?
    let link: String?

    enum CodingKeys: String, CodingKey {
        case id, title, description, price
        case imageURL = "imageUrl"
        case averageRating, ratingCount, score, link
    }
}
