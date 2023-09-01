import Foundation

enum HTTPError: LocalizedError {
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case serverError
    case unknown
    
    var errorCode: Int {
        switch self {
        case .badRequest: return 400
        case .unauthorized: return 401
        case .forbidden: return 403
        case .notFound: return 404
        case .serverError: return 500
        case .unknown: return 0
        }
    }
    
    var errorDescription: String? {
        switch self {
        case .badRequest: return "Bad Request"
        case .unauthorized: return "Unauthorized"
        case .forbidden: return "Forbidden"
        case .notFound: return "Not Found"
        case .serverError: return "Internal Server Error"
        case .unknown: return "Unknown Error"
        }
    }
    
    static func error(from statusCode: Int) -> HTTPError {
        switch statusCode {
        case 400: return .badRequest
        case 401: return .unauthorized
        case 403: return .forbidden
        case 404: return .notFound
        case 500: return .serverError
        default: return .unknown
        }
    }
    
    static func map(_ error: Error) -> Self {
        switch error {
        case _ as URLError:
            return HTTPError.badRequest
            
        case _ as DecodingError:
            return HTTPError.serverError
            
        default:
            return HTTPError.badRequest
        }
    }
}
