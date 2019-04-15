//
//  SearchViewController.swift
//  project1
//
//  Created by Michał Kaliniak on 15/04/2019.
//  Copyright © 2019 MNNAJT. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    private let resultTableView = UITableView()
    private let viewModel : SearchViewModel
    private let searchController = UISearchController(searchResultsController: nil)
//    private let searchBar : UISearchBar = UISearchBar.init()

    
    init(viewModel: SearchViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        definesPresentationContext = true
        
        searchController.searchBar.delegate = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        resultTableView.tableHeaderView = searchController.searchBar

        resultTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(resultTableView)
        resultTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        resultTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        resultTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        resultTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        resultTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        viewModel.delegate = self
        resultTableView.dataSource = self
        resultTableView.delegate = self
        
        
    }
}

extension SearchViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.repositoriesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = viewModel.repositoryForIndex(index: indexPath.row).name ?? "No name"
        
        
        
        return cell
    }
}

extension SearchViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == viewModel.repositoriesCount() - 1 {
            viewModel.searchReposForQuery(searchController.searchBar.text ?? "")
        }
    }
}


extension SearchViewController : UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel.searchReposForQuery(searchBar.text ?? "")
        print(searchBar.text ?? "")
    }
}


extension SearchViewController : ViewModelDelegate {
    
    func needViewUpdate() {
        resultTableView.reloadData()
    }
    
    func needViewUpdateWithNewData() {
        var indexPaths = [IndexPath]()
        
        for i in viewModel.repositoriesCount() - viewModel.newElementsCount() ..< viewModel.repositoriesCount() {
            indexPaths.append(IndexPath(row: i, section: 0))
        }
        
        resultTableView.insertRows(at: indexPaths, with: .automatic)
    }
    
}