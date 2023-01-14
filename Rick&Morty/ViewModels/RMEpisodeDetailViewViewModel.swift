//
//  RMEpisodeDetailViewViewModel.swift
//  Rick&Morty
//
//  Created by Vlad Katsubo on 14.01.23.
//

import UIKit

class RMEpisodeDetailViewViewModel {
    private let endpointUrl: URL?
    
    init(endpointUrl: URL?) {
        self.endpointUrl = endpointUrl
        fetchEpisodeData()
    }
    
    private func fetchEpisodeData() {
        guard let endpointUrl, let request = RMRequest(url: endpointUrl) else {
            return
        }
        RMService.shared.execute(request,
                                 expecting: RMEpisode.self) { result in
            switch result {
            case .success(let success):
                print(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    
}
