//
//  ViewController.swift
//  FlickrPickr
//
//  Created by Hamon Riazy on 13/07/2017.
//  Copyright © 2017 Hamon Riazy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    let session = Session()
    var feed: Feed?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        session.fetchFeed { (result) in
            switch result {
            case .success(let feed):
                self.feed = feed
                self.tableView.reloadData()
            case .failure(let error):
                // TODO: show the error
                break
            }
        }
    }
    
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feed?.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FeedTableViewCell = tableView.dequeueReusableCell(indexPath: indexPath)
        cell.feedItem = feed?.items[indexPath.row]
        return cell
    }
    
}

