//
//  Venue.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/2/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import Foundation

struct Venue: Codable {
    let id: String
    let name: String
    let cityName: String?
    let countryName: String?
    let countryCode: String?
                       
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case cityName = "city_name"
        case countryName = "country_name"
        case countryCode = "country_code"
    }
}
