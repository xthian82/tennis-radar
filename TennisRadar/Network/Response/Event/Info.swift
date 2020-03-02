//
//  Info.swift
//  TennisRadar
//
//  Created by Cristhian Jesus Recalde Franco on 02/03/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import Foundation

struct Info: Codable {
    let prizeMoney: String
    let prizeCurrency: String
    let surface: String
    let numberOfCompetitors: String
    
    enum CodingKeys: String, CodingKey {
        case prizeMoney = "prize_money"
        case prizeCurrency = "prize_currency"
        case surface
        case numberOfCompetitors = "number_of_competitors"
    }
}
