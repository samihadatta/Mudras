//
//  Mudra.swift
//  Mudras
//
//  Created by Samiha Datta on 5/9/19.
//  Copyright © 2019 Samiha Datta. All rights reserved.
//

import UIKit

class Mudra: NSObject {
    var name: String
    var type: String
    var meaning: String
    var index: Int
    var photo: String
    
    init(name: String, type: String, meaning: String, index: Int, photo: String) {
        self.name = name
        self.type = type
        self.meaning = meaning
        self.index = index
        self.photo = photo
    }
    
}
