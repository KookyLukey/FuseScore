//
//  AllScoresViewController.swift
//  Fuse Score
//
//  Created by Luke O'Neill on 7/5/16.
//  Copyright © 2016 Luke O'Neill. All rights reserved.
//

import UIKit
import Charts

class AllScoresViewController: UIViewController, ChartViewDelegate {

    @IBOutlet weak var testTextView: UITextView!
    @IBOutlet weak var chartView: BarChartView!
    @IBOutlet weak var grandTotalTextView: UITextView!
    
    let settings = SettingsViewController()
    
    var rowArr:[Int]!
    var cycleArr:[Int]!
    var skiArr:[Int]!
    var totalArr:[Int]!
    var dateArr:[String]!
    
    var grandTotal = 0
    var graphCeiling = 0
    
    let fuseGreen = UIColor(red: 150.0/255, green: 202.0/255, blue: 56.0/255, alpha: 1)
    let fuseBlue = UIColor(red: 0.0/255, green: 50.0/255, blue: 164.0/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Previous Scores"
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: fuseBlue]
        
        self.navigationController?.navigationBar.tintColor = fuseGreen
        
        self.chartView.delegate = self
        // 2
        self.chartView.descriptionText = "Tap node for details"
        // 3
        self.chartView.descriptionTextColor = UIColor.whiteColor()
        self.chartView.gridBackgroundColor = UIColor.darkGrayColor()
        // 4
        self.chartView.noDataText = "No data provided"
        
        self.chartView.leftAxis.axisMinValue = 5
        self.chartView.leftAxis.axisMaxValue = 20
        self.chartView.leftAxis.labelCount = Int(10)
        self.chartView.leftAxis.labelTextColor = fuseBlue
        
        self.chartView.rightAxis.axisMinValue = 5
        self.chartView.rightAxis.axisMaxValue = 20
        self.chartView.rightAxis.labelCount = Int(10)
        self.chartView.rightAxis.labelTextColor = fuseBlue
        
        self.chartView.xAxis.labelTextColor = fuseBlue
        
        setChartData(Array(dateArr.suffix(GlobalVar.graphSelect)))
        
        for i in 0 ..< totalArr.count {
            
            grandTotal += totalArr[i]
            
        }
        
        grandTotalTextView.text = String(grandTotal)
    }
    
    func setChartData(days : [String]) {
        // 1 - creating an array of data entries
        var tempRowArr = Array(rowArr.suffix(GlobalVar.graphSelect))
        var tempSkiArr = Array(skiArr.suffix(GlobalVar.graphSelect))
        var tempCycleArr = Array(cycleArr.suffix(GlobalVar.graphSelect))
        
        
        var yVals1 : [ChartDataEntry] = [ChartDataEntry]()
        for i in 0 ..< tempRowArr.count {
            yVals1.append(ChartDataEntry(value: Double(tempRowArr[i]), xIndex: i))
        }
        
        // 2 - create a data set with our array
        let set1: LineChartDataSet = LineChartDataSet(yVals: yVals1, label: "Row")
        set1.axisDependency = .Left // Line will correlate with left axis values
        set1.setColor(UIColor.redColor().colorWithAlphaComponent(0.5)) // our line's opacity is 50%
        set1.setCircleColor(UIColor.redColor()) // our circle will be dark red
        set1.lineWidth = 2.0
        set1.circleRadius = 6.0 // the radius of the node circle
        set1.fillAlpha = 65 / 255.0
        set1.fillColor = UIColor.redColor()
        set1.highlightColor = UIColor.whiteColor()
        set1.drawCircleHoleEnabled = true
        
        var yVals2 : [ChartDataEntry] = [ChartDataEntry]()
        for i in 0 ..< tempCycleArr.count {
            yVals2.append(ChartDataEntry(value: Double(tempCycleArr[i]), xIndex: i))
        }
        
        let set2: LineChartDataSet = LineChartDataSet(yVals: yVals2, label: "Cycle")
        set2.axisDependency = .Left // Line will correlate with left axis values
        set2.setColor(UIColor.greenColor().colorWithAlphaComponent(0.5))
        set2.setCircleColor(UIColor.greenColor())
        set2.lineWidth = 2.0
        set2.circleRadius = 6.0
        set2.fillAlpha = 65 / 255.0
        set2.fillColor = UIColor.greenColor()
        set2.highlightColor = UIColor.whiteColor()
        set2.drawCircleHoleEnabled = true
        
        var yVals3 : [ChartDataEntry] = [ChartDataEntry]()
        for i in 0 ..< tempSkiArr.count {
            yVals3.append(ChartDataEntry(value: Double(tempSkiArr[i]), xIndex: i))
        }
        
        let set3: LineChartDataSet = LineChartDataSet(yVals: yVals3, label: "Ski")
        set3.axisDependency = .Left // Line will correlate with left axis values
        set3.setColor(UIColor.blueColor().colorWithAlphaComponent(0.5))
        set3.setCircleColor(UIColor.blueColor())
        set3.lineWidth = 2.0
        set3.circleRadius = 6.0
        set3.fillAlpha = 65 / 255.0
        set3.fillColor = UIColor.blueColor()
        set3.highlightColor = UIColor.whiteColor()
        set3.drawCircleHoleEnabled = true
        
        //3 - create an array to store our LineChartDataSets
        var dataSets : [LineChartDataSet] = [LineChartDataSet]()
        dataSets.append(set1)
        dataSets.append(set2)
        dataSets.append(set3)
        
        //4 - pass our months in for our x-axis label value along with our dataSets
        let data: LineChartData = LineChartData(xVals: days, dataSets: dataSets)
        data.setValueTextColor(UIColor.whiteColor())
        
        //5 - finally set our data
        self.chartView.data = data
        
    }

}
