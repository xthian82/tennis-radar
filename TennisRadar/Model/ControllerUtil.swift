//
//  ControllerUtil.swift
//  TennisRadar
//
//  Created by Cristhian Jesus Recalde  Franco on 4/10/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import UIKit

class ControllerUtil {
    
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
    
    class func formatDateFromString(dateStr: String?, format: String = "yyyy-MMM-dd", isPosixDate: Bool = false) -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = format
        if isPosixDate {
            formatter.locale = Locale(identifier: "en_US_POSIX")
        }
        
        guard let str = dateStr else {
            return ""
        }
        
        if let date = formatter.date(from: str) {
            formatter.dateFormat = Constants.yyyyMMddFormat
            return formatter.string(from: date)
        }
        
        return ""
    }
    
    class func presentAlert(_ controller: UIViewController, title: String, message: String) {
        controller.present(controller.getDefaultAlertUI(title: title, message: message), animated: true, completion: nil)
    }
    
    class func getRefreshControl(_ view: UIViewController, selector: Selector) -> UIRefreshControl {
        let refreshControl = UIRefreshControl()
        refreshControl.backgroundColor = UIColor.green
        refreshControl.tintColor = UIColor.white
        refreshControl.addTarget(view, action: selector, for: .valueChanged)
        
        return refreshControl
    }
    
    class func getLabel(_ view: UIView, text: String) -> UILabel {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height))

        messageLabel.text = text
        messageLabel.textColor = UIColor.black
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont(name: "Futura-CondensedMedium", size: 20)
        messageLabel.sizeToFit()
        
        return messageLabel
    }
}
