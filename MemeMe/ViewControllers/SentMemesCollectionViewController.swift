//
//  SentMemesCollectionViewController.swift
//  MemeMe
//
//  Created by Antonio da Silva on 04/10/2017.
//  Copyright © 2017 TNTStudios. All rights reserved.
//

import UIKit

private let reuseIdentifier = "memeItemCell"

class SentMemesCollectionViewController: UICollectionViewController {
    
    var memes: [Meme] {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.memes
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MemeCollectionViewCell
        cell.configureWith(meme: memes[indexPath.row])
        return cell
    }

}
