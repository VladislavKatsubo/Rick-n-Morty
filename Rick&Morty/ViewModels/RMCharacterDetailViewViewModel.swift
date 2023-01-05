//
//  RMCharacterDetailViewViewModel.swift
//  Rick&Morty
//
//  Created by Vlad Katsubo on 2.01.23.
//

import Foundation

final class RMCharacterDetailViewViewModel {
    private let character: RMCharacter
    
    enum SectionType: CaseIterable {
        case photo
        case information
        case episodes
    }
    
    public let sections = SectionType.allCases
    
    //MARK: - Init
    
    init(character: RMCharacter) {
        self.character = character
    }
    
    public var requestURL: URL? {
        URL(string: character.url)
    }
    
    public var title: String {
        character.name.uppercased()
    }

}
