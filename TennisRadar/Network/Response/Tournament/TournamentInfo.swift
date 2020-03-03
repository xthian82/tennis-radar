//
//  TournamentInfo.swift
//  TennisRadar
//
//  Created by Cristhian Jesus Recalde Franco on 02/03/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import Foundation

struct TournamentInfo: Codable {
    let generatedAt: String?
    let schema: String?
    let tournament: Tournament
    let season: Season
    let info: Info
    let coverageInfo: CoverageInfo
    let winnerLastSeason: Player?
    let competitors: [Player]
    
    enum CodingKeys: String, CodingKey {
        case generatedAt = "generated_at"
        case schema
        case tournament
        case season
        case info
        case coverageInfo = "coverage_info"
        case winnerLastSeason = "winner_last_season"
        case competitors
    }
}
