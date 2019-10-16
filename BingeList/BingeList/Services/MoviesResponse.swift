//
//  MoviesResponse.swift
//  BingeList
//
//  Created by Kerem Karatal on 10/15/19.
//  Copyright © 2019 codingventures. All rights reserved.
//

import Foundation

struct MetaData: Codable {
    let offset: Int
    let limit: Int
    let total: Int
}

enum Gender: Int, Codable {
    case unspecified = 0
    case female = 1
    case male = 2
    
    func genderString() -> String {
        switch self {
        case .female:
            return "Female"
        case .male:
            return "Male"
        case .unspecified:
            return "Unspecified"
        }
    }
}

struct MoviesResponse: Codable {
    let metadata: MetaData
    let data: [MovieItem]

    struct MovieItem: Codable {
        let id: Int
        let title: String
        let tagline: String
        let overview: String
        let popularity: Double
        let rating: Double
        let ratingCount: Int
        let releaseDate: String
        let runtime: Int
        let revenue: Double
        let budget: Double
        let posterPath: String
        let originalLanguage: String
        let genres: [GenreItem]
        let cast: [CastItem]
    }
    
    struct CastItem: Codable {
        let id: Int
        let name: String
        let character: String
        let gender: Gender
        let profilePath: String
    }
}

struct GenreItem: Codable {
    let id: Int
    let name: String
}
