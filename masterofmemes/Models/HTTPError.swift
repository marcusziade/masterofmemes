import Foundation

enum HTTPError: Error {
    /// Try again in a few minutes.
    case retry
    /// Unauthorized / Unknown API key.
    case unauthorized
    /// The player could not be found.
    case response
    /// External API error.
    case external
    /// Unknown platform provided.
    case platform
    /// Rate limit reached.
    case rateLimit
    /// JSONDecoding error.
    case decoding
    /// The server is likely having issues. Check Discord for status.
    /// https://discord.gg/tQpMhgDX
    case server
    /// The url is malformed.
    case url
    /// An unknown error occured.
    case unknown
    
    var caption: String {
        switch self {
        case .retry:
            return "Try again in a few minutes."
        case .unauthorized:
            return "Unauthorized / Unknown API key."
        case .response:
            return "The player could not be found."
        case .external:
            return "External API error."
        case .platform:
            return "Unknown platform provided."
        case .rateLimit:
            return "Rate limit reached."
        case .decoding:
            return "JSONDecoding error."
        case .server:
            return "The server is likely having issues. Check Discord for status.  https://discord.gg/tQpMhgDX."
        case .url:
            return "The url is malformed."
        case .unknown:
            return "An unknown error occured."
        }
    }
}


