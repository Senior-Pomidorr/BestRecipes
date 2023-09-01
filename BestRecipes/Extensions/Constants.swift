import Foundation

struct Constants {
    static let baseURL = "api.spoonacular.com"
    static let apiToken = "961884e4a54a440693fc978235b835e2"
    //static let apiToken = "8c612b11d5b74a1b908fd6d65a886e50"
    //static let apiToken = "ec166d4297494de6980de93119696ed9"
    //static let apiToken = "961884e4a54a440693fc978235b835e2"
}

enum RequestTag {
    case trendingNow
    case popularCategory
    case general
}
