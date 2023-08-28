import Foundation

extension URLResponse {
    func isValid() -> Bool {
        if let httpResponse = self as? HTTPURLResponse {
            return 200..<300 ~= httpResponse.statusCode
        }
        return false
    }
}
