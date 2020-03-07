//
//  Meeting.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/6/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import Foundation

struct Meetings: Codable {
    let results: [MatchResult]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
}

