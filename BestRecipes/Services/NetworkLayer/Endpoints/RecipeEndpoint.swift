import Foundation

enum RecipeEndpoint {
    case searchRecipe([String: Any]?)
}

extension RecipeEndpoint: Endpoint {
    
    var scheme: String {
        switch self {
        default:
            return "https"
        }
    }
    
    var host: String {
        switch self {
        default:
            return Constants.baseURL
        }
    }
    
    var path: String {
        switch self {
        case .searchRecipe:
            return "/recipes/complexSearch"
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .searchRecipe(let params):
            return params
        }
    }
    
    var method: RequestMethod {
        switch self {
        default:
            return .get
        }
    }
    
    var header: [String : String]? {
        switch self {
        case .searchRecipe:
            return [
                "Content-Type": "application/json"
            ]
        }
    }
    
    var body: [String : Any]? {
        switch self {
        default:
            return nil
        }
    }
}
