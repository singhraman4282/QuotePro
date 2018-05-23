//
//  SavedQuotesViewController.swift
//  QuotePro
//
//  Created by Raman Singh on 2018-05-23.
//  Copyright © 2018 Raman Singh. All rights reserved.
//

import UIKit

import RealmSwift

class SavedQuotesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableView: UITableView!
    
    var savedQuotes: Results<QuotePhoto>!
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        savedQuotes = realm.objects(QuotePhoto.self)
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
    


}
