//
//  MatchStats.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/3/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import Foundation

struct MatchStats: Codable {
    
    let aces: Int
    let doubleFaults: Int
    let pointsWon: Int
    let maxPointsInARow: Int
    let firstServePointsWon: Int
    let secondServcePointsWon: Int
    let totalBreakpoints: Int
    let breakpointsWon: Int
    let maxGamesInARow: Int
    let gamesWon: Int
    let firstServeSuccessful: Int
    let secondServeSuccesful: Int
    let servicePointsWon: Int
    let serviceGamesWon: Int
    let tiebreaksWon: Int
    let receiverPointsWon: Int
    
    enum CodingKeys: String, CodingKey {
        case aces
        case doubleFaults = "double_faults"
        case pointsWon = "points_won"
        case maxPointsInARow = "max_points_in_a_row"
        case firstServePointsWon = "first_serve_points_won"
        case secondServcePointsWon = "second_serve_points_won"
        case totalBreakpoints = "total_breakpoints"
        case breakpointsWon = "breakpoints_won"
        case maxGamesInARow = "max_games_in_a_row"
        case gamesWon = "games_won"
        case firstServeSuccessful = "first_serve_successful"
        case secondServeSuccesful = "second_serve_successful"
        case servicePointsWon = "service_points_won"
        case serviceGamesWon = "service_games_won"
        case tiebreaksWon = "tiebreaks_won"
        case receiverPointsWon = "receiver_points_won"
    }
}
