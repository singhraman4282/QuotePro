//
//  QuoteManager.swift
//  QuotePro
//
//  Created by Raman Singh on 2018-05-22.
//  Copyright © 2018 Raman Singh. All rights reserved.
//

import UIKit

protocol QuoteProtocol {
    func addQuote(quote:Quote)
}

protocol PhotoProtocol {
    func updatePhoto(photo:UIImage)
}


class NetworkManager: NSObject {
    
    var quoteDelegate:QuoteProtocol!
    var photoDelegate:PhotoProtocol!
    
    func downloadQuote() {
        let urlString = "http://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json"
        
        let url = NSURL(string: urlString)
        var urlRequest = URLRequest(url: url! as URL)
        urlRequest.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler:
        { (data: Data?, response: URLResponse?, error: Error?) in
            
            guard let data = data, error == nil else {
                print("error=\(String(describing: error))")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(String(describing: response))")
            }
            
            if let userData = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions(rawValue: JSONSerialization.ReadingOptions.RawValue(0))) as! Dictionary<String, Any>
            {
//                print(userData)
                OperationQueue.main.addOperation {
                    self.quoteDelegate.addQuote(quote:Quote(quote: userData["quoteText"] as! String, author: userData["quoteAuthor"] as! String))
                }
            }
        })
        task.resume()
    }//downloadQuote
    
    func downloadPhoto(index:Int) {
        let urlString = "https://api.flickr.com/services/rest/?method=flickr.photos.search&format=json&nojsoncallback=1&api_key=df067bfc5c1fcc1d784b40d2751e0355&tags=amazingview"
        
        let url = NSURL(string: urlString)
        var urlRequest = URLRequest(url: url! as URL)
        urlRequest.httpMethod = "GET"
        
        
        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler:
        { (data: Data?, response: URLResponse?, error: Error?) in
            
            guard let data = data, error == nil else {
                print("error=\(String(describing: error))")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(String(describing: response))")
            }
            
            if let userData = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions(rawValue: JSONSerialization.ReadingOptions.RawValue(0))) as! Dictionary<String, Any>
            {
//                    print(userData)
                if let recievedDictionary = userData["photos"] as? Dictionary<String, AnyObject> {
                    let photoArray:[Dictionary<String, AnyObject>] = (recievedDictionary["photo"] as? [Dictionary<String, AnyObject>])!
                    let currentPhotoDictionary = photoArray[index] as Dictionary<String, AnyObject>
                    let photo = Photo()
                    photo.farm = currentPhotoDictionary["farm"] as! Int
                    photo.photoID = currentPhotoDictionary["id"] as! String
                    photo.isfamily = currentPhotoDictionary["isfamily"] as! Int
                    photo.isfriend = currentPhotoDictionary["isfriend"] as! Int
                    photo.ispublic = currentPhotoDictionary["ispublic"] as! Int
                    photo.owner = currentPhotoDictionary["owner"] as! String
                    photo.secret = currentPhotoDictionary["secret"] as! String
                    photo.server = currentPhotoDictionary["server"] as! String
                    photo.title = currentPhotoDictionary["title"] as! String
                    photo.photoURL = photo.makeURL()!
                    self.makeImageFromUrl(photoURL: photo.photoURL, photo: photo)
                }
            }
        })
        task.resume()
    }//downloadPhoto
    
    
    func makeImageFromUrl(photoURL:String, photo:Photo) {
        
        let url = NSURL(string:photoURL)
        let urlRequest = URLRequest(url: url! as URL)
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        let task = session.dataTask(with: urlRequest, completionHandler:
        { (data: Data?, response: URLResponse?, error: Error?) in
            
            if (error != nil)  {
                print(error as Any)
            } else {
                OperationQueue.main.addOperation {
                    if let bach = UIImage(data: data!) {
                        photo.image = bach
                        
                        self.photoDelegate.updatePhoto(photo: bach)
                    }
                }
            }//else
        })
        
        task.resume()
        
    }//makeImageFromUrl
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}


