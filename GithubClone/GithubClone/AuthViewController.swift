//
//  AuthViewController.swift
//  GithubClone
//
//  Created by Corey Malek on 11/1/16.
//  Copyright © 2016 Corey Malek. All rights reserved.
//


import UIKit

class AuthViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
      // change action to 'login', sender 'Any'

    @IBAction func loginPressed(_ sender: AnyObject) {
        let parameters = ["scope":"user:email,repo"]
        
        GithubService.shared.oAuthWith(parameters: parameters)
        
    }
    
    
    func dismissAuthController() {
        
        self.view.removeFromSuperview()
        self.removeFromParentViewController()
        
        
        // what is the difference between child/parent and superview/subview?
        
        
    }
    
    
    
}
