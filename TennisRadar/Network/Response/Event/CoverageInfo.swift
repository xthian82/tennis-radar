//
//  CoverageInfo.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/2/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import Foundation

struct CoverageInfo: Codable {
    let liveCoverage: String?
    let playByPlay: Bool?
    let detailedServeOutcomes: Bool?
    
    enum CodingKeys: String, CodingKey {
        case liveCoverage = "live_coverage"
        case playByPlay = "play_by_play"
        case detailedServeOutcomes = "detailed_serve_outcomes"
    }
}
