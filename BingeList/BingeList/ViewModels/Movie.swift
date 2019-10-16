//
//  Movie.swift
//  BingeList
//
//  Created by Kerem Karatal on 10/1/19.
//  Copyright © 2019 codingventures. All rights reserved.
//

import Foundation

struct Movie: Hashable, Codable, Identifiable {
    var id: Int = 0
    var title: String = ""
    var tagline: String = ""
    var releaseYear: String = "1900"
    var originalLanguage: String = "English"
    var posterPath: String = ""
    var cast: [Actor] = []

    func cloneWithReleaseYear(_ releaseYear: String) -> Movie {
        var m = self
        m.releaseYear = releaseYear
        return m
    }

    func cloneWithOriginalLanguage(_ originalLanguage: String) -> Movie {
        var m = self
        m.originalLanguage = originalLanguage
        return m
    }

}

func movieFromMovieItem(movieItem: MoviesResponse.MovieItem) -> Result<Movie, DataError> {
    return Result.success(Movie(
        id: movieItem.id,
        title: movieItem.title,
        tagline: movieItem.tagline,
        posterPath: movieItem.posterPath,
        cast: actorsFromCastItems(movieItem.cast)
    ))
        .flatMap { movie in releaseYearFromDate(movieItem.releaseDate)
            .map { movie.cloneWithReleaseYear($0) }
        }
        .flatMap { movie in originalLanguage(movieItem.originalLanguage)
            .map { movie.cloneWithOriginalLanguage($0) }
        }
}

func releaseYearFromDate(_ releaseDate: String) -> Result<String, DataError> {
    let comps = releaseDate.split(separator: "-")
    guard comps.count == 3 else {
        return .failure(DataError(kind: .invalidDate,
                                  description: "Release date \(releaseDate) should have 3 components, separated by `-`"))
    }
    guard comps[0].count == 4 else {
        return .failure(DataError(kind: .invalidDate,
                                  description: "Release year in \(releaseDate) needs to be 4 digits"))
    }
    guard let year = Int(comps[0]) else {
        return .failure(DataError(kind: .invalidDate,
                                  description: "Year in \(releaseDate) is not an integer"))
    }

    return .success("\(year)")
}

func originalLanguage(_ originalLanguage: String) -> Result<String, DataError> {
    switch originalLanguage {
    case "en":
        return .success("English")
    case "de":
        return .success("German")
    case "es":
        return .success("Spanish")
    case "fr":
        return .success("French")
    case "tr":
        return .success("Turkish")
    case "ja":
        return .success("Japanese")
    default:
        return .failure(DataError(kind: .invalidLanguage,
                                  description: "Unknown language provided - \(originalLanguage)"))
    }
}
