//
//  TournamentResults.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/2/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import Foundation

struct TournamentResults: Codable {
    let generatedAt: String?
    let schema: String?
    let tournament: Tournament?
    let results: [TournamentResult]
    
    enum CodingKeys: String, CodingKey {
        case generatedAt = "generated_at"
        case schema
        case tournament
        case results
    }
}
