//
//  DetailViewController.swift
//  Mudras
//
//  Created by Samiha Datta on 5/14/19.
//  Copyright © 2019 Samiha Datta. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var typeLabel: UILabel!
    @IBOutlet private weak var meaningLabel: UILabel!
    
    var mudra: Mudra?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Display Mudra info
        if let mudra = mudra {
            navigationItem.title = mudra.name
            imageView.image = UIImage(named: mudra.photo)
            nameLabel.text = mudra.name
            typeLabel.text = mudra.type
            meaningLabel.text = mudra.meaning
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
