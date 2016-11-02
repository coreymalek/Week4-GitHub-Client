//
//  Repository.swift
//  GithubClone
//
//  Created by Corey Malek on 11/1/16.
//  Copyright © 2016 Corey Malek. All rights reserved.
//

import Foundation

class Repository {
    
    let name: String
    let description: String?
    let language: String?
    
    // add more for homework
    
    init?(json: [String: Any]) {
        if let name = json["name"] as? String {
            self.name = name
            self.description = json["description"] as? String
            self.language = json["language"] as? String
        } else {
            return nil
        }
    }
}

