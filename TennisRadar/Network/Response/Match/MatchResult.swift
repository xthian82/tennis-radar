//
//  MatchResult.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/2/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import Foundation

public struct MatchResult: Codable {

    let sportEvent: SportEvent
    let sportEventConditions: SportEventConditions?
    let sportEventStatus: SportEventStatus
    let coverageInfo: CoverageInfo?
    let timeline: [Timeline]?
    let statistics: Statistics?
    
    enum CodingKeys: String, CodingKey {
        case sportEvent = "sport_event"
        case sportEventConditions = "sport_event_conditions"
        case sportEventStatus = "sport_event_status"
        case coverageInfo = "coverage_info"
        case timeline
        case statistics
    }
}

