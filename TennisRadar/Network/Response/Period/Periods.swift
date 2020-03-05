//
//  Periods.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/5/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import Foundation

struct Periods: Codable {

    let periods: [Period]
    
    enum CodingKeys: String, CodingKey {
        case periods
    }
}
