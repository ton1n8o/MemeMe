//
//  DraggableView.swift
//  MemeMe
//
//  Created by Antonio da Silva on 06/10/2017.
//  Copyright © 2017 TNTStudios. All rights reserved.
//

import UIKit

class DraggableView: UIView {
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addGestureRecognizer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addGestureRecognizer()
    }
    
    @objc func detectPan(_ recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.superview)
        
        recognizer.view!.center = CGPoint(
            x: recognizer.view!.center.x + translation.x,
            y: recognizer.view!.center.y + translation.y
        )
        
        recognizer.setTranslation(CGPoint.zero, in: self.superview)
    }
    
    fileprivate func addGestureRecognizer() {
        let panRecognizer = UIPanGestureRecognizer(target:self, action: #selector(detectPan(_:)))
        self.gestureRecognizers = [panRecognizer]
    }
    
}
