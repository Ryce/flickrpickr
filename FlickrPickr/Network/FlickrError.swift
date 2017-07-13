//
//  FlickrError.swift
//  FlickrPickr
//
//  Created by Hamon Riazy on 13/07/2017.
//  Copyright © 2017 Hamon Riazy. All rights reserved.
//

import Foundation

enum FlickrError: Error {
    
    case noInternet
    case parsing
    case statusCode(Int)
    case serializationFailed
    case requestFailed
    case unknown
    
}
