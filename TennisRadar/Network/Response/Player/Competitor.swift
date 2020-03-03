//
//  Competitor.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/2/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import Foundation

struct Competitor: Codable {
    let id: String?
    let name: String?
    let nationality: String?
    let countryCode: String?
    let bracketNumber: Int?
    let abbreviation: String?
    let qualifier: String?
    let players: [Player]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case nationality
        case countryCode = "country_code"
        case bracketNumber = "bracket_number"
        case abbreviation
        case qualifier
        case players
    }
}
