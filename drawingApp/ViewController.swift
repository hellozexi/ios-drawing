//
//  ViewController.swift
//  drawingApp
//
//  Created by Mike Liu on 6/29/20.
//  Copyright © 2020 Mike Liu. All rights reserved.
//

import UIKit
class ViewController: UIViewController {

    @IBAction func changeStroke(_ sender: UISlider) {
        pad.stroke = CGFloat(sender.value) * 18
    }
    var currentPath: Path?
    //color switch button
    
    @IBOutlet weak var colorSelectionButton: ColorButton!
    //color button event
    @IBAction func switchToRed(_ sender: ColorButton) {
        pad.color = UIColor.red
        let indicatorX = sender.frame.maxX - colorSelectionButton.frame.width/2 + 25
        let indicatorY = colorSelectionButton.frame.origin.y
        colorSelectionButton.frame.origin = CGPoint(x:indicatorX, y: indicatorY)
    }
    @IBAction func switchToPink(_ sender: ColorButton) {
        pad.color = UIColor.systemPink
        let indicatorX = sender.frame.maxX - colorSelectionButton.frame.width/2 + 25
        let indicatorY = colorSelectionButton.frame.origin.y
        colorSelectionButton.frame.origin = CGPoint(x:indicatorX, y: indicatorY)
    }
    @IBAction func switchToOrrange(_ sender: ColorButton) {
        pad.color = UIColor.orange
        let indicatorX = sender.frame.maxX - colorSelectionButton.frame.width/2 + 25
        let indicatorY = colorSelectionButton.frame.origin.y
        colorSelectionButton.frame.origin = CGPoint(x:indicatorX, y: indicatorY)
    }
    @IBAction func switchToYellow(_ sender: ColorButton) {
        pad.color = UIColor.yellow
        let indicatorX = sender.frame.maxX - colorSelectionButton.frame.width/2 + 25
        let indicatorY = colorSelectionButton.frame.origin.y
        colorSelectionButton.frame.origin = CGPoint(x:indicatorX, y: indicatorY)
    }
    @IBAction func switchToGreen(_ sender: ColorButton) {
        pad.color = UIColor.green
        let indicatorX = sender.frame.maxX - colorSelectionButton.frame.width/2 + 25
        let indicatorY = colorSelectionButton.frame.origin.y
        colorSelectionButton.frame.origin = CGPoint(x:indicatorX, y: indicatorY)
    }
    @IBAction func switchToBlue(_ sender: ColorButton) {
        pad.color = UIColor.blue
        let indicatorX = sender.frame.maxX - colorSelectionButton.frame.width/2 + 25
        let indicatorY = colorSelectionButton.frame.origin.y
        colorSelectionButton.frame.origin = CGPoint(x:indicatorX, y: indicatorY)
    }
    @IBAction func switchToPurple(_ sender: ColorButton) {
        pad.color = UIColor.purple
        let indicatorX = sender.frame.maxX - colorSelectionButton.frame.width/2 + 25
        let indicatorY = colorSelectionButton.frame.origin.y
        colorSelectionButton.frame.origin = CGPoint(x:indicatorX, y: indicatorY)
    }
    
    
    //stroke slider
    @IBOutlet weak var strokeSlider: UISlider!
    
    //clear button to clear all the lines
    @IBOutlet weak var clearButton: UIButton!
    
    //undo button to delete last drawn line
    @IBOutlet weak var undoButton: UIButton!
    
    @IBOutlet weak var pad: PathView!
    //canvas to draw
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //redButton.setupButton()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touchPoint = touches.first?.location(in: pad) else { return }
        currentPath = Path(touchPoint, pad.color, pad.stroke, pad.transparency)
        pad.currentPath = currentPath
        //pad.currentPath?.color = pad.color
        //print(pad.currentPath?.points)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touchPoint = touches.first?.location(in: pad) else { return }
        currentPath?.points.append(touchPoint)
        pad.currentPath = currentPath
        //print(pad.currentPath?.points)
    }
    @IBAction func clearAllPaths(_ sender: UIButton) {
        pad.allPaths = []
    }
    
    @IBAction func undoPreviousPath(_ sender: UIButton) {
        pad.deletePreviousLine()
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let path = currentPath {
            pad.allPaths.append(path)
            pad.currentPath = nil
        }
    }
    
}

