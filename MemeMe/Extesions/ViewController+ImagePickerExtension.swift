//
//  ViewController+ImagePickerExtension.swift
//  MemeMe
//
//  Created by Antonio da Silva on 26/09/2017.
//  Copyright © 2017 TNTStudios. All rights reserved.
//

import UIKit

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    // MARK: - UIImagePickerControllerDelegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = image
        }
        shareButton.isEnabled = imageView.image != nil
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func showImagePickerFor(pickerSourceType: UIImagePickerControllerSourceType) {
        let viewController = UIImagePickerController()
        viewController.delegate = self
        viewController.sourceType = pickerSourceType
        present(viewController, animated: true, completion: nil)
    }
    
}
