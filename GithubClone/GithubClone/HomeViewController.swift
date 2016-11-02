//
//  HomeViewController.swift
//  GithubClone
//
//  Created by Corey Malek on 11/1/16.
//  Copyright © 2016 Corey Malek. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource {

    @IBOutlet weak var repoSearch: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    
    var repositoryList = [Repository]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        repositoryList = repositoryList.filter { (repository) -> Bool in
            return repository.name.contains(searchBar.text!)
        
        }
        
    }
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.searchBar.delegate = self

        
    }

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func update() {
        
        GithubService.shared.fetchRepos { (repositories) in
            if let repositories = repositories {
                for repository in repositories {
                    print(repository.name)
                }
            }
            
            }
        }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.repositoryList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repositoryListCell")
        
        cell?.textLabel?.text = repositoryList[indexPath.row].name
        cell?.detailTextLabel?.text = repositoryList[indexPath.row].description
    }
    
    
    }
    



