//
//  Info.swift
//  TennisRadar
//
//  Created by Cristhian Jesus Recalde Franco on 02/03/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import Foundation

struct Info: Codable {
    let surface: String?
    let complex: String?
    let complexId: String?
    let numberOfQualifiedCompetitors: Int?
    let tournamentStatus: String?
    
    enum CodingKeys: String, CodingKey {
        case surface
        case complex
        case complexId = "complex_id"
        case numberOfQualifiedCompetitors = "number_of_qualified_competitors"
        case tournamentStatus = "tournament_status"
    }
}
