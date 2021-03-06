//
//  SettingsViewController.swift
//  Fuse Score
//
//  Created by Luke O'Neill on 7/10/16.
//  Copyright © 2016 Luke O'Neill. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var label: UILabel!
    
    var graphSelection = 99
    
    let fuseGreen = UIColor(red: 150.0/255, green: 202.0/255, blue: 56.0/255, alpha: 1)
    let fuseBlue = UIColor(red: 0.0/255, green: 50.0/255, blue: 164.0/255, alpha: 1)
    
    let main = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Settings"
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]

        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
    }
    
    override func viewWillAppear(animated: Bool) {
        switch GlobalVar.graphSelect{
            case 7:
                segmentedControl.selectedSegmentIndex = 0
            case 30:
                segmentedControl.selectedSegmentIndex = 1
            default:
                segmentedControl.selectedSegmentIndex = 2
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func indexChanged(sender: AnyObject) {
        
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            GlobalVar.graphSelect = 7;
        case 1:
            GlobalVar.graphSelect = 30;
        case 2:
            GlobalVar.graphSelect = 9999;
        default:
            break; 
        }
    }
    
    func getGraphSelection() -> Int{
        
        return graphSelection
    }
    
    @IBAction func clearAll(sender: AnyObject) {
        let alert = UIAlertController(title: "Warning", message: "You are about to erase all of your recorded data, are you sure you want to continue?", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.Default, handler: { action in
            
            GlobalVar.clearBool = true
            
        }))
        
        alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
}
