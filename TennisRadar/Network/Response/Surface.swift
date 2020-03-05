//
//  Surface.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/5/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import Foundation

struct Surface: Codable {

    let type: String?
    let statistics: PeriodStat
    
    enum CodingKeys: String, CodingKey {
        case type
        case statistics
    }
}
