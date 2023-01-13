//
//  RMCharacterEpisodeCollectionViewCellViewModel.swift
//  Rick&Morty
//
//  Created by Vlad Katsubo on 8.01.23.
//

import Foundation

protocol RMEpisodeDataRender {
    var air_date: String { get }
    var name: String { get }
    var episode: String { get }
}

final class RMCharacterEpisodeCollectionViewCellViewModel {
    private let episodeDataURL: URL?
    private var isFetching = false
    private var dataBlock: ((RMEpisodeDataRender) -> Void)?
    
    private var episode: RMEpisode? {
        didSet {
            guard let model = episode else {
                return
            }
            dataBlock?(model)
        }
    }
    
    init(episodeDataURL: URL?) {
        self.episodeDataURL = episodeDataURL
    }
    
    // MARK: - Public
    
    public func registerForData(_ block: @escaping (RMEpisodeDataRender) -> Void) {
        self.dataBlock = block
    }
    
    public func fetchEpisode() {
        guard !isFetching else {
            if let model = episode {
                dataBlock?(model)
            }
            return
        }
        guard let url = episodeDataURL,
              let rmRequest = RMRequest(url: url) else {
            return
        }
        isFetching = true
        
        RMService.shared.execute(rmRequest, expecting: RMEpisode.self) { [weak self] result in
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    self?.episode = model
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
