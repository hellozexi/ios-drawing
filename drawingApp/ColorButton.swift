//
//  ColorButton.swift
//  drawingApp
//
//  Created by Mike Liu on 6/30/20.
//  Copyright © 2020 Mike Liu. All rights reserved.
//

import Foundation

import UIKit

class ColorButton: UIButton {
    
    
    override func draw(_ rect: CGRect) {
        // Make it a circle button
        self.layer.cornerRadius = self.bounds.size.width / 2
        self.layer.masksToBounds = true
    }
    
   
}


