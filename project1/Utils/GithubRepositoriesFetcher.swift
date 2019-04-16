//
//  TumblrUserFetcher.swift
//  project1
//
//  Created by Michał Kaliniak on 11/04/2019.
//  Copyright © 2019 MNNAJT. All rights reserved.
//

import Foundation

struct GithubRepositoriesFetcher {
    let networking: Networking
    
    init(networking: Networking) {
        self.networking = networking
    }
    
    public func fetch(query : String, page : Int, response: @escaping (RepositoriesResponse?) -> Void) {
        
        networking.request(from: Github.searchRepository.pathWithInfo((query, page))) { (data, error) in
            if let error = error {
                print("Error received: \(error.localizedDescription)")
                response(nil)
            }
            
            let decoded = self.decodeJSON(type: RepositoriesResponse.self, from: data)
            if let decoded = decoded {
                print("returned: \(decoded)")
            }
            response(decoded)
        }
    }
        
    private func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        if let data = from {
            do {
                let response = try JSONDecoder().decode(type.self, from: data)
                return response
            } catch {
                print(error)
            }
        }

        return nil
    }
}
