//
//  TournamentRound.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/2/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import Foundation

struct TournamentRound: Codable {
    let type: String
    let name: String?
    let groupLongName: String?
    let cupRoundMatchNumber: Int?
    let cupRoundMatches: Int?
    
    enum CodingKeys: String, CodingKey {
        case type
        case name
        case groupLongName = "group_long_name"
        case cupRoundMatchNumber = "cup_round_match_number"
        case cupRoundMatches = "cup_round_matches"
    }
}
