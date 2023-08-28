import Foundation

struct Constants {
    static let baseURL = "api.spoonacular.com"
    static let apiToken = "57e9889fdeb44db88a3ceadbbcb6fdcb"
}

enum RequestTag {
    case trendingNow
    case popularCategory
    case general
}
