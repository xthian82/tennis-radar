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
    
    class func getTournamentInfo(_ tournamentId: String, completion: @escaping (TournamentResults?) -> Void) {
           AF.request(Endpoints.tournamentResults(tournamentId).val).validate()
              .responseDecodable(of: TournamentResults.self, queue: .global(qos: .background)) { response in
                  DispatchQueue.main.async {
                      completion(response.value)
                  }
           }
       }
    
    // MARK: - Match Calls
    
    // MARK: - Players Calls
}
