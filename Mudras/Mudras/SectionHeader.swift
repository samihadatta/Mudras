//
//  SectionHeader.swift
//  Mudras
//
//  Created by Samiha Datta on 5/15/19.
//  Copyright © 2019 Samiha Datta. All rights reserved.
//

import UIKit

class SectionHeader: UICollectionReusableView {
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    var section: Section! {
        didSet {
            titleLabel.text = section.title
        }
    }
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    
}

