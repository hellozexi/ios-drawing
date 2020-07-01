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
    //color switch buttons

    
    
    //stroke slider
    @IBOutlet weak var strokeSlider: UISlider!
    
    //clear button to clear all the lines
    @IBOutlet weak var clearButton: UIButton!
    
    //undo button to delete last drawn line
    @IBOutlet weak var undoButton: UIButton!
    
    @IBOutlet weak var pad: PathView!
    //canvas to draw
   
    let currentColor: UIColor? = UIColor.red
    let currentStroke: CGFloat = 0.0
    let currentTransparency: CGFloat = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //redButton.setupButton()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touchPoint = touches.first?.location(in: view) else { return }
        currentPath = Path(touchPoint, self.currentColor!, self.currentStroke, self.currentTransparency)
        pad.currentPath = currentPath
        //print(pad.currentPath?.points)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touchPoint = touches.first?.location(in: view) else { return }
        currentPath?.points.append(touchPoint)
        pad.currentPath = currentPath
        print(pad.currentPath?.points)
    }
    
}

