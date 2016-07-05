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
    
    var user : UserModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = userName
        self.navigationController?.navigationBar.topItem?.title = ""
        let button = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Action, target: self, action: #selector(UserReposViewController.theeDotsTap(_:)))
        self.navigationItem.rightBarButtonItem = button
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func getUserProfile() {
        
        NetworkManager.sharedManager.getUserProfile(self.userName!) { (success, response, error) in
            print("getUserProfile: \(response)")
            
            if success {

                self.user = UserModel.userFromResponse(response!)
                
                self.prapareUI(self.user!)
                
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
    
    func goBack()
    {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    // MARK: - Action Sheet
    
    func theeDotsTap(sender: AnyObject) {
        
        let alertController = UIAlertController(title: nil, message: "Choose action:", preferredStyle: .ActionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            // ...
        }
        alertController.addAction(cancelAction)
        
        let openBrowser = UIAlertAction(title: "Open in browser", style: .Default) { (action) in
            UIApplication.sharedApplication().openURL(NSURL(string: (self.user?.htmlURL)!)!)
        }
        alertController.addAction(openBrowser)
        
        let share = UIAlertAction(title: "Share", style: .Default) { (action) in
            
            let textToShare = "Awesome user!  Check out this amazing user!"
            
            if let website = NSURL(string: (self.user?.htmlURL)!) {
                let objectsToShare = [textToShare, website]
                let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
                
                activityVC.popoverPresentationController?.sourceView = sender as? UIView
                self.presentViewController(activityVC, animated: true, completion: nil)
                
            }

        }
        alertController.addAction(share)
        
        
        self.presentViewController(alertController, animated: true) {
            // ...
        }
        
        
        
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
