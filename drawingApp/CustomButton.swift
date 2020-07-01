//
//  CustomButton.swift
//  drawingApp
//
//  Created by Mike Liu on 6/29/20.
//  Copyright © 2020 Mike Liu. All rights reserved.
//

import Foundation
import UIKit
class CustomButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        //setupShadow()
        if (self.layer.frame.width <= self.layer.frame.height){
            self.layer.cornerRadius = self.layer.frame.width/2
        } else {
            self.layer.cornerRadius = self.layer.frame.height/2
        }
    }
    
    private func setupShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 8
        self.layer.shadowOpacity = 0.5
        self.clipsToBounds = true
        self.layer.masksToBounds = false
    }
}
