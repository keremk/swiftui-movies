//
//  Movie.swift
//  BingeListTests
//
//  Created by Kerem Karatal on 10/7/19.
//  Copyright © 2019 codingventures. All rights reserved.
//

import XCTest


class MovieTests: XCTestCase {
    let movieItem = MoviesResponse.MovieItem(
         id: 1000,
         title: "Star Wars",
         tagline: "The force is with us",
         overview: "A long time ago in a galaxy far away...",
         popularity: 9.56,
         rating: 8.9,
         ratingCount: 1000,
         releaseDate: "1976-05-01",
         runtime: 156,
         revenue: 1800000000.0,
         budget: 10000000.0,
         posterPath: "/p2SdfGmQRaw8xhFbexlHL7srMM8.jpg",
         originalLanguage: "de",
         genres: [
             GenreItem(id: 28, name: "Action"),
             GenreItem(id: 878, name: "Science Fiction")
         ],
         cast: [
             MoviesResponse.CastItem(id: 227454, name: "Alicia Vikander", character: "Ava", gender: 1, profileImage: MoviesResponse.ProfileImage(fullPath: "https://image.tmdb.org/t/p/w185/4zrfXLhi4MbGQWUJQJcQroHbCS5.jpg", size: "w185"))
         ])

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testMovieBuilder() {
        let movieResult = movieFromMovieItem(movieItem: movieItem)
        let movie = try! movieResult.get()
        
        XCTAssertEqual(movie.title, movieItem.title, "Titles are same")
        XCTAssertEqual(movie.tagline, movieItem.tagline, "Taglines are same")
        XCTAssertEqual(movie.releaseYear, 1976, "Release year is correct")
        XCTAssertEqual(movie.posterPath, URL(string: "https://image.tmdb.org/t/p/w154/p2SdfGmQRaw8xhFbexlHL7srMM8.jpg")!, "Poster path is correct")
        XCTAssertEqual(movie.originalLanguage, "German", "Original language is user readable")
    }
    
    func testMovieBuilderWithErrors() {
                    
        
    }
}
