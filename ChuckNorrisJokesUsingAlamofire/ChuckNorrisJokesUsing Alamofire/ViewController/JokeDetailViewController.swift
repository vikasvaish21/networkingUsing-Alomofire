//
//  JokeDetailViewController.swift
//  ChuckNorrisJokesUsing Alamofire
//
//  Created by vikas on 01/11/19.
//  Copyright © 2019 project1. All rights reserved.
//

import UIKit
class JokeDetailViewController: UIViewController{
    var selectedCategories: String
    
    init(selectedCategories:String){
        self.selectedCategories = selectedCategories
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder eDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView(){
        super.loadView()
        view = JokesDetails(delegate: self, jokesCategories: selectedCategories)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    private func setLayout(){
        title = selectedCategories.capitalized
        view.backgroundColor = .white
    }
}

extension JokeDetailViewController: JokeDetailDelegate{
    func jokeHasBeenLoaded() {
        print("Hi")
    }
}
