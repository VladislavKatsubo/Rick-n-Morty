//
//  RMEndpoint.swift
//  Rick&Morty
//
//  Created by Vlad Katsubo on 27.12.22.
//

import Foundation

/// Represents unique API endpoints
@frozen enum RMEndpoint: String, CaseIterable, Hashable {
    /// Endpoint to get character info
    case character
    /// Endpoint to get location info
    case location
    /// Endpoint to get episode info
    case episode
}
