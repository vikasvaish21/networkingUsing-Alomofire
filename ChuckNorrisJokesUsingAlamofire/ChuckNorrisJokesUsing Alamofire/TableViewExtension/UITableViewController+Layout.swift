//
//  UITableViewController+Layout.swift
//  ChuckNorrisJokesUsing Alamofire
//
//  Created by vikas on 01/11/19.
//  Copyright © 2019 project1. All rights reserved.
//

import UIKit

extension UIViewController{
    
    
    func setNavigationBarLayout(withTitle title: String){
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.barTintColor = Constants.Colors.yellow
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.title = title
    }
    
    func setupBackButton(buttonTitle: String? = nil){
        navigationItem.backBarButtonItem = UIBarButtonItem(title: buttonTitle, style: .plain, target: nil, action: nil)
    }
    
}
