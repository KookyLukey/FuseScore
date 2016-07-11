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
    
    var graphSelection = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func segCntrlIndexChanged(sender: AnyObject) {
        
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            graphSelection = 0
        case 1:
            graphSelection = 1
        case 2:
            graphSelection = 2
        default:
            graphSelection = 2
        }
        
    }
    
    func getGraphSelection() -> Int{
        
        return graphSelection
    }
    

}
