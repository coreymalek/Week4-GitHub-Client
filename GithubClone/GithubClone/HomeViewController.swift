//
//  HomeViewController.swift
//  GithubClone
//
//  Created by Corey Malek on 11/1/16.
//  Copyright © 2016 Corey Malek. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate, UIViewControllerTransitioningDelegate {

    @IBOutlet weak var repoSearch: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    let customTransition = CustomTransition()
    
    var repositoryList = [Repository]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    
    //MARK: functions that conform to stated protocols
    
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return self.customTransition
        
    }
    
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        repositoryList = repositoryList.filter { (repository) -> Bool in
            return repository.name.contains(searchBar.text!)
        
        }
        
    }
    
    
    
    
    
    
    //MARK: override functions

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.repoSearch.delegate = self
        
        let nib = UINib(nibName: "RepoDetailTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: RepoDetailTableViewCell.identifier())
        
        update()
        
    }

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    //MARK: update function
    
    func update() {
        
        GithubService.shared.fetchRepos { (repositories) in
            if let repositories = repositories {
                self.repositoryList = repositories
            }
            
        }
    }
    
    
    
    
    //MARK: segue function
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == RepoDetialViewController.identifier() {
            
            if let destinationController = segue.destination as? RepoDetialViewController {
                
                destinationController.transitioningDelegate = self
                
            }
            
        }
    }
    
    
    
    
    //MARK: tableView functions
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.repositoryList.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: RepoDetailTableViewCell.identifier(), for: indexPath) as? RepoDetailTableViewCell
        
        let cell = tableView.dequeueReusableCell(withIdentifier: RepoDetailTableViewCell.identifier()) as! RepoDetailTableViewCell
//        
//        cell.repoName.text = repositoryList[indexPath.row].name
//        
//        cell.repoDescription.text = repositoryList[indexPath.row].description
//
        cell.textLabel?.text = repositoryList[indexPath.row].name
        cell.detailTextLabel?.text = repositoryList[indexPath.row].description
//
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: RepoDetialViewController.identifier(), sender: nil)
    }
    
    
    
    
    
}
    



