//
//  PlayerProfile.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/3/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import Foundation

struct PlayerProfile: Codable {

    let player: Player
    let rankings: [Ranking]
    let statistics: Periods?
    let tournamentsPlayed: [Tournament]?
    
    enum CodingKeys: String, CodingKey {
        case player
        case rankings
        case statistics
        case tournamentsPlayed = "tournaments_played"
    }
}
