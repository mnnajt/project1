//
//  Endpoint.swift
//  project1
//
//  Created by Michał Kaliniak on 11/04/2019.
//  Copyright © 2019 MNNAJT. All rights reserved.
//

import Foundation

protocol Endpoint {
    func pathWithInfo(_ info: String) -> String
}

enum Tumblr {
    case read
}

extension Tumblr: Endpoint {
    func pathWithInfo(_ info: String) -> String {
        switch self {
        case .read: return "https://[info].tumblr.com/api/read/json".replacingOccurrences(of: "[info]", with: info)
        }
    }
}
