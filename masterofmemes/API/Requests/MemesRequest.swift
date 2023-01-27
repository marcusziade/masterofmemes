import Foundation

extension MemeService {
    
    func memes() async throws -> [Meme] {
        do {
#if targetEnvironment(simulator)
            let memes: MemesResponse = memesResponseMock
#else
            let memes: MemesResponse = try await request(with: allMemesURL)
#endif
            return memes.memes
        } catch {
            throw error
        }
    }
    
    /// To obtain a list of memes
    private var allMemesURL: URL? {
        components.path = "/get_memes"
        return components.url
    }
    
    var memesResponseMock: MemesResponse {
        let memes: MemesResponse = try! getMockData(forFileName: "memesResponseMock", filetype: "json")
        return memes
    }
}


