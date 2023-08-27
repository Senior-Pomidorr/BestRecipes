import Foundation

//enum CocktailEndpoint {
//    case getAllCoctails(token: String?, page: Int?, limit: Int?, ordering: String?, author: Int?, strengths: [String]?, tastes: [String]?, complexities: [String]?, formats: [String]?, ingredients: [String]?, isFavorited: Int?, name: String?, imgFormat: String?, imgSize: String?)
//}

enum CocktailEndpoint {
    case getAllCoctails([String : Any]?)
}

extension CocktailEndpoint: Endpoint {
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
        case .getAllCoctails:
            return "/api/cocktails/"
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .getAllCoctails(let params):
            return params
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .getAllCoctails:
            return .get
        }
    }
    
    var header: [String : String]? {
        switch self {
        case .getAllCoctails:
            var headers = [String: String]()
            let token = Constants.fakeToken
            if !token.isEmpty {
                headers["Authorization"] = "Bearer \(token)"
            }
            return headers
        }
    }
    
    var body: [String : Any]? {
        switch self {
        case .getAllCoctails:
            return nil
        }
    }
    
    
}
