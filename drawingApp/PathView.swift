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
    
    public var currentPath: Path? {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public var allPaths: [Path] = [] {
        didSet {
            setNeedsDisplay()
        }
    }
    //color of the path
    public var color: UIColor = UIColor.black
    
    //stroke of the path
    public var stroke: CGFloat = CGFloat(20)
    
    //transparency of the path
    public var transparency: CGFloat = CGFloat(0.5)
    
    
    override func draw(_ rect: CGRect) {
        for path in allPaths {
            drawPath(path)
        }
        if let thePath = currentPath {
            thePath.color = self.color
            drawPath(thePath)
        }
        
    }
    
    private func midpoint(first: CGPoint, second: CGPoint) -> CGPoint {
        return CGPoint(x: (first.x + second.x)/2, y: (first.y + second.y)/2)
    }
    
    private func createPoint(_ point: CGPoint, _ color: UIColor, _ radius: CGFloat, _ startAngle: CGFloat, _ endAngle: CGFloat) -> UIBezierPath {
        let bezierPath = UIBezierPath()
        bezierPath.addArc(withCenter: point, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        color.setFill()
        return bezierPath
    }
    
    func deletePreviousLine() {
        if(allPaths.count != 0) {
            var _: Path = (allPaths.popLast())!
        }
    }
    
    private func drawPath(_ path: Path) {
        let numOfPoints = path.points.count
        let bezierPath = createQuadPath(path.points)
        let pathColor = path.color
        pathColor.setStroke()
        bezierPath.lineWidth = self.stroke
        bezierPath.stroke(with: .normal, alpha: self.transparency)
        
        
        let startPoint = createPoint(path.points[0], pathColor, self.stroke / 2, 0, CGFloat(2 * Float.pi))
        let endPoint = createPoint(path.points[numOfPoints - 1], pathColor, self.stroke / 2, 0, CGFloat(2 * Float.pi))
        //pathColor.setFill()
        startPoint.fill(with: .normal, alpha: self.transparency)
        endPoint.fill(with: .normal, alpha: self.transparency)
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
