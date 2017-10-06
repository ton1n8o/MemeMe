
//
//  ViewController+Extension.swift
//  MemeMe
//
//  Created by Antonio da Silva on 06/10/2017.
//  Copyright © 2017 TNTStudios. All rights reserved.
//

import UIKit

extension UIViewController {
    var memes: [Meme] {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.memes
    }
    
    func showDetailViewWith(_ meme: Meme) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.meme = meme
        navigationController?.pushViewController(vc, animated: true)
    }
}
