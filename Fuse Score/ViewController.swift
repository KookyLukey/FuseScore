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
    
    var rowArr: [Int] = []
    var cycleArr: [Int] = []
    var skiArr: [Int] = []
    var totalArr: [Int] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "allScoresViewController") {
            let svc = segue.destinationViewController as! AllScoresViewController;
            
            svc.rowArr = rowArr
            svc.cycleArr = cycleArr
            svc.skiArr = skiArr
            svc.totalArr = totalArr
            
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
            rowArr.append(rowNum!)
            cycleArr.append(cycleNum!)
            skiArr.append(skiNum!)
            totalArr.append(total)
            
        }
        totalTextView.text = String(total)
        clearTextField(rowTextField)
        clearTextField(cycleTextField)
        clearTextField(skiTextField)
        saveData()
    }
    
    @IBAction func previousScores(sender: AnyObject) {
        
        
    }
    
    func clearTextField(txtfld: UITextField){
        txtfld.text = ""
    }
    
    func saveData(){
        let rowData = NSKeyedArchiver.archivedDataWithRootObject(rowArr)
        NSUserDefaults.standardUserDefaults().setObject(rowData, forKey: "row")
        
        let cycleData = NSKeyedArchiver.archivedDataWithRootObject(cycleArr)
        NSUserDefaults.standardUserDefaults().setObject(cycleData, forKey: "cycle")
        
        let skiData = NSKeyedArchiver.archivedDataWithRootObject(skiArr)
        NSUserDefaults.standardUserDefaults().setObject(skiData, forKey: "ski")
        
        let totalData = NSKeyedArchiver.archivedDataWithRootObject(totalArr)
        NSUserDefaults.standardUserDefaults().setObject(totalData, forKey: "total")
    }
    
    func loadData(){
        let rowData = NSUserDefaults.standardUserDefaults().objectForKey("row") as? NSData
        let cycleData = NSUserDefaults.standardUserDefaults().objectForKey("cycle") as? NSData
        let skiData = NSUserDefaults.standardUserDefaults().objectForKey("ski") as? NSData
        let totalData = NSUserDefaults.standardUserDefaults().objectForKey("total") as? NSData
        
        if let rowData = rowData {
            let rowArray = NSKeyedUnarchiver.unarchiveObjectWithData(rowData) as? [Int]
            
            if let rowArray = rowArray {
                rowArr = rowArray
            }
            
        }
        
        if let cycleData = cycleData {
            let cycleArray = NSKeyedUnarchiver.unarchiveObjectWithData(cycleData) as? [Int]
            
            if let cycleArray = cycleArray {
                cycleArr = cycleArray
            }
            
        }
        
        if let skiData = skiData {
            let skiArray = NSKeyedUnarchiver.unarchiveObjectWithData(skiData) as? [Int]
            
            if let skiArray = skiArray {
                skiArr = skiArray
            }
            
        }
        
        if let totalData = totalData {
            let totalArray = NSKeyedUnarchiver.unarchiveObjectWithData(totalData) as? [Int]
            
            if let totalArray = totalArray {
                totalArr = totalArray
            }
            
        }
    }

}

