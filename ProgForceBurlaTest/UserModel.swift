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
    
    var name = ""
    var company = ""
    var email = ""
    
    var userAvatar = ""
    
    var followersCount = 0
    var followingCount = 0
    var publicGists = 0
    var publicRepos = 0

    static func userFromResponse(response : JSON) -> UserModel{
        
        let user = UserModel()
        if let name = response["name"].string {user.name = name}
        if let company = response["company"].string {user.company = company}
        if let email = response["email"].string {user.email = email}
        if let userAvatar = response["avatar_url"].string {
            user.userAvatar = userAvatar
        }


        if let followersCount = response["followers"].int {user.followersCount = followersCount}
        if let followingCount = response["following"].int {user.followingCount = followingCount}
        if let publicGists = response["public_gists"].int {user.publicGists = publicGists}
        if let publicRepos = response["public_repos"].int {user.publicRepos = publicRepos}

        return user
    }

}
