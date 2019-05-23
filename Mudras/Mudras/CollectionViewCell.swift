//
//  CollectionViewCell.swift
//  Mudras
//
//  Created by Samiha Datta on 5/21/19.
//  Copyright © 2019 Samiha Datta. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var titleLabel:UILabel!
    @IBOutlet private weak var mainImage: UIImageView!
    
    var mudra: Mudra? {
        didSet {
            if let mudra = mudra {
                mainImage.image = UIImage(named: mudra.photo)
                titleLabel.text = mudra.name
            }
        }
    }
    
    override func prepareForReuse() {
        mainImage.image = nil
    }
}
