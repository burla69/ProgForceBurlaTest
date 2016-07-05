//
//  RepoCell.swift
//  ProgForceBurlaTest
//
//  Created by Александр on 05.07.16.
//  Copyright © 2016 Александр. All rights reserved.
//

import UIKit

class RepoCell: UITableViewCell {

    @IBOutlet weak var repoName: UILabel!
    @IBOutlet weak var repoLanguage: UILabel!
    @IBOutlet weak var repoForksCount: UILabel!
    @IBOutlet weak var repoStarsCount: UILabel!
    
    var repo: RepoModel? {
        didSet {
            prepareUI()
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepareUI() {
        
        repoName.text = repo?.name
        repoLanguage.text = repo?.language
        repoForksCount.text = "\(repo?.forks)"
        repoStarsCount.text = "\(repo?.stargazersCount)"
        
    }

}
