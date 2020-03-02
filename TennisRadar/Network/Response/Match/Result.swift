//
//  Result.swift
//  TennisRadar
//
//  Created by Cristhian Jesus Recalde Franco on 02/03/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import Foundation

struct Result: Codable {
    
    let sportEvent: SportEvent
    
    enum CodingKeys: String, CodingKey {
        case result
    }
}
