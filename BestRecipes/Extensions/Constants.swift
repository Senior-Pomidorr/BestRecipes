import Foundation

struct Constants {
    static let baseURL = "api.spoonacular.com"
//    static let apiToken = "961884e4a54a440693fc978235b835e2"
    static let apiToken = "76526b37e31c4ea79c669c63e86fab98"
    //static let apiToken = "ec166d4297494de6980de93119696ed9"
    //static let apiToken = "961884e4a54a440693fc978235b835e2"
}

enum RequestTag {
    case trendingNow
    case popularCategory
    case general
}
