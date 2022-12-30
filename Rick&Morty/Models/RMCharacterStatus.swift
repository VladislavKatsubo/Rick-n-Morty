//
//  RMCharacterStatus.swift
//  Rick&Morty
//
//  Created by Vlad Katsubo on 30.12.22.
//

import Foundation

enum RMCharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case `unknown` = "Unknown"
}
