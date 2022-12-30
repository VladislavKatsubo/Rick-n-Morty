//
//  RMCharacterViewController.swift
//  Rick&Morty
//
//  Created by Vlad Katsubo on 25.12.22.
//

import UIKit

/// Controller to show and search for characters
final class RMCharacterViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        
        let request = RMRequest(
            endpoint: .character,
            queryParameters: [
                URLQueryItem(name: "name", value: "rick"),
                URLQueryItem(name: "status", value: "alive")
            ]
        )
        print(request.url)
        
//        RMService.shared.execute(<#T##RMRequest#>, expecting: <#T##T#>, completion: <#T##(Result<T, Error>) -> Void#>)
}


}
