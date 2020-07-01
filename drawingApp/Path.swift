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
    
    init(_ startPoint: CGPoint, _ color: UIColor, _ stroke: CGFloat, _ transparency: CGFloat) {
        self.points = [startPoint]
        self.color = color
        self.stroke = stroke
        self.transparency = transparency
    }
}
