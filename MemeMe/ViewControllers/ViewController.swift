//
//  ViewController.swift
//  MemeMe
//
//  Created by Antonio da Silva on 22/09/2017.
//  Copyright © 2017 TNTStudios. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FontSelectedDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var topLabel: UITextField!
    @IBOutlet weak var bottomLabel: UITextField!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    
    @IBOutlet weak var navBar: UIToolbar!
    @IBOutlet weak var toolBar: UIToolbar!
    
    // MARK: - Variables
    
    let textFieldDelegate = TextFieldDelegate()
    var fontSelected: String = "Impact" // Default font
    
    // MARK: - UIViewController lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        subscribeToKeyboardNotifications()
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribeFromKeyboardNotifications()
    }
    
    // MARK: - Actions
    
    @IBAction func pickAnImageFromAlbum(_ sender: Any) {
        showImagePickerFor(pickerSourceType: .photoLibrary)
    }
    
    @IBAction func pickAnImageFromCamera(_ sender: Any) {
        showImagePickerFor(pickerSourceType: .camera)
    }
    
    @IBAction func share(_ sender: Any) {
        let image = generateMemedImage()
        let controller = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        self.present(controller, animated: true, completion: {
            self.save()
        })
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? FontsTableViewController {
            vc.delegate = self
        }
    }
    
    // MARK: - Helpers
    
    private func setupUI() {
        
        shareButton.isEnabled = false
        
        topLabel.text = "TOP"
        topLabel.textAlignment = .center
        topLabel.delegate = textFieldDelegate
        bottomLabel.text = "BOTTOM"
        bottomLabel.textAlignment = .center
        bottomLabel.delegate = textFieldDelegate
        
        updateCurrentFontSelected()
        
        // config zoom
        scrollView.delegate = self
        scrollView.zoomScale = 1.0
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 5.0
    }
    
    private func updateCurrentFontSelected() {
        topLabel.defaultTextAttributes = attributedTextForFont(fontSelected)
        bottomLabel.defaultTextAttributes = attributedTextForFont(fontSelected)
    }
    
    private func attributedTextForFont(_ font: String) -> [String:Any] {
        return [
            NSAttributedStringKey.font.rawValue: UIFont(name: font, size: 40)!,
            NSAttributedStringKey.foregroundColor.rawValue: UIColor.white,
            NSAttributedStringKey.strokeColor.rawValue: UIColor.black,
            NSAttributedStringKey.strokeWidth.rawValue: -5
        ]
    }
    
    // MARK: - FontSelectedDelegate
    
    func didSelectFont(withName: String) {
        fontSelected = withName
        updateCurrentFontSelected()
    }
    
}

