//
//  ControllerUtil.swift
//  TennisRadar
//
//  Created by Cristhian Jesus Recalde  Franco on 4/10/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import UIKit

class ControllerUtil {
    
    private static let formatter = DateFormatter()
    
    class func setHeaderView(_ view: UIView, fontName: String = "Futura", ofSize: CGFloat = 15, align: NSTextAlignment = .center,
                             color: UIColor = .black) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.font = UIFont(name: fontName, size: ofSize)
        header.textLabel?.textAlignment = align
        header.textLabel?.textColor = color
    }

    class func capitalize(_ str: String, separator: Character = "_", join: String = " ") -> String {
        let words = str.split(separator: separator)
        var capWords: [String] = []
        
        for word in words {
            capWords.append(word.capitalized)
        }
        
        return capWords.joined(separator: join)
    }
    
    class func formatDateFromString(dateStr: String?, format: String = "yyyy-MMM-dd") -> String {
        guard let str = dateStr else {
            return ""
        }
        
        if let date = formatter.date(from: str) {
            formatter.dateFormat = format
            return formatter.string(from: date)
        }
        
        return ""
    }
}
