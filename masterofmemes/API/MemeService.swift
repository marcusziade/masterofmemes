import Foundation

/// https://api.imgflip.com
final class MemeService {
    
    var components: URLComponents = {
        var c = URLComponents()
        c.scheme = "https"
        c.host = "api.imgflip.com"
        return c
    }()
    
    func request<T: Codable>(with url: URL?) async throws -> T {
        guard let url = url else {
            throw HTTPError.url
        }
        
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 30)
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw HTTPError.response
        }
        
        switch httpResponse.statusCode {
            
        case 200...299:
            do {
                return try jsonDecoder.decode(T.self, from: data)
            } catch {
                throw error
            }
            
        case 400: throw HTTPError.retry
        case 403: throw HTTPError.unauthorized
        case 404: throw HTTPError.response
        case 405: throw HTTPError.external
        case 410: throw HTTPError.platform
        case 429: throw HTTPError.rateLimit
        case 500: throw HTTPError.server
        default: throw HTTPError.unknown
        }
    }
    
    func getMockData<T: Codable>(forFileName fileName: String, filetype: String) throws -> T {
        guard let path = Bundle.main.path(forResource: fileName, ofType: filetype) else {
            throw MockError.path
        }
        
        let url = URL(fileURLWithPath: path)
        let data: Data
        do {
            data = try Data(contentsOf: url)
        } catch {
            throw MockError.data
        }
        
        do {
            return try jsonDecoder.decode(T.self, from: data)
        } catch {
            throw MockError.decode
        }
    }
    
    // MARK: Private
    
    private let jsonDecoder: JSONDecoder = {
        let d = JSONDecoder()
        return d
    }()
}


