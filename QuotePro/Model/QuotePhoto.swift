//
//  QuotePhoto.swift
//  QuotePro
//
//  Created by Raman Singh on 2018-05-23.
//  Copyright © 2018 Raman Singh. All rights reserved.
//

import UIKit
import RealmSwift
import Realm

class QuotePhoto: Object {
    

    @objc dynamic var quote:String!
    @objc dynamic var photo: Data!
    
}
