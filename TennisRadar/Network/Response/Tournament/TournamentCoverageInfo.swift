//
//  TournamentCoverageInfo.swift
//  TennisRadar
//
//  Created by Cristhian Jesus Recalde  Franco on 3/28/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import Foundation

class TournamentCoverageInfo: Codable {
    
    let liveCoverage: String
    
    enum CodingKeys: String, CodingKey {
        case liveCoverage = "live_coverage"
    }
}
