//
//  CustomCell.swift
//  Fuse Score
//
//  Created by Luke O'Neill on 7/24/16.
//  Copyright © 2016 Luke O'Neill. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var row: UILabel!
    @IBOutlet weak var cycle: UILabel!
    @IBOutlet weak var ski: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
