//
//  MatchProbability.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/3/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import Foundation

struct MatchProbability: Codable {
    let generatedAt: String
    let schema: String
    let sportEvent: SportEvent
    let probabilities: Markets
    
    enum CodingKeys: String, CodingKey {
        case generatedAt = "generated_at"
        case schema
        case sportEvent = "sport_event"
        case probabilities
    }
}
