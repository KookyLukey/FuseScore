//
//  Score.swift
//  Fuse Score
//
//  Created by Luke O'Neill on 7/5/16.
//  Copyright © 2016 Luke O'Neill. All rights reserved.
//

import Foundation

class rowCycleSki {
    
    var row: Int = 0
    var cycle: Int = 0
    var ski: Int = 0
    var total: Int = 0

    
    init(row: Int, cycle: Int, ski: Int, total: Int){
        self.row = row
        self.cycle = cycle
        self.ski = ski
        self.total = total
    }
}

struct GlobalVar {
    static var graphSelect = 7
    static var clearBool = false
    
    var textRowArray:[Int] = []
    var textCycleArray:[Int] = []
    var textSkiArray:[Int] = []
    var textDateArray:[String] = []
    var textTotalArray:[Int] = []
}