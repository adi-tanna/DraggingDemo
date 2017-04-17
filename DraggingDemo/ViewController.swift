//
//  ViewController.swift
//  DraggingDemo
//
//  Created by Aditya Tanna on 4/11/17.
//  Copyright © 2017 Tanna Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var vwView1 = UIView()
    
    var vwView2 = UIView()
    
    var isValidPoint:Bool = false
    
    var frameOfVwView1Actual = CGRect()
    
    var initalTouchPoint = CGPoint()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vwView1.frame = CGRect(x: 25, y: 25, width: 100, height: 100)
        
        vwView1.backgroundColor = UIColor.blue
        
        vwView2.frame = CGRect(x: UIScreen.main.bounds.width-125, y: UIScreen.main.bounds.height-125, width: 100, height: 100)
        
        vwView2.backgroundColor = UIColor.purple

        self.view.addSubview(vwView1)
        
        self.view.addSubview(vwView2)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let point = touches.first?.location(in: vwView1){
            if vwView1.bounds.contains(point){
                isValidPoint = true
                initalTouchPoint = point
                frameOfVwView1Actual = vwView1.frame
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if isValidPoint {
            if let point = touches.first?.location(in: self.view){
                var frame = vwView1.frame
                
                frame.origin = point
 
                vwView1.frame = frame.offsetBy(dx: -initalTouchPoint.x , dy: -initalTouchPoint.y)
                
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if isValidPoint{
            if let point = touches.first?.location(in: vwView2){
                if vwView2.bounds.contains(point){
                    
                    vwView1.removeFromSuperview()
                }else{
                    self.vwView1.frame = self.frameOfVwView1Actual
                }
            }
        }
    }
}

