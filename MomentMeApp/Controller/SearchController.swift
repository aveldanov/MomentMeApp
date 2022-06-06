//
//  SearchController.swift
//  MomentMeApp
//
//  Created by Anton Veldanov on 3/6/22.
//

import UIKit

class SearchController: UITableViewController{
    
    
    private var users = [User]()
    private var filteredUsers = [User]()
    private let searchController = UISearchController(searchResultsController: nil)
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSearchController()
        configureUI()
        fetchUsers()
    }
    
    
    // MARK: - API
    
    func fetchUsers(){
        UserService.fetchUsers { users in
            self.users = users
            self.tableView.reloadData()
        }
        
    }
    
    
    
    // MARK: - Helpers
    
    func configureUI(){
        view.backgroundColor = .white
        
        tableView.register(UserCell.self, forCellReuseIdentifier: UserCell.identifier)
        tableView.rowHeight = 64
    }
    
    func configureSearchController(){
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = false
    }
}

// MARK: - UITableViewDataSource

extension SearchController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserCell.identifier, for: indexPath) as! UserCell
        cell.viewModel = UserCellViewModel(user: users[indexPath.row])
        return cell
    }
    
    
}

// MARK: - UITableViewDelegate

extension SearchController{
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ProfileController(user: users[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
}


// MARK: - UISearchResultsUpdating

extension SearchController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text?.lowercased() else{
            return
        }
        
        filteredUsers = users.filter{$0.username.contains(searchText) || $0.fullname.contains(searchText)}
        self.tableView.reloadData()
    }
}
