//
//  Extensions.swift
//  GithubClone
//
//  Created by Corey Malek on 10/31/16.
//  Copyright © 2016 Corey Malek. All rights reserved.
//

import UIKit

extension UIResponder {
    
    class func identifier() -> String {
        return String(describing: self)
    }
    
}



extension UserDefaults {
    
    
    
    func getAccessToken() -> String? {
        
       return self.string(forKey: "access_token")
        
    }
    
    
    
    
    func save(accessToken: String) -> Bool {
        
        self.set(accessToken, forKey: "access_token")
        
        return synchronize()
        
    }
    
    
    
}
