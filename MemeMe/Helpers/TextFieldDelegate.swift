//
//  TextFieldDelegate.swift
//  MemeMe
//
//  Created by Antonio da Silva on 23/09/2017.
//  Copyright © 2017 TNTStudios. All rights reserved.
//

import Foundation
import UIKit

class TextFieldDelegate: NSObject, UITextFieldDelegate {
    
    // with this variable we store the current text typed
    var tmpText = ""
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        tmpText = textField.text!
        textField.text = ""
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text?.isEmpty ?? true {
           textField.text = tmpText
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
