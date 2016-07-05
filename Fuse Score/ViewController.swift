//
//  ViewController.swift
//  Fuse Score
//
//  Created by Luke O'Neill on 7/5/16.
//  Copyright © 2016 Luke O'Neill. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Properties
    
    @IBOutlet weak var rowTextField: UITextField!
    @IBOutlet weak var cycleTextField: UITextField!
    @IBOutlet weak var skiTextField: UITextField!
    @IBOutlet weak var totalTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveScore(sender: AnyObject) {
        
        var total: Int = 0;
        
        if(rowTextField != nil && cycleTextField != nil && skiTextField != nil){
            
            let rowText: String = rowTextField.text!
            let cycleText: String = cycleTextField.text!
            let skiText: String = skiTextField.text!
            
            if let rowNum = Int(rowText) {
                total += rowNum
            }
            if let cycleNum = Int(cycleText) {
                total += cycleNum
            }
            
            if let skiNum = Int(skiText) {
                total += skiNum
            }
        }
        totalTextView.text = String(total)
    }
    
    @IBAction func previousScores(sender: AnyObject) {
        
    }

}

