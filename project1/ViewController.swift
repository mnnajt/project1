//
//  ViewController.swift
//  project1
//
//  Created by Michał Kaliniak on 11/04/2019.
//  Copyright © 2019 MNNAJT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let fetcher : TumblrUserFetcher = TumblrUserFetcher.init(networking: Networking())
        fetcher.fetch(query: "afnetworking", page: 0) { (response) in
            
            print("ok")
        }
        
    }


}

