//
//  ImageManager.swift
//  Rick&Morty
//
//  Created by Vlad Katsubo on 3.01.23.
//

import Foundation

final class ImageManager {
    
    static let shared = ImageManager()
    
    private init() {}
    
    private var imageDataCache = NSCache<NSString, NSData>()
    
    func downloadImage(_ url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        let key = url.absoluteString as NSString
        if let imageData = imageDataCache.object(forKey: key) {
            completion(.success(imageData as Data))
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            
            let value = data as NSData
            self?.imageDataCache.setObject(value, forKey: key)
            
            completion(.success(data))
        }
        task.resume()
    }
}
