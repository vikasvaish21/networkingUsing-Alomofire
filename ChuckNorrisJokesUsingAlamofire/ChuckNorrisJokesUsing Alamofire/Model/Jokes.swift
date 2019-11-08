//
//  Jokes.swift
//  ChuckNorrisJokesUsing Alamofire
//
//  Created by vikas on 02/11/19.
//  Copyright © 2019 project1. All rights reserved.
//

 import Foundation

 struct Joke: Codable {
     var id: String?
     var categories: [String]?
     var creationDate: String?
     var updateDate: String?
     var icon: String?
     var externalUrl: String?
     var description: String?
     
     private enum CodingKeys: String, CodingKey {
         case id
         case categories
         case creationDate = "created_at"
         case updateDate = "updated_at"
         case icon = "icon_url"
         case externalUrl = "url"
         case description = "value"
     }
 }

