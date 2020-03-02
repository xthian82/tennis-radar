//
//  TournamentRound.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/2/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import Foundation

struct TournamentRound: Codable {
    let type: String
    
    enum CodingKeys: String, CodingKey {
        case type
    }
}
