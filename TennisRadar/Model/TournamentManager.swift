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
    
    private var _tours = ["ATP", "WTA"]
    private var _leagues = ["ATP Singles", "WTA Singles", "Davis Cup"]
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

    var leagues: [String] {
        return _leagues
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
