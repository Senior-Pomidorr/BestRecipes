import Foundation
import Combine

class NetworkService {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    private func getData(_ data: Data, _ response: URLResponse) throws -> Data {
        guard response.isValid() else {
            let httpError = HTTPError.error(from: (response as? HTTPURLResponse)?.statusCode ?? 0)
            throw httpError
        }
        return data
    }
    
    func request<T: Decodable>(_ endpoint: Endpoint) -> AnyPublisher<T, HTTPError> {
        
        guard let request = createURLRequest(from: endpoint) else {
            return Fail(error: HTTPError.badRequest)
                .eraseToAnyPublisher()
        }
        
        return session.dataTaskPublisher(for: request)
            .tryMap(getData)
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError(HTTPError.map(_:))
            .eraseToAnyPublisher()
    }
    
    private func createURLRequest(from endpoint: Endpoint) -> URLRequest? {
        var components = URLComponents()
        
        components.scheme = endpoint.scheme
        components.host = endpoint.host
        components.path = endpoint.path
        
        components.queryItems = createQueryParameters(from: endpoint)
        
        var request = URLRequest(url: components.url!)
        
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.header
        if let body = endpoint.body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }
        print("request.url ", request.url ?? "")
        return request
    }
    
    private func createQueryParameters(from endpoint: Endpoint) -> [URLQueryItem] {
        var queryItems = [URLQueryItem]()
        
        guard let parameters = endpoint.parameters else {
            return []
        }
        
        print("параметры запроса", parameters)
        
        for (key, value) in parameters {
            print("ключ", key, "значение",  value)
            
            if let stringValue = value as? String {
                if !stringValue.isEmpty {
                    queryItems.append(URLQueryItem(name: key, value: stringValue))
                }
                
            } else if let intValue = value as? Int {
                queryItems.append(URLQueryItem(name: key, value: String(intValue)))
                
            } else if let stringArrayValue = value as? [String] {
                stringArrayValue.forEach {
                    if !$0.isEmpty {
                        queryItems.append(URLQueryItem(name: key, value: $0))
                    }
                }
            } else {
                continue
            }
        }
        return queryItems
    }
}

extension URLResponse {
    func isValid() -> Bool {
        if let httpResponse = self as? HTTPURLResponse {
            return 200..<300 ~= httpResponse.statusCode
        }
        return false
    }
}
