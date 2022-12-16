//
//  MemesResponse.swift
//  masterofmemes
//
//  Created by Marcus Ziadé on 16.12.2022.
//

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
