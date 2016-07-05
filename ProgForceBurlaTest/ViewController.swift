//
//  ViewController.swift
//  ProgForceBurlaTest
//
//  Created by Александр on 05.07.16.
//  Copyright © 2016 Александр. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.prepareUI()
        
        
        NetworkManager.sharedManager.getUserRepos("burla69") { (success, response, error) in
            print("response: \(response)")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func prepareUI() {
        
        if let appName =  NSBundle.mainBundle().infoDictionary!["CFBundleName"]{
            self.title = appName as? String
        }
        
    }


}

