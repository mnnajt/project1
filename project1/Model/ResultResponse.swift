//
//  ResultResponse.swift
//  project1
//
//  Created by Michał Kaliniak on 15/04/2019.
//  Copyright © 2019 MNNAJT. All rights reserved.
//

import Foundation

struct RepositoriesResponse : Codable {
    public let total_count : Int
    public let incomplete_results: Bool
    public let items : [RepositoryResponse]
}

public struct RepositoryResponse : Codable {
    public let id : Int
    public let node_id : String?
    public let name : String?
    public let full_name : String?
//    public let private : Bool
//    public let owner : [OwnerResponse]
    public let html_url : String?
    public let description : String?
    public let fork : Bool?
    public let url : String?
    public let forks_url : String?
    
    
    public let created_at : String?
    public let stargazers_count : Int?
    public let watchers_count : Int?
    public let language : String?
    public let license : LicenseResponse?
}

public struct LicenseResponse : Codable {
    public let key : String?
    public let name : String?
    public let url : String?
}
