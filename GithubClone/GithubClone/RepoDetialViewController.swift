//
//  RepoDetialViewController.swift
//  GithubClone
//
//  Created by Corey Malek on 11/2/16.
//  Copyright © 2016 Corey Malek. All rights reserved.
//

import UIKit

class RepoDetialViewController: UIViewController {

    @IBOutlet weak var repoName: UILabel!
    
    @IBOutlet weak var repoLanguage: UILabel!
    
    @IBOutlet weak var repoDescription: UILabel!
    
    
    @IBAction func backToHomeView(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    var repo: Repository!
        

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.repoName.text = repo.name
        self.repoDescription.text = repo.description
        self.repoLanguage.text = repo.language
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
}
