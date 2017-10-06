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
    
    @IBOutlet weak var viewLabelTop: DraggableView!
    
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
        
        let meme = buildMemeObject()
        
        if meme.topText.isEmpty && meme.bottomText.isEmpty {
            let message = "Your Meme should have at least one label message filled in."
            showInfo(withMessage: message)
            return
        }
        // let's store our Meme object
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.memes.append(meme)
        
        let controller = UIActivityViewController(activityItems: [meme.memedImage], applicationActivities: nil)
        
        controller.completionWithItemsHandler = {(activityType: UIActivityType?, completed: Bool, returnedItems: [Any]?, activityError: Error?) in
            if completed && activityType == .saveToCameraRoll {
                self.showInfo(withMessage: "Meme saved with success!")
            }
        }
        
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func dismissView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? FontsTableViewController {
            vc.delegate = self
        }
    }
    
    // MARK: - Helpers
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func buildMemeObject() -> Meme {
        // Create the meme
        return Meme(topText: topLabel.text!.trimmingCharacters(in: .whitespacesAndNewlines),
                    bottomText: bottomLabel.text!.trimmingCharacters(in: .whitespacesAndNewlines),
                    originalImage: imageView.image!,
                    memedImage: generateMemedImage())
    }
    
    private func setupUI() {
        
        shareButton.isEnabled = false
        
        configure(textField: topLabel, withText: "TOP")
        configure(textField: bottomLabel, withText: "BOTTOM")
        
        updateCurrentFontSelected()
        
        // config zoom
        scrollView.delegate = self
        scrollView.zoomScale = 1.0
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 5.0
    }
    
    private func configure (textField: UITextField, withText: String) {
        textField.text = withText
        textField.textAlignment = .center
        textField.delegate = textFieldDelegate
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
    
    private func showInfo(withTitle: String = "Info", withMessage: String) {
        let ac = UIAlertController(title: withTitle, message: withMessage, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    // MARK: - FontSelectedDelegate
    
    func didSelectFont(withName: String) {
        fontSelected = withName
        updateCurrentFontSelected()
    }
    
}

