//
//  WorldCup.swift
//  CampeosDaCopa
//
//  Created by EPR Exatron on 08/08/2018.
//  Copyright © 2018 Exatron. All rights reserved.
//

import Foundation

struct WorldCup: Codable {
    let year: Int
    let country: String
    let winner: String
    let vice: String
    let winnerScore: String
    let viceScore: String
    let matches: [Match]
}

struct Match: Codable {
    let stage: String
    let games: [Game]
}

struct Game: Codable {
    let home: String //País da casa
    let away: String
    let score: String
    let date: String
}
