//
//  ViewController.swift
//  Space_Calculator
//
//  Created by Brad Gray on 10/4/15.
//  Copyright © 2015 Brad Gray. All rights reserved.
//

import UIKit
import AVFoundation



class ViewController: UIViewController  {
 
    
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Add = "+"
        case Subtract = "-"
        case Empty = "Empty"
    }
    
    
    var audio: AVAudioPlayer!
    
    var runningNumber = ""
    var leftNum = ""
    var rightNum = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
   let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        
        let soundUrl = NSURL(fileURLWithPath: path!)
        
       do {
            
       try audio = AVAudioPlayer(contentsOfURL: soundUrl)
    
        
       } catch let err as NSError {
        print(err.debugDescription)
        }
    
    
    }

    @IBAction func numberPressed(btn: UIButton!) {
        audio.play()
    }

    
    @IBAction func onDividePress(sender: UIButton) {
        
    }
    
    @IBAction func onMultiplyPress(sender: UIButton) {
        
    }
    
    @IBAction func onSubtractPress(sender: UIButton) {
        
    }
    
    @IBAction func onAddPress(sender: UIButton) {
        
    }
 
    
    
    
    
    
    
}

