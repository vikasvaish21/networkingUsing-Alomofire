//
//  JokesDetails.swift
//  ChuckNorrisJokesUsing Alamofire
//
//  Created by vikas on 01/11/19.
//  Copyright © 2019 project1. All rights reserved.
//

import UIKit
import SDWebImage

protocol JokeDetailDelegate: class {
    func jokeHasBeenLoaded()
}
class JokesDetails:UIView{
    weak var delegate: JokeDetailDelegate?
    var jokesCategories: String
    
    init(delegate: JokeDetailDelegate,jokesCategories:String){
        self.delegate = delegate
        self.jokesCategories = jokesCategories
        super.init(frame: .zero)
        setup()
        fetchDataOnComponents()
    }
    
    required init?(coder aDecoder: NSCoder ){
        
        fatalError("init(coder: has not been implemented")
    }
    private lazy var imageViewJokes: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 12
        return imageView
    }()
    
    private lazy var textViewJokesDescription: UITextView = {
        let textview = UITextView()
        textview.translatesAutoresizingMaskIntoConstraints = false
        textview.isScrollEnabled = false
        textview.font  = UIFont.systemFont(ofSize: 16)
        textview.textAlignment = .center
        textview.textColor = .black
        return textview
    }()
    
    private func fetchDataOnComponents(){
        ChuckApi.requestChuckJokes(usingCategory: jokesCategories){ joke in
            let jokeParsed = JokesViewModel(joke: joke)
            DispatchQueue.main.async {
                self.renderData(withJokeViewModel: jokeParsed)
            }
        }
    }
    
    
    private func renderData(withJokeViewModel viewModel: JokesViewModel){
        imageViewJokes.sd_setImage(with: viewModel.icon)
        textViewJokesDescription.text = viewModel.description
    }
}

extension JokesDetails: ViewCode {
    func setup() {
        setupComponents()
        setupConstraints()
    }
    func setupComponents() {
        addSubview(imageViewJokes)
        addSubview(textViewJokesDescription)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageViewJokes.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            imageViewJokes.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageViewJokes.heightAnchor.constraint(equalToConstant: 48),
            imageViewJokes.widthAnchor.constraint(equalToConstant: 48)
        ])
        
        NSLayoutConstraint.activate([
            textViewJokesDescription.topAnchor.constraint(equalTo: imageViewJokes.bottomAnchor,constant: 8),
            textViewJokesDescription.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16),
            textViewJokesDescription.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -16)
        ])
    }
}
