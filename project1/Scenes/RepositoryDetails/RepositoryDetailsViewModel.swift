//
//  RepositoryDetailsViewModel.swift
//  project1
//
//  Created by Michał Kaliniak on 16/04/2019.
//  Copyright © 2019 MNNAJT. All rights reserved.
//

import UIKit

class RepositoryDetailsViewModel: NSObject {

    public weak var delegate : ViewModelDelegate?
    public var repository : RepositoryResponse? {
        didSet {
            delegate?.needViewUpdate()
        }
    }
    
    public var name : String {
        return repository?.name ?? ""
    }
    
    public var fullName : String {
        return repository?.full_name ?? ""
    }
    
    public var repositoryDescription : String {
        return repository?.description ?? ""
    }
    
}
