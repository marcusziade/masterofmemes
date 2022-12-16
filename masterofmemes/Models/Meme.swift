//
//  Meme.swift
//  masterofmemes
//
//  Created by Marcus Ziadé on 16.12.2022.
//

import Foundation

struct Meme: Codable, Identifiable {
    let id: String
    let name: String
    let url: URL
    let width: Int
    let height: Int
    let boxCount: Int?
    let captions: Int
}
