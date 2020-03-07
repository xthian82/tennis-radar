//
//  SportEvent.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/2/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import Foundation

struct SportEvent: Codable {
    
    let id: String
    let scheduled: String
    let startTimeTbd: Bool?
    let tournamentRound: TournamentRound?
    let season: Season?
    let tournament: Tournament?
    let competitors: [Competitor]?
    let venue: Venue?
    let sportEventType: String?
    let estimated: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id
        case scheduled
        case startTimeTbd = "start_time_tbd"
        case tournamentRound = "tournament_round"
        case season
        case tournament
        case competitors
        case venue
        case sportEventType = "sport_event_type"
        case estimated
    }
}
