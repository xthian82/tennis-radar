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
    let winningReason: String?
    let matchStatus: String?
    let homeScore: Int?
    let awayScore: Int?
    let winnerId: String?
    let periodScores: [PeriodScore]?
    let matchEnded: String?

    enum CodingKeys: String, CodingKey {
        case status
        case winningReason = "winning_reason"
        case matchStatus = "match_status"
        case homeScore = "home_score"
        case awayScore = "away_score"
        case winnerId = "winner_id"
        case periodScores = "period_scores"
        case matchEnded = "match_ended"
    }
    
    func eventScores(separator: String = "-", lineSeparator: String = ", ") -> String {
        var results: [String] = []
        
        guard let hScore = homeScore, let aScore = awayScore else {
            return winningReason ?? ""
        }
        
        let homeIsTheWinner  = hScore > aScore
        
        if let scores = periodScores {
            for score in scores {
                if homeIsTheWinner {
                    results.append("\(score.homeScore ?? 0)\(separator)\(score.awayScore ?? 0)")
                } else {
                    results.append("\(score.awayScore ?? 0)\(separator)\(score.homeScore ?? 0)")
                }
            }
        }
        
        return results.joined(separator: lineSeparator)
    }
}

