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
    private var _tours = ["WTA (S: Singles / D: Doubles)", "ATP (S: Singles / D: Doubles)", "Enable / Disable"]
    private var _modes = ["singles", "doubles"]
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
    
    private var _eventStagesType = [
        "final": "F",
        "semifinal": "SF",
        "quarterfinal": "QF",
        "qualification": "Q",
        "11th_place_final": "11PF",
        "13th_place_final": "13PF",
        "15th_place_final": "15PF",
        "17th_place_final": "17PF",
        "19th_place_final": "19PF",
        "21st_place_final": "21PF",
        "23rd_place_final": "23PF",
        "2nd_place_final": "2PF",
        "3rd_place_final": "3PF",
        "3rd_place_playoff": "3PP",
        "4th_place_final": "4PF",
        "5th_place_final": "5PF",
        "7th_place_final": "7PF",
        "9th_place_final": "9PF",
        "decider_match": "DM",
        "initial_match": "IM",
        "losers_final": "LF",
        "losers_match": "LM",
        "losers_quarterfinal": "LQ",
        "losers_round_1": "LR1",
        "losers_round_2": "LR2",
        "losers_round_3": "LR3",
        "losers_round_4": "LR4",
        "losers_round_5": "LR5",
        "losers_round_of_16": "LR16",
        "losers_semifinal": "LSF",
        "placement_qualification_match": "PQM",
        "round_of_128": "R128",
        "round_of_16": "R16",
        "round_of_256": "R256",
        "round_of_32": "R32",
        "round_of_64": "R64",
        ]
    
    var tours: [String] {
        get {
            return _tours
        }
    }
    
    var types: [String] {
        return _types
    }
    
    var modes: [String] {
        return _modes
    }
    
    var matchMode: [String:String] {
        return _matchMode
    }
    
    var eventStatusType: [String:String] {
        return _eventStatusType
    }
    
    var eventStagesType: [String:String] {
        return _eventStagesType
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
}
