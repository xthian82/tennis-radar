//
//  Markets.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/3/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import Foundation

struct Markets: Codable {

    let markets: [Market]
    
    enum CodingKeys: String, CodingKey {
        case markets
    }
}
