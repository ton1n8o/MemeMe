//
//  TextFieldDelegate.swift
//  MemeMe_1
//
//  Created by Antonio da Silva on 23/09/2017.
//  Copyright © 2017 TNTStudios. All rights reserved.
//

import Foundation
import UIKit

class TextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
