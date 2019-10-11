//
//  ImageLoader.swift
//  BingeList
//
//  Created by Kerem Karatal on 10/9/19.
//  Copyright © 2019 codingventures. All rights reserved.
//

import Combine
import Foundation
import SwiftUI

final class ImageLoader: ObservableObject {
    let path: String
    let size: ImageSizeable
    let imageService: ImageServicable
    var cancellable: AnyCancellable?
    
    var objectWillChange: AnyPublisher<UIImage?, Never> = Empty().eraseToAnyPublisher()
    @Published var image: UIImage? = nil

    init(path: String, size: ImageSizeable, imageService: ImageServicable = TMDBImageService()) {
        self.path = path
        self.size = size
        self.imageService = imageService

        self.objectWillChange = $image.handleEvents(receiveSubscription: { [weak self] _ in
            guard let self = self else { return }
            self.fetchImage()
        },
        receiveCancel: { [weak self] in
            guard let self = self else { return }
            self.cancellable?.cancel()
        }).eraseToAnyPublisher()
    }

    func fetchImage() {
        cancellable = imageService.fetchImage(path: path, size: size)
            .receive(on: DispatchQueue.main)
            .assign(to: \ImageLoader.image, on: self)
    }
    
    deinit {
        cancellable?.cancel()
    }
}
