//
//  ViewController.swift
//  drawingApp
//
//  Created by Mike Liu on 6/29/20.
//  Copyright © 2020 Mike Liu. All rights reserved.
//

import UIKit
class ViewController: UIViewController {

    var currentPath: PathView?
    var allPaths: [PathView]?
    
    @IBOutlet weak var redButton: CustomButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //redButton.setupButton()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touchPoint = touches.first?.location(in: view) else { return }
        let frame = 
    }
    
}

