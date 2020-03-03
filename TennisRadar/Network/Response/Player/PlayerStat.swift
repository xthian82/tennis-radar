//
//  PlayerStat.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/3/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import Foundation

public struct PlayerStat: Codable {

    let id: String
    let name: String
    let abbreviation: String
    let qualifier: String
    let statistics: Stats
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case abbreviation
        case qualifier
        case statistics
    }
}
