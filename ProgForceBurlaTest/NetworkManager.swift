//
//  NetworkManager.swift
//  ProgForceBurlaTest
//
//  Created by Александр on 05.07.16.
//  Copyright © 2016 Александр. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class NetworkManager: NSObject {
    
    public typealias Completion = (success: Bool, response: JSON?, error: NSError?) -> Void
    
    static var sharedManager = NetworkManager()
    
    private var lastRequest: NSURLRequest?
    
    private func performRequestWith(path: String, parameters: [String : AnyObject]?, completion: Completion) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        
        Alamofire.request(.GET, path, parameters: parameters, encoding: .JSON)
            .responseJSON { response in
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false

                print(response.request)  // original URL request
                print(response.response) // URL response
                print("response.result: \(response.result)")   // result of response serialization
                
                
                switch response.result {
                    
                case .Success:
                    if let value = response.result.value {
                        completion(success: true, response: JSON(value), error: nil)
                    }
                case .Failure(let error):
                    completion(success: false, response: nil, error: error)
                }
                
        }
        
    }
    
    
    public func getUserRepos(userName: String, completion: Completion) {
        self.performRequestWith("https://api.github.com/users/\(userName)/repos", parameters: nil) { (success, response, error) -> Void in
            if success {
                completion(success: true, response: response, error: nil)
            } else {
                completion(success: false, response: response, error: error)
            }
        }
    }
    
    public func getUserProfile(userName: String, completion: Completion) {
        self.performRequestWith("https://api.github.com/users/\(userName)", parameters: nil) { (success, response, error) -> Void in
            if success {
                completion(success: true, response: response, error: nil)
            } else {
                completion(success: false, response: response, error: error)
            }
        }
    }
    

}
