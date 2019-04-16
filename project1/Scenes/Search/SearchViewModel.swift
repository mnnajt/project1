//
//  SearchViewModel.swift
//  project1
//
//  Created by Michał Kaliniak on 15/04/2019.
//  Copyright © 2019 MNNAJT. All rights reserved.
//

import UIKit

class SearchViewModel: NSObject {

    public weak var delegate : ViewModelDelegate?
    private var currentPage : Int = 0
    private var lastQuery: String?
    private var reposResponse : RepositoriesResponse?
    private var items : [RepositoryResponse]?
    
    override init() {
        super.init()
    }
    
    public func searchReposForQuery(_ query : String) {
        
        if query.count == 0 {
            return
        }
        
        if query == lastQuery {
            currentPage += 1
        }
        else {
            currentPage = 0
        }
        lastQuery = query
        
        let fetcher : GithubRepositoriesFetcher = GithubRepositoriesFetcher.init(networking: Networking())
        fetcher.fetch(query: query, page: currentPage) { (response) in
            
            DispatchQueue.main.async {
                guard let response = response else { return }
                self.reposResponse = response
                if self.currentPage == 0 {
                    self.items = response.items
                    self.delegate?.needViewUpdate()
                } else {
                    self.items?.append(contentsOf: response.items)
                    self.delegate?.needViewUpdateWithNewData()
                }
            }
        }
    }
    
    public func repositoryForIndex(index : Int) -> RepositoryResponse {
        return items![index]
    }
    
    public func repositoriesCount() -> Int {
        return items?.count ?? 0
    }
    
    public func newElementsCount() -> Int {
        return reposResponse?.items.count ?? 0
    }
}
