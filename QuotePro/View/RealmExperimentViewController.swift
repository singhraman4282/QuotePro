//
//  RealmExperimentViewController.swift
//  QuotePro
//
//  Created by Raman Singh on 2018-05-23.
//  Copyright © 2018 Raman Singh. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class RealmExperimentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let realm = try! Realm()

        let puppies = realm.objects(Dog.self)
        let thisPuppy = puppies[0]
        print(thisPuppy.name)
        
        
//        let myDog = Dog()
//        myDog.name = "Rex"
//        myDog.age = 1
//
//
//        try! realm.write {
//            realm.add(myDog)
//        }
//
        
    }//load

    

}//end


class Dog: Object {
    @objc dynamic var name = ""
    @objc dynamic var age = 0
}
class Person: Object {
    @objc dynamic var name = ""
    @objc dynamic var picture: Data? = nil // optionals supported
    let dogs = List<Dog>()
}
