//
//  MemeCollectionViewCell.swift
//  MemeMe
//
//  Created by Antonio da Silva on 04/10/2017.
//  Copyright © 2017 TNTStudios. All rights reserved.
//

import UIKit

class MemeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var memeImage: UIImageView!
    
    func configureWith(meme: Meme) {
        memeImage.image = meme.memedImage
    }
    
}
