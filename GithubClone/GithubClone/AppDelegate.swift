//
//  AppDelegate.swift
//  GithubClone
//
//  Created by Corey Malek on 10/31/16.
//  Copyright © 2016 Corey Malek. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var authController: AuthViewController?
    var homeController: HomeViewController? 


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        checkAuthStatus()
        
        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        
        
        GithubService.shared.tokenRequestFor(url: url, options: .userDefaults, completion: {(success) in
            if let authController = self.authController, let homeController = self.homeController {
                
                authController.dismissAuthController()
                
            }
            
        
        })
       
        
        
        return true
        
    }
    
    func checkAuthStatus() {
        if let token = UserDefaults.standard.getAccessToken() {    // what does 'standard' do?
            print(token)
            
        } else {
            
            if let homeViewController = self.window?.rootViewController as? HomeViewController,
                let storyboard = homeViewController.storyboard {
                
                
                if let authViewController = storyboard.instantiateViewController(withIdentifier: AuthViewController.identifier) as? AuthViewController {
                    
                    
                    homeViewController.addChildViewController(authViewController)
                    homeViewController.view.addSubview(authViewController.view)
                    
                    authViewController.didMove(toParentViewController: homeViewController)
                    
                    self.authController = authViewController
                    self.homeController = homeViewController
                    
                    
                }
                
                
            }
            
            
        }
        
    }
    
    
}
