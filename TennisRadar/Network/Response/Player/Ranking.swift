//
//  Ranking.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/3/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import Foundation

struct Ranking: Codable {

    let playerId: String?
    let points: Int
    let rank: Int
    let raceRanking: Bool?
    let rankingMovement: Int?
    let tournamentsPlayed: Int?
    let name: String?
    let type: String?
    let player: Player?
    
    enum CodingKeys: String, CodingKey {
        case playerId = "player_id"
        case points
        case rank
        case raceRanking = "race_ranking"
        case rankingMovement = "ranking_movement"
        case tournamentsPlayed = "tournaments_played"
        case name
        case type
        case player
    }
}
