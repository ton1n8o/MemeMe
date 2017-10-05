//
//  DetailViewController.swift
//  MemeMe
//
//  Created by Antonio da Silva on 05/10/2017.
//  Copyright © 2017 TNTStudios. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var meme: Meme?

    @IBOutlet weak var memeImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let meme = meme {
            memeImage.image = meme.memedImage
        }
    }
    
}
