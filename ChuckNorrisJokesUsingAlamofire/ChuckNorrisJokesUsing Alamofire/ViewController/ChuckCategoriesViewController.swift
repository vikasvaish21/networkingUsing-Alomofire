//
//  ChuckCategoriesViewController.swift
//  ChuckNorrisJokesUsing Alamofire
//
//  Created by vikas on 31/10/19.
//  Copyright © 2019 project1. All rights reserved.
//

import Foundation
import UIKit
class ChuckCategoriesViewController: UIViewController{
    static let sceneIdentifier = "Categories"
    
    override func loadView() {
        super.loadView()
        view = ChuckCategoriesList(delegate: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarLayout(withTitle: ChuckCategoriesViewController.sceneIdentifier)
        setupBackButton()
    }
}

extension ChuckCategoriesViewController: ChuckCategoriesListDelegate{
    func userSelectedItem(withCategories category: String) {
        navigationController?.pushViewController(JokeDetailViewController(selectedCategories: category), animated: true)
    }
}
