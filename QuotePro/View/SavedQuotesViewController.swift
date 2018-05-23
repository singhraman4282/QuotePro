//
//  SavedQuotesViewController.swift
//  QuotePro
//
//  Created by Raman Singh on 2018-05-23.
//  Copyright © 2018 Raman Singh. All rights reserved.
//

import UIKit

class SavedQuotesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, QuoteAndPhotoProtocol {
    @IBOutlet var tableView: UITableView!
    
    var savedQuotes:[QuotePhoto] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.reloadData()
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedQuotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:QuoteCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! QuoteCell
        
        cell.setupCell(_with: savedQuotes[indexPath.row])
        
        return cell
    }
    
    func addQuoteAndPhoto(quoteAndPhoto:QuotePhoto) {
        
        savedQuotes.append(quoteAndPhoto)
        tableView.reloadData()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addQuote" {
            if let qvc:ViewController = segue.destination as! ViewController {
                qvc.delegate = self
            }
        }
    }
    


}
