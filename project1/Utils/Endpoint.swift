//
//  Endpoint.swift
//  project1
//
//  Created by Michał Kaliniak on 11/04/2019.
//  Copyright © 2019 MNNAJT. All rights reserved.
//

import Foundation

protocol Endpoint {
    
    func pathWithInfo(_ info: (query : String, page : Int)) -> String
}

enum Github {
    case searchRepository
}

extension Github: Endpoint {
    func pathWithInfo(_ info: (query: String, page: Int)) -> String {
        switch self {
        case .searchRepository: return "https://api.github.com/search/repositories?q=[info]".replacingOccurrences(of: "[info]", with: info.query) + "&page=\(info.page)"
        }
    }
}
