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
    // static let apiKeyParam = ".json?api_key=6pf56k9275ga27kq4g4ghzw2"
    static let apiKeyParam = ".json?api_key=mvvutby85g24kpsh2bnnaqrv"
    
    //MARK: Endpoints
    //case tournaments
    case tournamentsOngoing
    //case tournamentSeasons(_ tournamentId: String)
    case tournamentInfo(_ tournamentId: String)
    //case tournamentResults(_ tournamentId: String)
    // case tournamentSummary(_ tournamentId: String)
    // case tournamentSchedule(_ tournamentId: String)
    case results(_ dayOrLive: String)
    case schedule(_ dayOrLive: String)
    case liveSummary
    case matchProbability(_ matchId: String)
    case matchSummary(_ matchId: String)
    //case matchTimeline(_ matchId: String)
    case headToHead(playerOne: String, playerTwo: String)
    case playerProfile(_ playerId: String)
    case playersRankings
    //case playerResults(_ playerId: String)
    
    // MARK: - Value String
    var val: String {
        switch self {
        //case .tournaments:
        //    return Endpoints.base + "/tournaments\(Endpoints.apiKeyParam)"
        case .tournamentsOngoing:
            return Endpoints.base + "/tournaments/ongoing\(Endpoints.apiKeyParam)"
        case .tournamentInfo(let tournamentId):
            return Endpoints.base + "/tournaments/\(tournamentId)/info\(Endpoints.apiKeyParam)"
        //case .tournamentResults(let tournamentId):
        //    return Endpoints.base + "/tournaments/\(tournamentId)/results\(Endpoints.apiKeyParam)"
        //case .tournamentSummary(let tournamentId):
        //    return Endpoints.base + "/tournaments/\(tournamentId)/summaries\(Endpoints.apiKeyParam)"
        //case .tournamentSchedule(let tournamentId):
        //    return Endpoints.base + "/tournaments/\(tournamentId)/schedule\(Endpoints.apiKeyParam)"
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
        //case .matchTimeline(let matchId):
        //    return Endpoints.base + "/matches/\(matchId)/timeline\(Endpoints.apiKeyParam)"
        case .headToHead(let playerOne, let playerTwo):
            return Endpoints.base + "/players/\(playerOne)/versus/\(playerTwo)/matches\(Endpoints.apiKeyParam)"
        case .playerProfile(let playerId):
            return Endpoints.base + "/players/\(playerId)/profile\(Endpoints.apiKeyParam)"
        case .playersRankings:
            return Endpoints.base + "/players/rankings\(Endpoints.apiKeyParam)"
        //case .playerResults(let playerId):
        //    return Endpoints.base + "/players/\(playerId)/results\(Endpoints.apiKeyParam)"
        }
    }
}
