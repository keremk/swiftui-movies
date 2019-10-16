//
//  Actor.swift
//  BingeList
//
//  Created by Kerem Karatal on 10/15/19.
//  Copyright © 2019 codingventures. All rights reserved.
//

import Foundation

struct Actor: Hashable, Codable, Identifiable {
    var id: Int = 0
    var name: String = ""
    var gender: Gender = Gender.unspecified
    var character: String = ""
    var profilePath: String = ""
}

func actorsFromCastItems(_ cast: [MoviesResponse.CastItem]) -> [Actor] {
    return cast.map { (castItem) -> Actor in
        return Actor(
            id: castItem.id,
            name: castItem.name,
            gender: castItem.gender,
            character: castItem.character,
            profilePath: castItem.profilePath
        )
    }
}

