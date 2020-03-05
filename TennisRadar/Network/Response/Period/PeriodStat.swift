//
//  PeriodStat.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/5/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import Foundation

struct PeriodStat: Codable {

    let tournamentsPlayed: Int
    let tournamentsWon: Int
    let matchesPlayed: Int
    let matchesWon: Int
    
    enum CodingKeys: String, CodingKey {
        case tournamentsPlayed = "tournaments_played"
        case tournamentsWon = "tournaments_won"
        case matchesPlayed = "matches_played"
        case matchesWon = "matches_won"
    }
}
