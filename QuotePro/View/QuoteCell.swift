//
//  QuoteCell.swift
//  QuotePro
//
//  Created by Raman Singh on 2018-05-23.
//  Copyright © 2018 Raman Singh. All rights reserved.
//

import UIKit

class QuoteCell: UITableViewCell {

    @IBOutlet var cellImageView: UIImageView!
    @IBOutlet var cellLabel: UILabel!
    
    var recievedQuote:QuotePhoto?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(_with quoteAndPhoto:QuotePhoto) {
        cellImageView.image = UIImage(data:quoteAndPhoto.photo,scale:1.0)
        cellLabel.text = quoteAndPhoto.quote
    }
    
    

}
