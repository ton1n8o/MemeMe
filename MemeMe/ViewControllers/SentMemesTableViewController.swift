//
//  SentMemesTableViewController.swift
//  MemeMe
//
//  Created by Antonio da Silva on 04/10/2017.
//  Copyright © 2017 TNTStudios. All rights reserved.
//

import UIKit

class SentMemesTableViewController: UITableViewController {
    
    // MARK: - UITableViewController lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return memes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "memeCell", for: indexPath)

        cell.textLabel?.text = memes[indexPath.row].topText
        cell.imageView?.image = memes[indexPath.row].memedImage

        return cell
    }

}
