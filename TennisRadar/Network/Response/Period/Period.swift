//
//  Period.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/5/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import Foundation

struct Period: Codable {

    let year: Int
    let surfaces: [Surface]
    let statistics: PeriodStat
    
    enum CodingKeys: String, CodingKey {
        case year
        case surfaces
        case statistics
    }
}
