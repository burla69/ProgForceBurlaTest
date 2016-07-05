//
//  UserReposViewController.swift
//  ProgForceBurlaTest
//
//  Created by Александр on 05.07.16.
//  Copyright © 2016 Александр. All rights reserved.
//

import UIKit

class UserReposViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var folowingCount: UILabel!
    @IBOutlet weak var folowersCount: UILabel!
    @IBOutlet weak var publicGists: UILabel!
    @IBOutlet weak var publicRepos: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var reposList: [RepoModel] = []
    
    var userName : String? {
        didSet {
            self.getUserProfile()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func getUserProfile() {
        
        NetworkManager.sharedManager.getUserProfile(self.userName!) { (success, response, error) in
            print("getUserProfile: \(response)")
            
            if success {

                let user = UserModel.userFromResponse(response!)
                
                self.prapareUI(user)
                
            } else {
                print("error: \(error?.localizedDescription)")
            }
            
        }
        
    }
    
    func prapareUI(user: UserModel) {
        
        let url = NSURL(string: user.userAvatar)
        let data = NSData(contentsOfURL: url!)
        avatarImageView.image = UIImage(data: data!)
        
        if user.company == "" {
            nameLabel.text = "\(user.name), \(user.email)"
        } else {
            nameLabel.text = "\(user.name), \(user.company), \(user.email)"
        }
        
        folowingCount.text = "Folowing count: \(user.followingCount)"
        folowersCount.text = "Folowers count: \(user.followersCount)"
        publicGists.text = "Public gists: \(user.publicGists)"
        publicRepos.text = "Public repos: \(user.publicRepos)"

    }
    

    // MARK: - Table view data source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.reposList.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 61
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! RepoCell
        
        let repo = reposList[indexPath.row]
        
        cell.repo = repo
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }


}
