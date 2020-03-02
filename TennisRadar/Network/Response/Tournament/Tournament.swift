//
//  Tournament.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/1/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import Foundation

struct Tournament: Codable {
    
    let id: String
    let name: String
    let parentId: String?
    let sport: IdName
    let category: IdName
    let currentSeason: Season?
    let type: String?
    let gender: String?
    let countryFormat: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case parentId = "parent_id"
        case sport
        case category
        case currentSeason = "current_season"
        case type
        case gender
        case countryFormat = "country_format"
    }
}

