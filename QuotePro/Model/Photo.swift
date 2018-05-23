//
//  Photo.swift
//  QuotePro
//
//  Created by Raman Singh on 2018-05-22.
//  Copyright © 2018 Raman Singh. All rights reserved.
//

import UIKit

class Photo: NSObject {
    var photoID = ""
    var owner = ""
    var secret = ""
    var server = ""
    var farm = 0
    var title = ""
    var ispublic = 0;
    var isfriend = 0;
    var isfamily = 0;
    var photoURL = ""
    var image = UIImage()
    
    func makeURL() -> String? {
        var url = String()
        url = "https://farm\(farm).staticflickr.com/\(server)/\(photoID)_\(secret)_m.jpg"
        photoURL = url
        print(url)
        return url
    }
}
