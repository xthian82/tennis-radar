//
//  SportEventConditions.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/2/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import Foundation

struct SportEventConditions: Codable {
    let matchMode: String?
    let venue: Venue?
    let championsTiebreak: Bool?
    
    enum CodingKeys: String, CodingKey {
        case matchMode = "match_mode"
        case venue
        case championsTiebreak = "champions_tiebreak"
    }
}
