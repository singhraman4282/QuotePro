//
//  ViewController.swift
//  QuotePro
//
//  Created by Raman Singh on 2018-05-22.
//  Copyright © 2018 Raman Singh. All rights reserved.
//

import UIKit

import RealmSwift


class ViewController: UIViewController, QuoteProtocol, PhotoProtocol {
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var quoteLabel: UILabel!
    
    let networkManager = NetworkManager()
    var photoIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkManager.downloadQuote()
        networkManager.quoteDelegate = self
        networkManager.downloadPhoto(index: photoIndex)
        networkManager.photoDelegate = self
        photoIndex += 1
        
    }//load
    
    
    func addQuote(quote:Quote) {
        
        quoteLabel.text = quote.quoteText + " - " + quote.quoteAuthor
        quoteLabel.layer.shadowOpacity = 1.0;
        quoteLabel.layer.shadowRadius = 5.0;
        quoteLabel.layer.shadowColor = UIColor.black.cgColor
        quoteLabel.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        
    }
    
    func updatePhoto(photo:UIImage) {
        imageView.image = photo
    }
    
    @IBAction func newQuote(_ sender: Any) {
        
        networkManager.downloadQuote()
        networkManager.quoteDelegate = self
        
    }//newQuote
    
    @IBAction func newPhoto(_ sender: Any) {
        
        networkManager.downloadPhoto(index: photoIndex)
        networkManager.photoDelegate = self
        photoIndex += 1
        if photoIndex > 99 {
            photoIndex = 0
        }
        
    }//newPhoto
    
    @IBAction func save(_ sender: UIButton) {
        
        let quotePhotoObject = QuotePhoto()
        quotePhotoObject.quote = quoteLabel.text!
        
        let imageData: NSData = UIImagePNGRepresentation(imageView.image!)! as NSData
        
        quotePhotoObject.photo = imageData as Data?
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(quotePhotoObject)
        }
        
    }//save
    
    
    
    
    
    
}

