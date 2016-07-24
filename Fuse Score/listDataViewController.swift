//
//  listDataViewController.swift
//  Fuse Score
//
//  Created by Luke O'Neill on 7/24/16.
//  Copyright © 2016 Luke O'Neill. All rights reserved.
//

import UIKit

class listDataViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var rowArr:[Int]!
    var cycleArr:[Int]!
    var skiArr:[Int]!
    var totalArr:[Int]!
    var dateArr:[String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomCell
        
        cell.date.text = dateArr[indexPath.row]
        cell.total.text = String(totalArr[indexPath.row])
        cell.row.text = String(rowArr[indexPath.row])
        cell.cycle.text = String(cycleArr[indexPath.row])
        cell.ski.text = String(skiArr[indexPath.row])
        
        return cell
        
    }

}
