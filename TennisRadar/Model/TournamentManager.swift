//
//  TournamentManager.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/7/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import Foundation

class TournamentManager {
    
    static let shared = TournamentManager()
    
    private var _tours = ["WTA", "ATP"]
    private var _leagues = ["ATP": ["Singles", "Doubles"], "WTA":["Singles", "Doubles"]]
    private var _levels = ["ATP": ["atp_1000","atp_500","atp_250","atp_world_tour_finals","grand_slam"],
                           "WTA": ["wta_premier", "wta_international","wta_championships"]
                          ]
    
    
    
    private var _matchMode = ["bo5": "5 Sets", "bo3": "3 Sets"]
    private var _eventStatusType = [
        "not_started": "Scheduled",
        "match_about_to_start": "About to Start",
        "live": "In progress",
        "closed": "Match Closed",
        "ended": "Match Finished",
        "interrupted": "Match Interrupted",
        "suspended": "Match Suspended",
        "cancelled": "Match Cancelled",
        "delayed": "Delayed",
        "abandoned": "Match cancelled"]
    
    var tours: [String] {
        get {
            return _tours
        }
    }

    var leagues: [String: [String]] {
        return _leagues
    }
    
    var levels: [String: [String]] {
        return _levels
    }
    
    var matchMode: [String:String] {
        return _matchMode
    }
    
    var eventStatusType: [String:String] {
        return _eventStatusType
    }
    
    private init() {
    }
}
