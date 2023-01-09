//
//  RMCharacterInfoCollectionViewCellViewModel.swift
//  Rick&Morty
//
//  Created by Vlad Katsubo on 8.01.23.
//

import Foundation

final class RMCharacterInfoCollectionViewCellViewModel {
    private let value: String
    private let title: String
    init(
        value: String,
        title: String
    ) {
        self.value = value
        self.title = title
    }
}
