//
//  Session.swift
//  FlickrPickr
//
//  Created by Hamon Riazy on 13/07/2017.
//  Copyright © 2017 Hamon Riazy. All rights reserved.
//

import Foundation

typealias Dict = [String: Any]

struct Session {
    
    enum Environment {
        static let endpointUrl = URL(string: "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1")!
    }
    
    func fetchFeed(completion: @escaping (Result<Feed>) -> Void) {
        
        var urlRequest = URLRequest(url: Environment.endpointUrl)
        urlRequest.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            var result: Result<Feed>!
            
            defer {
                DispatchQueue.main.async {
                    completion(result)
                }
            }
            
            guard let response = response as? HTTPURLResponse else {
                result = .failure(FlickrError.unknown)
                return // BAIL
            }
            
            switch response.statusCode {
            case 400..<600:
                result = .failure(FlickrError.statusCode(response.statusCode))
                return // BAIL
            default:
                break
            }
            
            let feed: Feed
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                feed = try decoder.decode(Feed.self, from: data!)
            } catch (let decodingError) {
                result = .failure(decodingError)
                return // BAIL
            }
            
            result = .success(feed)
        }
        
        task.resume()
        
    }
    
    func basicValidation(_ data: Data?, _ response: URLResponse?, _ error: Error?) throws -> Dict {
        
        // Error handling
        if data == nil, let error = error {
            throw error
        }
        
        // Unwrap response data
        guard let data = data else {
            throw FlickrError.requestFailed
        }
        
        // Serialize JSON Dictionary and unwrap
        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? Dict, let upJson = json else {
            throw FlickrError.serializationFailed
        }
        
        return upJson
    }
    
}
