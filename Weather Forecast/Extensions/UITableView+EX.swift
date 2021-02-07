//
//  UITableView+EX.swift
//  Weather Forecast
//
//  Created by Shcheng on 2021/2/6.
//  Copyright © 2021 VolvoCar. All rights reserved.
//

import UIKit

extension UITableView {
    typealias Builder = UITableViewBuilder
}

class UITableViewBuilder: BuilderType {
    var dataSource: UITableViewDataSource!
    var delegate: UITableViewDelegate!
    var estimatedRowHeight: CGFloat!
    
    func withDataSource(_ dataSource: UITableViewDataSource) -> UITableViewBuilder{
        self.dataSource = dataSource
        return self
    }
    
    func withDelegate(_ delegate: UITableViewDelegate) -> UITableViewBuilder{
        self.delegate = delegate
        return self
    }
    
    func withEstimatedRowHeight(_ estimatedRowHeight: CGFloat) -> UITableViewBuilder {
        self.estimatedRowHeight = estimatedRowHeight
        return self
    }
    
    func build() -> UITableView {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = self.estimatedRowHeight
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self.delegate
        tableView.dataSource = self.dataSource
        
        return tableView
    }
}
