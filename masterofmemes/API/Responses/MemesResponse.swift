import Foundation

struct MemesResponse: Codable {
    let success: Bool
    let data: DataClass
    
    var memes: [Meme] {
        data.memes
    }
}

struct DataClass: Codable {
    let memes: [Meme]
}


