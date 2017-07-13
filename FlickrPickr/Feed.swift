//
//  Feed.swift
//  FlickrPickr
//
//  Created by Hamon Riazy on 13/07/2017.
//  Copyright © 2017 Hamon Riazy. All rights reserved.
//

import Foundation

struct Feed: Codable {
    
    var title: String
    var link: String
    var description: String
    var modified: Date
    var generator: String
    var items: [FeedItem]
    
}
