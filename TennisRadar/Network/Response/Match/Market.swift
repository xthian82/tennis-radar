//
//  Market.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/3/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import Foundation

struct Market: Codable {

    let name: String
    let outcomes: [Outcome]
    
    enum CodingKeys: String, CodingKey {
        case name
        case outcomes
    }
}
