//
//  AppState.swift
//  BingeList
//
//  Created by Kerem Karatal on 10/3/19.
//  Copyright © 2019 codingventures. All rights reserved.
//

import Foundation
import Combine

final class SearchResults: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var selectedMovie: Movie?
    @Published var searchTerm: String = ""

    private let movieService: MovieFetchable
    private var disposables = Set<AnyCancellable>()

    init(movieService: MovieFetchable,
         scheduler: DispatchQueue = DispatchQueue(label: "MovieService")) {
        self.movieService = movieService
        _ = $searchTerm
            .dropFirst(1)
            .debounce(for: .seconds(0.5), scheduler: scheduler)
            .sink(receiveValue: fetchMovies(genre:))
    }
    
    private func fetchMovies(genre: String) {
        movieService.fetchMovies(genre: genre, rating: 0.0)
            .map { response in
                response.data.map { movieFromMovieItem(movieItem: $0) }
            }
            .receive(on: DispatchQueue.main)
            .sink(
              receiveCompletion: { [weak self] value in
                guard let self = self else { return }
                switch value {
                case .failure:
                  self.movies = []
                case .finished:
                  break
                }
              },
              receiveValue: { [weak self] movieResults in
                guard let self = self else { return }
                self.movies = movieResults.map({ (result) -> Movie in
                    switch result {
                    case .failure(let error):
                        debugLog("Parse Error: \(error.description)")
                        return Movie()
                    case .success(let movie):
                        return movie
                    }
                })
            })
            .store(in: &disposables)
    }
    
}
