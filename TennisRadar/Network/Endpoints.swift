//
//  Endpoints.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/1/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import Foundation

public enum Endpoints {
    
    //MARK: - Properties
    static let base = "https://api.sportradar.com/tennis-t2/en"
    static let apiKeyParam = ".json?api_key=25sp2kpbnpvz3kkx2y8qud5z"
    
    //MARK: Endpoints
    case tournamentsOngoing
    case tournamentInfo(_ tournamentId: String)
    case results(_ dayOrLive: String)
    case schedule(_ dayOrLive: String)
    case liveSummary
    case matchProbability(_ matchId: String)
    case matchSummary(_ matchId: String)
    case headToHead(playerOne: String, playerTwo: String)
    case playerProfile(_ playerId: String)
    case playersRankings
    
    // MARK: - Value String
    var val: String {
        switch self {
        case .tournamentsOngoing:
            return Endpoints.base + "/tournaments/ongoing\(Endpoints.apiKeyParam)"
        case .tournamentInfo(let tournamentId):
            return Endpoints.base + "/tournaments/\(tournamentId)/info\(Endpoints.apiKeyParam)"
        case .results(let dayOrLive):
            return Endpoints.base + "/schedules/\(dayOrLive)/results\(Endpoints.apiKeyParam)"
        case .schedule(let dayOrLive):
            return Endpoints.base + "/schedules/\(dayOrLive)/schedule\(Endpoints.apiKeyParam)"
        case .liveSummary:
            return Endpoints.base + "/schedules/live/summaries\(Endpoints.apiKeyParam)"
        case .matchProbability(let matchId):
            return Endpoints.base + "/matches/\(matchId)/probabilities\(Endpoints.apiKeyParam)"
        case .matchSummary(let matchId):
            return Endpoints.base +  "/matches/\(matchId)/summary\(Endpoints.apiKeyParam)"
        case .headToHead(let playerOne, let playerTwo):
            return Endpoints.base + "/players/\(playerOne)/versus/\(playerTwo)/matches\(Endpoints.apiKeyParam)"
        case .playerProfile(let playerId):
            return Endpoints.base + "/players/\(playerId)/profile\(Endpoints.apiKeyParam)"
        case .playersRankings:
            return Endpoints.base + "/players/rankings\(Endpoints.apiKeyParam)"
        }
    }
}
