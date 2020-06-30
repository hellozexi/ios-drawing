//
//  Path.swift
//  drawingApp
//
//  Created by Mike Liu on 6/29/20.
//  Copyright © 2020 Mike Liu. All rights reserved.
//

import Foundation
import UIKit

class Path {
    var points: [CGPoint]
    var stroke: CGFloat
    var color: UIColor
    var transparency: CGFloat
    
    init(startPoint point: CGPoint, color: UIColor, stroke: CGFloat, transparency: CGFloat) {
        self.points = [point]
        self.color = color
        self.stroke = stroke
        self.transparency = transparency
    }
}
