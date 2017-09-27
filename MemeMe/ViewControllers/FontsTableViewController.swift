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

class FontsTableViewController: UITableViewController {
    
    weak var delegate: FontSelectedDelegate?
    var fontNames = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for family: String in UIFont.familyNames {
            fontNames.append(contentsOf: UIFont.fontNames(forFamilyName: family))
        }
        
        fontNames = fontNames.sorted()
        tableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return fontNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fontCell", for: indexPath)

        // Configure the cell...
        let fontName = fontNames[indexPath.row]
        cell.textLabel?.attributedText = NSAttributedString(string: fontName, attributes: attributedTextForFontType(fontName))

        return cell
    }
    
    func attributedTextForFontType(_ font: String) -> [NSAttributedStringKey:Any] {
        return [
            NSAttributedStringKey.font: UIFont(name: font, size: 20)!,
            NSAttributedStringKey.foregroundColor: UIColor.white,
            NSAttributedStringKey.strokeColor: UIColor.black,
            NSAttributedStringKey.strokeWidth: -5
        ]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectFont(withName: fontNames[indexPath.row])
        navigationController?.popViewController(animated: true)
    }

}
