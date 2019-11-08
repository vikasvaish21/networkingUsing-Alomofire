//
//  Networking.swift
//  ChuckNorrisJokesUsing Alamofire
//
//  Created by vikas on 31/10/19.
//  Copyright © 2019 project1. All rights reserved.
//

import Foundation
import Alamofire
 class ChuckApi{
    static let categoriesEndpoint = "https://api.chucknorris.io/jokes/categories"
    static let jokesDetailEndpoint = "https://api.chucknorris.io/jokes/random?category="
    
    class func requestCategories(responseRequest: @escaping (([String]) -> Void)){
        AF.request(ChuckApi.categoriesEndpoint).responseJSON{ response in
            switch response.result{
            case .success(_):
                guard let data = response.data else { return }
                do  {
                    let response = try JSONDecoder().decode([String].self , from: data)
                    responseRequest(response)
                }
                catch (let error){
                    print("error",error)
                }
            case .failure(let error):
                print("failure error",error)
            }
        }
    }
    
    
    class func requestChuckJokes(usingCategory categories: String, responseRequest: @escaping((Joke) -> Void )){
        AF.request("\(ChuckApi.jokesDetailEndpoint)\(categories)").responseJSON { response in
            switch response.result{
            case .success(_):
                guard let data = response.data else { return }
                do {
                    let response = try JSONDecoder().decode(Joke.self,from: data)
                    responseRequest(response)
                    
                }
                catch (let error){
                    print("error",error)
                }
            case .failure(let error):
                print("failure error",error)
            }
        }
        
    }
}
