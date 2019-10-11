//
//  MovieService.swift
//  BingeList
//
//  Created by Kerem Karatal on 10/5/19.
//  Copyright © 2019 codingventures. All rights reserved.
//

import Combine
import Foundation

protocol MovieFetchable {
    func fetchMovies(genre: String, rating: Float) -> AnyPublisher<MoviesResponse, MovieServiceError>
//    func fetchFavorites() -> AnyPublisher<MoviesResponse, MovieServiceError>
}

protocol GenreFetchable {
    func fetchGenres() -> AnyPublisher<GenresResponse, MovieServiceError>
}

protocol MovieUpdateble {
    func addRemoveFavorites(moviesToAdd: [Movie], moviesToRemove: [Movie]) -> AnyPublisher<MoviesResponse, MovieServiceError>
}

class MovieService {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
}


extension MovieService: MovieFetchable {
    func fetchMovies(genre: String, rating: Float = 0.0) -> AnyPublisher<MoviesResponse, MovieServiceError> {
        guard let url = buildMoviesEndpoint(genre: genre, rating: rating).url else {
            return Fail(error: MovieServiceError.connectivity(description: "Unknown destination URL"))
                .eraseToAnyPublisher()
        }
        
        return session.dataTaskPublisher(for: URLRequest(url: url))
            .mapError { error in
                .connectivity(description: error.localizedDescription)
            }
            .flatMap(maxPublishers: .max(1)) { pair in
                decode(pair.data)
            }
            .eraseToAnyPublisher()
    }
    
//    func fetchFavorites() -> AnyPublisher<MoviesResponse, MovieServiceError> {
//
//    }
}

private extension MovieService {
    struct ProductionEndpoint {
        static let scheme = "http"
        static let host = "localhost"
        static let port = 4000
    }
        
    func buildMoviesEndpoint(genre: String, rating: Float, offset: Int = 0, limit: Int = 100) -> URLComponents {
        let queryItems = [
            URLQueryItem(name: "genre", value: genre),
            URLQueryItem(name: "rating", value: "\(rating)"),
            URLQueryItem(name: "offset", value: "\(offset)"),
            URLQueryItem(name: "limit", value: "\(limit)")
        ]
        
        return buildEndpoint(path: "/movies", queryItems: queryItems)
    }
    
    func buildEndpoint(path: String, queryItems: [URLQueryItem]) -> URLComponents {
        return URLComponents()
            .withScheme(scheme: ProductionEndpoint.scheme)
            .withHost(host: ProductionEndpoint.host)
            .withPort(port: ProductionEndpoint.port)
            .withPath(path: path)
            .withQueryItems(queryItems: queryItems)
    }
    
}

func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, MovieServiceError> {
  let decoder = JSONDecoder()
  decoder.dateDecodingStrategy = .secondsSince1970

  return Just(data)
    .decode(type: T.self, decoder: decoder)
    .mapError { error in
      .response(description: error.localizedDescription)
    }
    .eraseToAnyPublisher()
}

struct MetaData: Codable {
    let offset: Int
    let limit: Int
    let total: Int
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
        let gender: Int
        let profileImage: ProfileImage
    }
    
    struct ProfileImage: Codable {
        let fullPath: String
        let size: String
    }
    
}

struct GenreItem: Codable {
    let id: Int
    let name: String
}

struct GenresResponse: Codable {
    
}

enum MovieServiceError: Error {
    case connectivity(description: String)
    case response(description: String)
}
