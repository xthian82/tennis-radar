//
//  MatchStatistics.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/3/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import Foundation

struct MatchStatistics: Codable {
    
    let teams: [MatchStat]
    
    enum CodingKeys: String, CodingKey {
        case teams
    }
}
