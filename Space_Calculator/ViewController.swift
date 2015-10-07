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
    var result = ""
    var runningNumber = ""
    var leftNum = ""
    var rightNum = ""
    var currentOperation: Operation = Operation.Empty
    
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

    @IBOutlet weak var outputLbl: UILabel!
    
    @IBAction func numberPressed(btn: UIButton!) {
        
       
        playSound()
        
        runningNumber += "\(btn.tag)"
        
        outputLbl.text = runningNumber
        
        
        
    }

    
    @IBAction func onDividePress(sender: UIButton) {
        proccessOperation(Operation.Divide)
    }
    
    @IBAction func onMultiplyPress(sender: UIButton) {
        proccessOperation(Operation.Multiply)
    }
    
    @IBAction func onSubtractPress(sender: UIButton) {
        proccessOperation(Operation.Subtract)
    }
    
    @IBAction func onAddPress(sender: UIButton) {
       proccessOperation(Operation.Add)
    }
    
    @IBAction func onEqualPress(sender: UIButton) {
      proccessOperation(currentOperation)
    }
 
    func proccessOperation(op: Operation) {
        playSound()
        if currentOperation != Operation.Empty {
            if runningNumber != "" {
                rightNum = runningNumber
                
                runningNumber = ""
                
                if currentOperation == Operation.Multiply {
                    result = "\(Double(leftNum)! * Double(rightNum)!)"
                    
                } else if  currentOperation == Operation.Divide {
                    result = "\(Double(leftNum)! / Double(rightNum)!)"
                    
                } else if currentOperation == Operation.Add {
                    result = "\(Double(leftNum)! + Double(rightNum)!)"
                    
                } else if currentOperation == Operation.Subtract {
                    result = "\(Double(leftNum)! - Double(rightNum)!)"
                }
                
                leftNum = result
                outputLbl.text = leftNum

                
            }
           
            currentOperation = op
            
        } else {
            leftNum = runningNumber
            runningNumber = ""
            currentOperation = op
        }
    }
    func playSound() {
        if audio.playing {
            audio.stop()
        }
        audio.play()
    }
    
    
    
    
}

