//
//  StringProtocol+Extension.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/14/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

// import Foundation

extension StringProtocol {
    var firstCapitalized: String { return prefix(1).capitalized + dropFirst() }
}
