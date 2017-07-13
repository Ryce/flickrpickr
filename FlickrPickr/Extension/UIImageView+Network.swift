//
//  UIImageView+Network.swift
//  FlickrPickr
//
//  Created by Hamon Riazy on 13/07/2017.
//  Copyright © 2017 Hamon Riazy. All rights reserved.
//

import UIKit

fileprivate let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    
    func loadImage(withUrlString urlString: String) {
        self.image = nil
        
        // check for cache
        if let cachedImage = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = cachedImage
            return
        }
        
        // download image from url
        let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) -> Void in
            
            guard error == nil, let data = data, let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async(execute: { () -> Void in
                imageCache.setObject(image, forKey: urlString as AnyObject)
                self.image = image
            })
        }).resume()
    }
}
