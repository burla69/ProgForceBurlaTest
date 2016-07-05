//
//  ViewController.swift
//  ProgForceBurlaTest
//
//  Created by Александр on 05.07.16.
//  Copyright © 2016 Александр. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var knowMoreLabel: UILabel!
    
    @IBOutlet weak var userNameTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.prepareUI()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func prepareUI() {
        
        if let appName =  NSBundle.mainBundle().infoDictionary!["CFBundleName"]{self.title = appName as? String}
        
    }
    
    //Mark: - Actions
    
    @IBAction func goButtonAction(sender: AnyObject) {
        
        let whitespace = NSCharacterSet.whitespaceCharacterSet()
        
        let containSpace = userNameTextField.text!.rangeOfCharacterFromSet(whitespace)
        
        if userNameTextField.text!.characters.count == 0 || containSpace != nil {
            
            let alertController = UIAlertController(title: "ProgForceBurlaTest", message: "Please, enter user name without spaces", preferredStyle: .Alert)
            
            let OKAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in
                
            }
            
            alertController.addAction(OKAction)
            
            self.presentViewController(alertController, animated: true) {
                // ...
            }
            
        } else {
            NetworkManager.sharedManager.getUserRepos(self.userNameTextField.text!) { (success, response, error) in
                print("response: \(response)")
                
                if success {
                    print("response: \(response)")
                    
                    let reposArray = RepoModel.getReposFrom(response!)
                    
                    self.performSegueWithIdentifier("showUserRepo", sender: reposArray)
                    
                } else {
                    print("error: \(error?.localizedDescription)")
                }
                
            }
        }
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showUserRepo" {
            let viewController:UserReposViewController = segue.destinationViewController as! UserReposViewController
            viewController.reposList = sender as! [RepoModel]
        }
    }
    


}

