//
//  TournamentResult.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/2/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import Foundation

struct TournamentResult: Codable {
    let sportEvent: SportEvent
    let sportEventStatus: SportEventStatus
    
    enum CodingKeys: String, CodingKey {
        case sportEvent = "sport_event"
        case sportEventStatus = "sport_event_status"
    }
}

