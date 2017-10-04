//
//  FontsTableViewController.swift
//  MemeMe
//
//  Created by Antonio da Silva on 27/09/2017.
//  Copyright © 2017 TNTStudios. All rights reserved.
//

import UIKit

protocol FontSelectedDelegate: class {
    func didSelectFont(withName: String)
}

class FontsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variables
    
    weak var delegate: FontSelectedDelegate?
    var fontNames = [String]()
    
    // MARK: - UIViewController lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for family: String in UIFont.familyNames {
            fontNames.append(contentsOf: UIFont.fontNames(forFamilyName: family))
        }
        
        fontNames = fontNames.sorted()
        tableView.reloadData()
        
    }

    // MARK: - Table view data source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return fontNames.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fontCell", for: indexPath)

        // Configure the cell...
        let fontName = fontNames[indexPath.row]
        cell.textLabel?.attributedText = NSAttributedString(string: fontName, attributes: attributedTextForFontType(fontName))

        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectFont(withName: fontNames[indexPath.row])
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Helpers
    
    private func attributedTextForFontType(_ font: String) -> [NSAttributedStringKey:Any] {
        return [
            NSAttributedStringKey.font: UIFont(name: font, size: 20)!,
            NSAttributedStringKey.foregroundColor: UIColor.white,
            NSAttributedStringKey.strokeColor: UIColor.black,
            NSAttributedStringKey.strokeWidth: -5
        ]
    }
    
}
