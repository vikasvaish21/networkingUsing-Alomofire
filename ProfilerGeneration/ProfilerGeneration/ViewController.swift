//
//  ViewController.swift
//  ProfilerGeneration
//
//  Created by vikas on 25/10/19.
//  Copyright © 2019 project1. All rights reserved.
//

import UIKit
import Alamofire
class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    let myURL = "https://randomuser.me/api/"
    var imageUrl:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getPersonTapped(_ sender: Any) {
        AF.request(myURL).responseJSON{ (response) in
            let result = response.result
            debugPrint(result)
            
            
            //change the firstname label
            switch response.result{
               case .success(let json):
            if let result = json as? Dictionary<String,Any>{
                           //debugPrint(result)
                       if let innerResult = (result["results"] as! NSArray)[0] as? Dictionary<String,AnyObject>{
                         //  debugPrint(result)
                        if let name = innerResult["name"] as? Dictionary<String,AnyObject>{
                            if let firstname = name["first"] as? String{
                                debugPrint(firstname)
                                self.nameLabel.text = firstname
                            }
                               }
                           }
                       }
               case .failure(let error):
                   debugPrint(error)
               }
            
          //change the email label
            switch response.result{
               case .success(let json):
            if let result = json as? Dictionary<String,Any>{
                           //debugPrint(result)
                       if let innerResult = (result["results"] as! NSArray)[0] as? Dictionary<String,AnyObject>{
                         //  debugPrint(result)
                        if let email = innerResult["email"] as? String{
                                debugPrint(email)
                                self.emailLabel.text = email
                               }
                           }
                       }
               case .failure(let error):
                   debugPrint(error)
               }
            
            //change the phone number
            switch response.result{
               case .success(let json):
            if let result = json as? Dictionary<String,Any>{
                           //debugPrint(result)
                       if let innerResult = (result["results"] as! NSArray)[0] as? Dictionary<String,AnyObject>{
                         //  debugPrint(result)
                        if let phone = innerResult["phone"] as? String{
                                debugPrint(phone)
                                self.phoneLabel.text = phone
                               }
                           }
                       }
               case .failure(let error):
                   debugPrint(error)
               }
            
            
            
            switch response.result{
               case .success(let json):
            if let result = json as? Dictionary<String,Any>{
                           //debugPrint(result)
                       if let innerResult = (result["results"] as! NSArray)[0] as? Dictionary<String,AnyObject>{
                         //  debugPrint(result)
                        if let photo = innerResult["picture"] as? Dictionary<String,AnyObject>{
                            if let webPic = photo["large"] as? String{
                                self.imageUrl = webPic
                                debugPrint(self.imageUrl)
                            }
                               }
                           }
                       }
               case .failure(let error):
                   debugPrint(error)
               }
            
            
            if let url = URL(string: self.imageUrl){
                if let data = NSData(contentsOf: url){
                    self.imageView.image = UIImage(data: data as Data)
                    self.imageView.backgroundColor = UIColor.clear
                }
            }
            
            
        }
    }
    
   
}

