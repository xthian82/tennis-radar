//
//  Results.swift
//  TennisRadar
//
//  Created by Cristhian Jesus Recalde Franco on 02/03/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import Foundation

struct Results: Codable {
    
    let result: [Result]
    
    enum CodingKeys: String, CodingKey {
        case result
    }
}
