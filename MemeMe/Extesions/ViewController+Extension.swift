
//
//  ViewController+Extension.swift
//  MemeMe
//
//  Created by Antonio da Silva on 06/10/2017.
//  Copyright © 2017 TNTStudios. All rights reserved.
//

import UIKit

extension UIViewController {
    
    var appDelegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    var memes: [Meme] {
        get {
            return appDelegate.memes
        }
        set {
            appDelegate.memes = newValue
        }
    }
    
    func showDetailViewWith(_ meme: Meme) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.meme = meme
        navigationController?.pushViewController(vc, animated: true)
    }
}
