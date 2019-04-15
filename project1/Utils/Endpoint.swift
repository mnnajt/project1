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

enum Tumblr {
    case searchRepository
}

extension Tumblr: Endpoint {
    func pathWithInfo(_ info: (query: String, page: Int)) -> String {
        switch self {
        case .searchRepository: return "https://api.github.com/search/repositories?q=[info]".replacingOccurrences(of: "[info]", with: info.query) + "&per_page=20" + "&page=\(info.page)"
        }
    }
}
