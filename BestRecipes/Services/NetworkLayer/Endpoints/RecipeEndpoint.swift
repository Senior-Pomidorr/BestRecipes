import Foundation

enum RecipeEndpoint {
    case searchRecipe([String: Any]?)
    case getRecipeByID(id: String)
    case getMultipleRecipes([String: Any])
    case getRandomRecipes([String: Any]?)
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
        case .getRecipeByID(id: let id):
            return "/recipes/\(id)/information"
        case .getMultipleRecipes:
            return "/recipes/informationBulk"
        case .getRandomRecipes:
            return "/recipes/random"
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .searchRecipe(let params):
            return params
        case .getRecipeByID:
            return nil
        case .getMultipleRecipes(let params):
            return params
        case .getRandomRecipes(let params):
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
        case .getRecipeByID:
            return [
                "Content-Type": "application/json"
            ]
        case .getMultipleRecipes:
            return [
                "Content-Type": "application/json"
            ]
        case .getRandomRecipes(_):
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
