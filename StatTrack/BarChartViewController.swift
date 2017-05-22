//
//  BarChartViewController.swift
//  TextFileCSV
//
//  Created by Cheidu on 4/18/17.
//  Copyright © 2017 Cheidu. All rights reserved.
//

import UIKit
import Charts

class BarChartViewController: UIViewController {
    var currentPlayer: Player?
    
    @IBOutlet weak var chart: LineChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(currentPlayer!.name)
        print(currentPlayer!.data)
        // http://ioscharts.io/linechart/
        // 2. generate chart data entries
        var entries = [ ChartDataEntry]()
        for i in 0..<currentPlayer!.data.count{
            let entry = ChartDataEntry()
            entry.x = Double(i)
            entry.y = currentPlayer!.data[i]
            entries.append( entry)
        }
        // 3. chart setup
        let set = LineChartDataSet( values: entries, label: "Line Chart")
        let data = LineChartData( dataSet: set)
        chart.data = data
        // no data text
        chart.noDataText = "No data available"
        // user interaction
        chart.isUserInteractionEnabled = false
        // adds limit line to graph
        let ll = ChartLimitLine(limit: 50.0, label: "Target")
        chart.rightAxis.addLimitLine(ll)
        
        // 3a. style
        chart.xAxis.drawGridLinesEnabled = false
        chart.leftAxis.drawGridLinesEnabled = false
        chart.rightAxis.drawGridLinesEnabled = false
        
        chart.leftAxis.drawLabelsEnabled = true
        chart.rightAxis.drawLabelsEnabled = false
        chart.chartDescription = nil
        
        // addt'l styling
        set.drawCirclesEnabled = false
        set.drawValuesEnabled = false
        set.mode = LineChartDataSet.Mode.linear
        
        // 3b. animation
        chart.animate(xAxisDuration:  1.0)
        
        
        
        
    }
    
    
    
    // Do any additional setup after loading the view.
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}





/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */



