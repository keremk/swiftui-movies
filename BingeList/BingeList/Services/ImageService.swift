//
//  ImageService.swift
//  BingeList
//
//  Created by Kerem Karatal on 10/9/19.
//  Copyright © 2019 codingventures. All rights reserved.
//

import Combine
import SwiftUI

protocol ImageSizeable {
    func getSizeString() -> String
}

protocol ImageServicable {
    func fetchImage(path: String, size: ImageSizeable) -> AnyPublisher<UIImage?, Never>
}

enum TMDBPosterSize: String, ImageSizeable {
    case original
    case small = "w154"
    case medium = "w342"
    case large = "w780"

    func getSizeString() -> String {
        rawValue
    }
}

enum TMDBActorSize: String, ImageSizeable {
    case original
    case small = "w45"
    case medium = "w185"
    case large = "h632"

    func getSizeString() -> String {
        rawValue
    }
}

class TMDBImageService: ImageServicable {
    private let session: URLSession
    private let baseURL = "https://image.tmdb.org/t/p/"

    init(session: URLSession = .shared) {
        self.session = session
    }

    func fetchImage(path: String, size: ImageSizeable) -> AnyPublisher<UIImage?, Never> {
        let urlString = "\(baseURL)\(size.getSizeString())\(path)"
        return session.dataTaskPublisher(for: URL(string: urlString)!)
            .tryMap { (data, _) -> UIImage? in
                UIImage(data: data)
            }.catch { _ in
                Just(nil)
            }.eraseToAnyPublisher()
    }    
}
