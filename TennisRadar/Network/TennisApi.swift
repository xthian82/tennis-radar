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
             print("\n\n\ngetTournamentSummary is \(String(describing: response))")
               DispatchQueue.main.async {
                   completion(response.value)
               }
        }
    }
    
    class func getTournamentSchedule(_ tournamentId: String, completion: @escaping (TournamentSchedule?) -> Void) {
        AF.request(Endpoints.tournamentSchedule(tournamentId).val).validate()
           .responseDecodable(of: TournamentSchedule.self, queue: .global(qos: .background)) { response in
            print("\n\n\ngetTournamentSchedule is \(String(describing: response))")
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
                print("\n\n\ngetTournamentInfo is \(String(describing: response))")
                completion(response.value)
            }
        }
    }
    
    // MARK: - Match Calls
    class func getResults(ofDate: String?, completion: @escaping (TournamentResults?) -> Void) {
        let endpoint = Endpoints.results(getLiveOrDate(ofDate)).val
        print("** Invoking => \(endpoint)")
        AF.request(endpoint).validate()
          .responseDecodable(of: TournamentResults.self, queue: .global(qos: .background)) { response in
            print("getResults \(String(describing: ofDate)) ==> \(String(describing: response))")
            DispatchQueue.main.async {
                completion(response.value)
            }
        }
    }
    
    class func getSchedule(ofDate: String?, completion: @escaping (TournamentSchedule?) -> Void) {
        AF.request(Endpoints.schedule(getLiveOrDate(ofDate)).val).validate()
          .responseDecodable(of: TournamentSchedule.self, queue: .global(qos: .background)) { response in
            DispatchQueue.main.async {
                completion(response.value)
            }
        }
    }
    
    class func getLiveSummary(completion: @escaping (TournamentSummary?) -> Void) {
        AF.request(Endpoints.liveSummary.val).validate()
          .responseDecodable(of: TournamentSummary.self, queue: .global(qos: .background)) { response in
            DispatchQueue.main.async {
                completion(response.value)
            }
        }
    }
    
    class func getMatchProbabilities(_ matchId: String, completion: @escaping (MatchProbability?) -> Void) {
        AF.request(Endpoints.matchProbability(matchId).val).validate()
          .responseDecodable(of: MatchProbability.self, queue: .global(qos: .background)) { response in
            DispatchQueue.main.async {
                completion(response.value)
            }
        }
    }
    
    class func getMatchSummary(_ matchId: String, completion: @escaping (MatchResult?) -> Void) {
        AF.request(Endpoints.matchSummary(matchId).val).validate()
          .responseDecodable(of: MatchResult.self, queue: .global(qos: .background)) { response in
            DispatchQueue.main.async {
                completion(response.value)
            }
        }
    }
    
    class func getMatchTimeline(_ matchId: String, completion: @escaping (MatchResult?) -> Void) {
        AF.request(Endpoints.matchTimeline(matchId).val).validate()
          .responseDecodable(of: MatchResult.self, queue: .global(qos: .background)) { response in
            DispatchQueue.main.async {
                completion(response.value)
            }
        }
    }
    
    // MARK: - Players Calls
    class func getPlayerProfile(_ playerId: String, completion: @escaping (PlayerProfile?) -> Void){
        AF.request(Endpoints.playerProfile(playerId).val).validate()
          .responseDecodable(of: PlayerProfile.self, queue: .global(qos: .background)) { response in
            DispatchQueue.main.async {
                completion(response.value)
            }
        }
    }
    
    class func getPlayerRankings(completion: @escaping (PlayerRankings?) -> Void){
        AF.request(Endpoints.playersRankings.val).validate()
          .responseDecodable(of: PlayerRankings.self, queue: .global(qos: .background)) { response in
            DispatchQueue.main.async {
                completion(response.value)
            }
        }
    }
    
    class func getHeadToHead(_ of: String, versus: String, completion: @escaping (HeadToHead?) -> Void){
        AF.request(Endpoints.headToHead(playerOne: of, playerTwo: versus).val).validate()
          .responseDecodable(of: HeadToHead.self, queue: .global(qos: .background)) { response in
            DispatchQueue.main.async {
                completion(response.value)
            }
        }
    }
    
    /**
       case .playerResults(let playerId):
           return Endpoints.base + "/players/\(playerId)/results\(Endpoints.apiKeyParam)"
    */

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
