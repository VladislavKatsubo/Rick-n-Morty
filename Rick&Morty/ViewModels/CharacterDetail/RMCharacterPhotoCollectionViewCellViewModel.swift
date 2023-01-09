//
//  RMCharacterPhotoCollectionViewCellViewModel.swift
//  Rick&Morty
//
//  Created by Vlad Katsubo on 8.01.23.
//

import Foundation

final class RMCharacterPhotoCollectionViewCellViewModel {
    private let imageURL: URL?
    
    init(imageURL: URL?) {
        self.imageURL = imageURL
    }
    
    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
        guard let imageURL else {
            completion(.failure(URLError(.badURL)))
            return
        }
        ImageManager.shared.downloadImage(imageURL, completion: completion)
    }
}
