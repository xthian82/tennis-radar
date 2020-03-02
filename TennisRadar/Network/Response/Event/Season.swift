//
//  Season.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/1/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import Foundation

struct Season: Codable {
    
    let id: String
    let name: String
    let startDate: String?
    let endDate: String?
    let year: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case startDate = "start_date"
        case endDate = "end_date"
        case year
    }
}
