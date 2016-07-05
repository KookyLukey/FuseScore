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
    
    var graphArr: [rowCycleSki] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "allScoresViewController") {
            let svc = segue.destinationViewController as! AllScoresViewController;
            
            svc.scoreArr = graphArr
            
        }
    }

    @IBAction func saveScore(sender: AnyObject) {
        
        var total: Int = 0;
        
        if(rowTextField != nil && cycleTextField != nil && skiTextField != nil){
            
            let rowText: String = rowTextField.text!
            let cycleText: String = cycleTextField.text!
            let skiText: String = skiTextField.text!
            
            let rowNum = Int(rowText)
            let cycleNum = Int(cycleText)
            let skiNum = Int(skiText)
            
            if  (rowNum != nil){
                total += rowNum!
            }
            if  (cycleNum != nil){
                total += cycleNum!
            }
            
            if  (skiNum != nil){
                total += skiNum!
            }
            
            let finalScore = rowCycleSki(row: rowNum!, cycle: cycleNum!, ski: skiNum!, total: total)
            graphArr.append(finalScore)
        }
        totalTextView.text = String(graphArr[0].cycle)
    }
    
    @IBAction func previousScores(sender: AnyObject) {
        
        
    }
    
    

}

