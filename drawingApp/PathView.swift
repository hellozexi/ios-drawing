//
//  PathView.swift
//  drawingApp
//
//  Created by Mike Liu on 6/29/20.
//  Copyright © 2020 Mike Liu. All rights reserved.
//

import Foundation
import UIKit

class PathView: UIView {
    var path: Path? {
        didSet {
            setNeedsDisplay()
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let bezierPath = createQuadPath(path!.points)
        bezierPath.lineWidth = path!.stroke
        path!.color.setStroke()
        bezierPath.stroke(with: .normal, alpha: path!.transparency)
        let startPoint = createPoint(path!.points[0], path!.stroke, 0, CGFloat(2 * Float.pi))
        let endPoint = createPoint(path!.points[path!.points.count - 1], path!.stroke, 0, CGFloat(2 * Float.pi))
        path!.color.setFill()
        startPoint.fill(with: .normal, alpha: path!.transparency)
        endPoint.fill(with: .normal, alpha: path!.transparency)
    }
    
    private func midpoint(first: CGPoint, second: CGPoint) -> CGPoint {
        return CGPoint(x: (first.x + second.x)/2, y: (first.y + second.y)/2)
    }
    
    private func createPoint(_ point: CGPoint, _ radius: CGFloat, _ startAngle: CGFloat, _ endAngle: CGFloat) -> UIBezierPath {
        let bezierPath = UIBezierPath()
        bezierPath.addArc(withCenter: point, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        return bezierPath
    }
    
    private func createQuadPath(_ points: [CGPoint]) -> UIBezierPath {
     let path = UIBezierPath() //Create the path object
     if(points.count < 2){ //There are no points to add to this path
     return path
     }
     path.move(to: points[0]) //Start the path on the first point
     for i in 1..<points.count - 1{
     let firstMidpoint = midpoint(first: path.currentPoint, second:
    points[i]) //Get midpoint between the path's last point and the next one in the array
     let secondMidpoint = midpoint(first: points[i], second:
    points[i+1]) //Get midpoint between the next point in the array and the one after it
     path.addCurve(to: secondMidpoint, controlPoint1: firstMidpoint,
    controlPoint2: points[i]) //This creates a cubic Bezier curve using math!
     }
     return path
    }
}
