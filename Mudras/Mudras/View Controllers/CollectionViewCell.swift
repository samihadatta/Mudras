//
//  CollectionViewCell.swift
//  Mudras
//
//  Created by Samiha Datta on 5/14/19.
//  Copyright © 2019 Samiha Datta. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var titleLabel:UILabel!
    @IBOutlet private weak var mudraImage: UIImageView!
    
    var mudra: Mudra? {
        didSet {
            if let mudra = mudra {
                mudraImage.image = UIImage(named: mudra.photo)
                titleLabel.text = mudra.name
            }
        }
    }
    
    override func prepareForReuse() {
        mudraImage.image = nil
    }
}

