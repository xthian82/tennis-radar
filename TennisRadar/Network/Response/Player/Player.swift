//
//  Player.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/2/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import Foundation

struct Player: Codable {

    let id: String
    let name: String
    let nationality: String?
    let countryCode: String?
    let abbreviation: String?
    let qualifier: String?
    let gender: String?
    let dateOfBirth: String?
    let proYear: Int?
    let handedness: String?
    let height: Int?
    let weight: Int?
    let highestSinglesRanking: Int?
    let dateHighestSinglesRanking: String?
    let highestDoublesRanking: Int?
    let dateHighestDoublesRanking: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case nationality
        case countryCode = "country_code"
        case abbreviation
        case qualifier
        case gender
        case dateOfBirth = "date_of_birth"
        case proYear = "pro_year"
        case handedness
        case height
        case weight
        case highestSinglesRanking = "highest_singles_ranking"
        case dateHighestSinglesRanking = "date_highest_singles_ranking"
        case highestDoublesRanking = "highest_doubles_ranking"
        case dateHighestDoublesRanking = "date_highest_doubles_ranking"
    }
}


       
