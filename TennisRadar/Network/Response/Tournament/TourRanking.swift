//
//  TourRanking.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/6/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import Foundation

struct TourRanking: Codable {
    let name: String
    let type: String
    let year: Int
    let week: Int
    let categoryId: String
    let playerRankings: [Ranking]
    
    enum CodingKeys: String, CodingKey {
        case name
        case type
        case year
        case week
        case categoryId = "category_id"
        case playerRankings = "player_rankings"
    }
}
