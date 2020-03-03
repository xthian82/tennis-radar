//
//  Outcome.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/3/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import Foundation

struct Outcome: Codable {

    let name: String
    let probability: Double
    
    enum CodingKeys: String, CodingKey {
        case name
        case probability
    }
}
