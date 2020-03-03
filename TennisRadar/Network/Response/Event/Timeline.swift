//
//  Timeline.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/3/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import Foundation

struct Timeline: Codable {
    
    let id: Int
    let type: String
    let time: String?
    let periodName: String?
    let team: String?
    let homeScore: Int?
    let awayScore: Int?
    let server: String?
    let result: String?
    let firstServeFault: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id
        case type
        case time
        case periodName = "period_name"
        case team
        case homeScore = "home_score"
        case awayScore = "away_score"
        case server
        case result
        case firstServeFault = "first_serve_fault"
    }
}
