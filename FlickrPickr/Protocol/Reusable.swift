//
//  Reusable.swift
//  FlickrPickr
//
//  Created by Hamon Riazy on 13/07/2017.
//  Copyright © 2017 Hamon Riazy. All rights reserved.
//

import UIKit

protocol Reusable: class {
    
    static var reuseIdentifier: String { get }
    
}

extension Reusable {
    
    static var reuseIdentifier: String {
        // I like to use the class's name as an identifier
        // so this makes a decent default value.
        return String(describing: self)
    }
    
}

