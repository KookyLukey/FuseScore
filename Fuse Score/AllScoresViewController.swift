//
//  AllScoresViewController.swift
//  Fuse Score
//
//  Created by Luke O'Neill on 7/5/16.
//  Copyright © 2016 Luke O'Neill. All rights reserved.
//

import UIKit

class AllScoresViewController: UIViewController {

    @IBOutlet weak var testTextView: UITextView!
    
    var scoreArr:[rowCycleSki]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testTextView.text = String(scoreArr[0].cycle)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}
