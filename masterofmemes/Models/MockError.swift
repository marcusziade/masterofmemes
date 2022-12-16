//
//  MockError.swift
//  masterofmemes
//
//  Created by Marcus Ziadé on 16.12.2022.
//

import Foundation

enum MockError: Error {
    case path, data, decode
    
    var description: String {
        switch self {
        case .path:
            return "Path not found"
        case .data:
            return "Failed to create data from URL"
        case .decode:
            return "Failed to decode mock data"
        }
    }
}
