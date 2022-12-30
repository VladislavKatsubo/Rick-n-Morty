//
//  RMService.swift
//  Rick&Morty
//
//  Created by Vlad Katsubo on 27.12.22.
//

import Foundation


/// Primary API service object to get Rick&Morty data.
final class RMService {
    
    /// Shared singleton instance
    static let shared = RMService()
    
    /// Privatized constructor
    private init() {}
    
    
    /// Send Rick n Morty API Call
    /// - Parameters:
    ///   - request: Request instance
    ///   - completion: Callback with data or error
    public func execute(_ request: RMRequest, completion: @escaping () -> Void) {
        
    }
}
