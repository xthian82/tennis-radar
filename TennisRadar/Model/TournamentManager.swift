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
    
    static let wtaPremierSingles = "WTA_wta_premier_singles"
    static let wtaPremierDoubles = "WTA_wta_premier_doubles"
    static let wtaInternationalSingles = "WTA_wta_international_singles"
    static let wtaInternationalDoubles = "WTA_wta_international_doubles"
    static let wtaChampionshipsSingles = "WTA_wta_championships_singles"
    static let wtaChampionshipsDoubles = "WTA_wta_championships_doubles"
    static let wtaGrandSlamSingles = "WTA_grand_slam_singles"
    static let wtaGrandSlamDoubles = "WTA_grand_slam_doubles"
    static let atpOneThousandSingles = "ATP_atp_1000_singles"
    static let atpOneThousandDoubles = "ATP_atp_1000_doubles"
    static let atpFiveHundredSingles = "ATP_atp_500_singles"
    static let atpFiveHundredDoubles = "ATP_atp_500_doubles"
    static let atpTwoHundredSingles = "ATP_atp_250_singles"
    static let atpTwoHundredDoubles = "ATP_atp_250_doubles"
    static let atpWorldTourSingles = "ATP_atp_world_tour_finals_singles"
    static let atpWorldTourDoubles = "ATP_atp_world_tour_finals_doubles"
    static let atpGrandSlamSingles = "ATP_grand_slam_singles"
    static let atpGrandSlamDoubles = "ATP_grand_slam_doubles"
    static let atpSingles = "ATP_singles"
    static let atpDoubles = "ATP_doubles"
    static let wtaSingles = "WTA_Singles"
    static let wtaDoubles = "WTA_doubles"
    
    private var _types = ["WTA", "ATP"]
    private var _tours = ["WTA - [S: Singles - : Doubles]", "ATP - [S: Singles - : Doubles]", "Enable / Disable"]
    private var _modes = ["singles", "doubles"]
    //private var _leagues = ["ATP": ["Singles", "Doubles"], "WTA":["Singles", "Doubles"]]
    //private var _levels = ["ATP": ["atp_1000", "atp_500", "atp_250", "atp_world_tour_finals", "grand_slam"],
    //                       "WTA": ["wta_premier","wta_international","wta_championships"]]
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
    
    var types: [String] {
        return _types
    }
    
    /*
    var levels: [String: [String]] {
        return _levels
    }*/
    
    var modes: [String] {
        return _modes
    }
    
    var matchMode: [String:String] {
        return _matchMode
    }
    
    var eventStatusType: [String:String] {
        return _eventStatusType
    }
    
    class var wtaCategoriesSingles: [String] {
        return [wtaPremierSingles, wtaInternationalSingles, wtaChampionshipsSingles, wtaGrandSlamSingles]
    }
    
    class var wtaCategoriesDoubles: [String] {
        return [wtaPremierDoubles, wtaInternationalDoubles, wtaChampionshipsDoubles, wtaGrandSlamDoubles]
    }
    
    class var atpCategoriesSingles: [String] {
        return [atpOneThousandSingles, atpFiveHundredSingles, atpTwoHundredSingles, atpWorldTourSingles, atpGrandSlamSingles]
    }

    class var atpCategoriesDoubles: [String] {
        return [atpOneThousandDoubles, atpFiveHundredDoubles, atpTwoHundredDoubles, atpWorldTourDoubles, atpGrandSlamDoubles]
    }
    
    class var tourSingles: [String] {
        return [atpSingles, wtaSingles]
    }
    
    class var tourDoubles: [String] {
        return [atpDoubles, wtaDoubles]
    }
    
    private init() {
    }
    
    class func capitalize(_ str: String, separator: Character = "_", join: String = " ") -> String {
        let words = str.split(separator: separator)
        var capWords: [String] = []
        
        for word in words {
            capWords.append(word.capitalized)
        }
        
        return capWords.joined(separator: join)
    }
}
