//
//  Result.swift
//  FlickrPickr
//
//  Created by Hamon Riazy on 13/07/2017.
//  Copyright © 2017 Hamon Riazy. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)
}
