//
//  FeedTableViewCell.swift
//  FlickrPickr
//
//  Created by Hamon Riazy on 13/07/2017.
//  Copyright © 2017 Hamon Riazy. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell, Reusable {
    
    @IBOutlet var feedImageView: UIImageView!
    
    var feedItem: FeedItem? {
        didSet {
            guard let feedItem = feedItem else { return }
            feedImageView.loadImage(withUrlString: feedItem.media.urlString)
        }
    }
    
}
