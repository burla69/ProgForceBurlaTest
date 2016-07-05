//
//  UserModel.swift
//  ProgForceBurlaTest
//
//  Created by Александр on 05.07.16.
//  Copyright © 2016 Александр. All rights reserved.
//

import UIKit
import SwiftyJSON

class UserModel: NSObject {
    
//    
//    var token = ""
//    var userAvatar = ""
//    var avatarUrl = ""
//    var facebookID = 0
//    var distance = 0.0
//    var position = 0.0
//    var time = 0.0
//    var averageTime = 0
//    var averageSpeed = 0.0
//    var averageDistance = 0.0
//    var lastChallenge: NSDate = NSDate()
//    
//    
//    var userNameScore = ""
//    var userFirstNameScore = ""
//    var userLastNameScore = ""
//    var userAvatarStringScore = ""
//    
//    static func userFromResponse(response: JSON) -> UserModel {
//        
//        print("userFromResponse \(response)")
//        
//        let user = UserModel()
//        
//        if let id = response["id"].int {user.id = id}
//        
//        if let username = response["username"].string {user.username = username}
//        if let firstName = response["first_name"].string {user.firstName = firstName}
//        if let email = response["email"].string {user.email = email}
//        if let lastName = response["last_name"].string {user.lastName = lastName}
//        if let facebookID = response["facebook_id"].int {user.facebookID = facebookID}
//        if let phone = response["phone"].string {user.phone = phone}
//        if let avatarUrl = response["avatar"].string {user.avatarUrl = avatarUrl}
//
//        if let userLastNameScore = response["user"]["last_name"].string {user.userLastNameScore = userLastNameScore}
//        
//        
//        if let userAvatarStringScore = response["user"]["avatar"].string {user.userAvatarStringScore = userAvatarStringScore}
//        
//        return user
//    }
//    
//    
//    static func getUsersFrom(responce: JSON) -> [UserModel] {
//        var users = [UserModel]()
//        
//        for (_,subJson):(String, JSON) in responce {
//            users.append(UserModel.userFromResponse(subJson))
//        }
//        
//        return users
//    }
//

}
