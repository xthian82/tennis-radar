//
//  SportEvent.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/2/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import Foundation

struct SportEvent: Codable {
    
    let id: String
    let scheduled: String
    let tournamentRound: TournamentRound
    let season: Season?
    let tournament: Tournament?
    let competitors: [Player]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case scheduled
        case tournamentRound = "tournament_round"
        case season
        case tournament
        case competitors
    }
}
