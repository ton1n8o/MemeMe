//
//  MemeTableViewCell.swift
//  MemeMe
//
//  Created by Antonio da Silva on 05/10/2017.
//  Copyright © 2017 TNTStudios. All rights reserved.
//

import UIKit

class MemeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var memeImage: UIImageView!
    @IBOutlet weak var labelTop: UILabel!
    @IBOutlet weak var labelBottom: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configWith(_ meme: Meme) {
        memeImage.image = meme.memedImage
        labelTop.text = meme.topText
        labelBottom.text = meme.bottomText
    }
    
}
