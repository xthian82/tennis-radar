//
//  UIViewController+Extension.swift
//  TennisRadar
//
//  Created by Cristhian Jesus Recalde  Franco on 4/12/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import UIKit
import CoreData

extension UIViewController {
    
    // MARK: - UI Helpers
    func getDefaultAlertUI(title: String, message: String) -> UIAlertController {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        return alertVC
    }
}
