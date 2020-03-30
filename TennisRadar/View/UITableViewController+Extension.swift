//
//  UITableViewController+Extension.swift
//  TennisRadar
//
//  Created by Cristhian Recalde on 3/25/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import UIKit

extension UITableViewController {
    
    func getHeaderView(title: String) -> UIView {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.size.width, height: 50))
        let label = UILabel(frame: headerView.frame)
        label.text = title
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont.boldSystemFont(ofSize: 24.0)
        

        headerView.backgroundColor = UIColor.lightGray
        headerView.addSubview(label)
        
        return headerView;
    }

}
