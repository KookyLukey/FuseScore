//
//  SettingsViewController.swift
//  Fuse Score
//
//  Created by Luke O'Neill on 7/10/16.
//  Copyright © 2016 Luke O'Neill. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getGraphSelection() -> Int{
        
        return graphSelection
    }
    
    @IBAction func oneWeek(sender: AnyObject) {
        GlobalVar.graphSelect = 7
    }

    @IBAction func oneMonth(sender: AnyObject) {
        GlobalVar.graphSelect = 30
    }
    
    @IBAction func allTime(sender: AnyObject) {
        GlobalVar.graphSelect = 99
    }
    
    @IBAction func clearAll(sender: AnyObject) {
        GlobalVar.clearBool = true
    }
}
