//
//  TableView+Layout.swift
//  ChuckNorrisJokesUsing Alamofire
//
//  Created by vikas on 01/11/19.
//  Copyright © 2019 project1. All rights reserved.
//

import UIKit
extension UITableViewCell{
    func setupLayout(borderWidth: CGFloat,borderColor: CGColor,usingIndicator indicator:
        AccessoryType){
        accessoryType = indicator
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor
        selectionStyle = .none
    }
}
