//
//  Tournaments.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/1/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import Foundation

public struct Tournaments: Codable {
    
    let generatedAt: String
    let schema: String
    let tournaments: [Tournament]
    
    enum CodingKeys: String, CodingKey {
        case generatedAt = "generated_at"
        case schema
        case tournaments
    }
}
