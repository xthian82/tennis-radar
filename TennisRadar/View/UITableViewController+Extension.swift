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
        let headerView = UIView(frame: CGRect(x: 15, y: 8, width: self.tableView.frame.size.width - 15, height: 22))
        let label = UILabel(frame: headerView.frame)
        label.text = title
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        
        headerView.addSubview(label)
        headerView.backgroundColor = UIColor.lightGray
        return headerView;
    }

}
