//
//  Quote.swift
//  QuotePro
//
//  Created by Raman Singh on 2018-05-22.
//  Copyright © 2018 Raman Singh. All rights reserved.
//

import UIKit

class Quote: NSObject {

    var quoteText = ""
    var  quoteAuthor = ""
    
     init(quote:String, author:String) {
        self.quoteText = quote
        self.quoteAuthor = author
    }
    
}
