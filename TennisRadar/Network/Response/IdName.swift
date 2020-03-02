//
//  IdName.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/1/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import Foundation

struct IdName: Codable {
    
    let id: String
    let name: String
    let level: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case level
    }
}
