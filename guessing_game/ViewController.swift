//
//  ViewController.swift
//  guessing_game
//
//  Created by neoman nouiouat on 4/27/17.
//  Copyright © 2017 neoman nouiouat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var output: UITextView!
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var butt: UIButton!
    
    var guess = 0
    var num = 0
    var done = false
    override func viewDidLoad() {
        super.viewDidLoad()
        input.text=""
        num = Int(arc4random()%100)+1
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func submit(_ sender: Any) {
        if done {
            if input.text=="N"||input.text=="n"{
                exit(0)
            }
            else{
                 butt.setTitle("Submit Guess", for: UIControlState.normal)
                input.text=""
                output.text=""
                num = Int(arc4random()%100)+1
                done=false
                return
            }
        }
        let g = (input.text! as NSString).integerValue
        if g>100||g<1{
            output.text=output.text + String(g) + " is not between 1 and 100 try again \n"
            return
        }
        
        if g<num{
            output.text=output.text + String(g) + " too low \n"
        }
        else if g>num{
            output.text=output.text + String(g) + " too high \n"
        }
        else{
            input.text=""
            output.text=output.text + "Good guess it was "+String(g)+"\n type n or N to quit\n"
            done=true
              butt.setTitle("Play again", for: UIControlState.normal)
            
        }
    }

}

