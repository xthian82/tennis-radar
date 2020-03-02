//
//  TournamentInfo.swift
//  TennisRadar
//
//  Created by Cristhian Jesus Recalde Franco on 02/03/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import Foundation

struct TournamentInfo: Codable {
    let tournament: Tournament
    let tournamentRound: TournamentRound
    let info: Info
    let competitors: [Player]
    
    enum CodingKeys: String, CodingKey {
        case tournament
        case tournamentRound = "tournament_round"
        case info
        case competitors
    }
}
