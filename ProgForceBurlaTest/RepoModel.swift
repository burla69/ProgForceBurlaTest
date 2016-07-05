//
//  RepoModel.swift
//  ProgForceBurlaTest
//
//  Created by Александр on 05.07.16.
//  Copyright © 2016 Александр. All rights reserved.
//

import UIKit
import SwiftyJSON


class RepoModel: NSObject {
    
    var name = ""
    var language = ""
    var forks = 0
    var stargazersCount = 0
    
    static func repoFromResponse(response : JSON) -> RepoModel{
        
        let repo = RepoModel()
        if let name = response["name"].string {repo.name = name}
        if let language = response["language"].string {repo.language = language}
        if let stargazersCount = response["stargazers_count"].int {repo.stargazersCount = stargazersCount}
        if let forks = response["forks"].int {repo.forks = forks}

        return repo
    }
    
    static func getReposFrom(responce: JSON) -> [RepoModel] {
        var repos = [RepoModel]()
        
        for (_,subJson):(String, JSON) in responce {
            repos.append(RepoModel.repoFromResponse(subJson))
        }
        
        return repos
    }

}
