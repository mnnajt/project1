//
//  Protocols.swift
//  project1
//
//  Created by Michał Kaliniak on 15/04/2019.
//  Copyright © 2019 MNNAJT. All rights reserved.
//

import Foundation

protocol ViewModelDelegate : class {
    func needViewUpdate()
    func needViewUpdateWithNewData()
    
}
