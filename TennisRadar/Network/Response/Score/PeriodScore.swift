//
//  PeriodScore.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/2/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import Foundation

struct PeriodScore: Codable {
    let homeScore: Int?
    let awayScore: Int?
    let type: String
    let number: Int?
    
    enum CodingKeys: String, CodingKey {
        case homeScore = "home_score"
        case awayScore = "away_score"
        case type
        case number
    }
}

