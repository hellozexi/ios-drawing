//
//  ViewController.swift
//  drawingApp
//
//  Created by Mike Liu on 6/29/20.
//  Copyright © 2020 Mike Liu. All rights reserved.
//

import UIKit
class ViewController: UIViewController {

    var currentPath: Path?
    //color switch button
    @IBOutlet weak var colorSelectionButton: ColorButton!
    //color button event
    @IBAction func switchToRed(_ sender: ColorButton) {
        pad.color = UIColor.red
    }
    @IBAction func switchToPink(_ sender: ColorButton) {
        pad.color = UIColor.systemPink
    }
    @IBAction func switchToOrrange(_ sender: ColorButton) {
        pad.color = UIColor.orange
    }
    @IBAction func switchToYellow(_ sender: ColorButton) {
        pad.color = UIColor.yellow
    }
    @IBAction func switchToGreen(_ sender: ColorButton) {
        pad.color = UIColor.green
    }
    @IBAction func switchToBlue(_ sender: ColorButton) {
        pad.color = UIColor.blue
    }
    @IBAction func switchToPurple(_ sender: ColorButton) {
        pad.color = UIColor.purple
    }
    
    
    //stroke slider
    @IBOutlet weak var strokeSlider: UISlider!
    
    //clear button to clear all the lines
    @IBOutlet weak var clearButton: UIButton!
    
    //undo button to delete last drawn line
    @IBOutlet weak var undoButton: UIButton!
    
    @IBOutlet weak var pad: PathView!
    //canvas to draw
   
    var currentColor: UIColor = UIColor.red
    let currentStroke: CGFloat = 0.0
    let currentTransparency: CGFloat = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //redButton.setupButton()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touchPoint = touches.first?.location(in: pad) else { return }
        currentPath = Path(touchPoint, pad.color, self.currentStroke, self.currentTransparency)
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

