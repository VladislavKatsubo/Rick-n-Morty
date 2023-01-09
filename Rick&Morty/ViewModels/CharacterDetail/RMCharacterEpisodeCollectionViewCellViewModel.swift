//
//  RMCharacterEpisodeCollectionViewCellViewModel.swift
//  Rick&Morty
//
//  Created by Vlad Katsubo on 8.01.23.
//

import Foundation

final class RMCharacterEpisodeCollectionViewCellViewModel {
    let episodeDataURL: URL?
    init(episodeDataURL: URL?) {
        self.episodeDataURL = episodeDataURL
    }
}
