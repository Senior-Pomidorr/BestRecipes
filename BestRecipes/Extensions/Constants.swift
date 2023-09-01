import Foundation

struct Constants {
    static let baseURL = "api.spoonacular.com"
    static let apiToken = "8c612b11d5b74a1b908fd6d65a886e50"
}

enum RequestTag {
    case trendingNow
    case popularCategory
    case general
}
