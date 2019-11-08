//
//  JokesViewModel.swift
//  ChuckNorrisJokesUsing Alamofire
//
//  Created by vikas on 01/11/19.
//  Copyright © 2019 project1. All rights reserved.
//

import Foundation

class JokesViewModel{
    var jokes: Joke
    
    init(joke: Joke){
        self.jokes = joke
    }
    
    var icon: URL{
        let url = URL(string: String())
        
        guard let icon = jokes.icon, let iconPath = URL(string: icon) else{ return url! }
        return iconPath
        }
    
    var description: String{
        guard let description = jokes.description else { return String() }
        return description
    }
}

