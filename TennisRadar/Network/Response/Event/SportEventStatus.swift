//
//  SportEventStatus.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/2/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import Foundation

struct SportEventStatus: Codable {
    let status: String
    let matchStatus: String?
    let homeScore: Int?
    let awayScore: Int?
    let winnerId: String?
    let periodScores: [PeriodScore]?
    let matchEnded: String?

    enum CodingKeys: String, CodingKey {
        case status
        case matchStatus = "match_status"
        case homeScore = "home_score"
        case awayScore = "away_score"
        case winnerId = "winner_id"
        case periodScores = "period_scores"
        case matchEnded = "match_ended"
    }
}

