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
    
    let main = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
