//
//  TennisApi.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 2/27/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import Foundation
import Alamofire

class TennisApi {
    
    // MARK: - Tournaments Calls
    class func getTournaments(completion: @escaping (Tournaments?) -> Void) {
        AF.request(Endpoints.tournaments.val).validate()
        .responseDecodable(of: Tournaments.self, queue: .global(qos: .background)) { response in
            DispatchQueue.main.async {
                completion(response.value)
            }
        }
    }
    
    class func getOngoingTournaments(completion: @escaping (Tournaments?) -> Void) {
        AF.request(Endpoints.tournamentsOngoing.val).validate()
        .responseDecodable(of: Tournaments.self, queue: .global(qos: .background)) { response in
            DispatchQueue.main.async {
                completion(response.value)
            }
        }
    }
    
    class func getTournamentSummary(_ tournamentId: String, completion: @escaping (TournamentSummary?) -> Void) {
        AF.request(Endpoints.tournamentSummary(tournamentId).val).validate()
           .responseDecodable(of: TournamentSummary.self, queue: .global(qos: .background)) { response in
               DispatchQueue.main.async {
                   completion(response.value)
               }
        }
    }
    
    class func getTournamentSchedule(_ tournamentId: String, completion: @escaping (TournamentSchedule?) -> Void) {
        AF.request(Endpoints.tournamentSchedule(tournamentId).val).validate()
           .responseDecodable(of: TournamentSchedule.self, queue: .global(qos: .background)) { response in
               DispatchQueue.main.async {
                   completion(response.value)
               }
        }
    }
    
    class func getTournamentResults(_ tournamentId: String, completion: @escaping (TournamentResults?) -> Void) {
        AF.request(Endpoints.tournamentResults(tournamentId).val).validate()
           .responseDecodable(of: TournamentResults.self, queue: .global(qos: .background)) { response in
               DispatchQueue.main.async {
                   completion(response.value)
               }
        }
    }
    
    class func getTournamentInfo(_ tournamentId: String, completion: @escaping (TournamentInfo?) -> Void) {
        AF.request(Endpoints.tournamentInfo(tournamentId).val).validate()
          .responseDecodable(of: TournamentInfo.self, queue: .global(qos: .background)) { response in
            DispatchQueue.main.async {
                completion(response.value)
            }
        }
    }
    
    // MARK: - Match Calls
    class func getResults(ofDate: String?, completion: @escaping (TournamentResults?) -> Void) {
        AF.request(Endpoints.results(getLiveOrDate(ofDate)).val).validate()
          .responseDecodable(of: TournamentResults.self, queue: .global(qos: .background)) { response in
            DispatchQueue.main.async {
                completion(response.value)
            }
        }
    }
    
    class func getSchedule(ofDate: String?, completion: @escaping (TournamentResults?) -> Void) {
        AF.request(Endpoints.schedule(getLiveOrDate(ofDate)).val).validate()
          .responseDecodable(of: TournamentResults.self, queue: .global(qos: .background)) { response in
            DispatchQueue.main.async {
                completion(response.value)
            }
        }
    }
    
    // MARK: - Players Calls
    
    //MARK: - Helpers
    fileprivate class func getLiveOrDate(_ ofDate: String?) -> String {
        var response: String
        if let ofDate = ofDate {
            response = ofDate
        } else {
            response = "live"
        }
        return response
    }
}


/**
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
        case .matchTimeline(let matchId):
            return Endpoints.base + "/matches/\(matchId)/timeline\(Endpoints.apiKeyParam)"
        case .headToHead(let playerOne, let playerTwo):
            return Endpoints.base + "/players/\(playerOne)/versus/\(playerTwo)/matches\(Endpoints.apiKeyParam)"
        case .playerProfile(let playerId):
            return Endpoints.base + "/players/\(playerId)/profile\(Endpoints.apiKeyParam)"
        case .playerRaceRankings:
            return Endpoints.base + "/players/race_rankings\(Endpoints.apiKeyParam)"
        case .playersRankings:
            return Endpoints.base + "/players/rankings\(Endpoints.apiKeyParam)"
        case .playerResults(let playerId):
            return Endpoints.base + "/players/\(playerId)/results\(Endpoints.apiKeyParam)"
        case .playerSchedule(let playerId):
            return Endpoints.base + "/players/\(playerId)/schedule\(Endpoints.apiKeyParam)"
        }
 
 */
