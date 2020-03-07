//
//  PlayerRankings.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/6/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import Foundation

struct PlayerRankings : Codable {
    let generatedAt: String?
    let schema: String?
    let rankings: [TourRanking]
    
    enum CodingKeys: String, CodingKey {
        case generatedAt = "generated_at"
        case schema
        case rankings
    }
}
