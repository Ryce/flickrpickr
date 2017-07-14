//
//  FeedItem.swift
//  FlickrPickr
//
//  Created by Hamon Riazy on 13/07/2017.
//  Copyright © 2017 Hamon Riazy. All rights reserved.
//

import Foundation

struct FeedItem: Codable {
    
    private enum CodingKeys: String, CodingKey {
        case title
        case link
        case media
        case dateTaken = "date_taken"
        case description
        case publishedDate
        case author
        case authorId = "author_id"
        case tags
    }
    
    var title: String
    var link: String
    var media: Media
    var dateTaken: Date
    var description: String
    var publishedDate: Date
    var author: String
    var authorId: String
    var tags: String
}

struct Media: Codable {
    
    private enum CodingKeys: String, CodingKey {
        case urlString = "m"
    }
    
    var urlString: String
}
