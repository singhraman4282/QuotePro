//
//  ShowQuoteViewController.swift
//  QuotePro
//
//  Created by Raman Singh on 2018-05-23.
//  Copyright © 2018 Raman Singh. All rights reserved.
//

import UIKit
import RealmSwift


class ShowQuoteViewController: UIViewController {
    
    var recievedQuote:QuotePhoto!
    
    @IBOutlet var quoteLabel: shadowText!
    
    @IBOutlet var containerView: UIView!
    @IBOutlet var imageView: UIImageView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCurrentView()
    }
    
    
    func updateCurrentView() {
        imageView.image = UIImage(data:recievedQuote.photo,scale:1.0)
        quoteLabel.text = recievedQuote.quote
    }

    @IBAction func takeScreenshot(_ sender: Any) {
        captureAndShare()
    }
    
    
    func captureAndShare() {
        UIGraphicsBeginImageContext(containerView.frame.size)
        containerView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let activityViewController = UIActivityViewController(activityItems: [image!], applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    
    
}
