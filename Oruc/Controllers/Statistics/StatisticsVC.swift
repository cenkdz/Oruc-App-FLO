//
//  StatisticsVC.swift
//  Oruc
//
//  Created by Cenk Donmez on 30.06.2023.
//

import UIKit
import DGCharts


enum ChartType{
    case WeightChart
    case WaterChart
    case FastLengthChart
}

class StatisticsVC: UIViewController, ChartViewDelegate {
    
    
    let startingWeight = 92.0
    
    let targetWeight = 70.0
    
    let suggestedWaterIntake = 2.40
    
    
    let weightValues: [ChartDataEntry] = [
//        ChartDataEntry(x: 1687192131, y: 92.0, icon: NSUIImage(systemName: "figure.stand")),
//        ChartDataEntry(x: 1687536131, y: 90.0),
//        ChartDataEntry(x: 1687608931, y: 89.9),
//        ChartDataEntry(x: 1687708931, y: 89.8),
//        ChartDataEntry(x: 1687795331, y: 91.0),
//        ChartDataEntry(x: 1687881731, y: 87.0),
//        ChartDataEntry(x: 1687968131, y: 88.9),
//        ChartDataEntry(x: 1688054531, y: 89.7),
//        ChartDataEntry(x: 1688064531, y: 90.7),
//        ChartDataEntry(x: 1688074531, y: 90.0),
//        ChartDataEntry(x: 1688084531, y: 89.7),
//        ChartDataEntry(x: 1688094531, y: 88.7),
//        ChartDataEntry(x: 1688104531, y: 89.7),
//        ChartDataEntry(x: 1688114531, y: 89.7),
//        ChartDataEntry(x: 1688124531, y: 87.7),
//        ChartDataEntry(x: 1688134531, y: 89.7),
//        ChartDataEntry(x: 1688144531, y: 86.7),
//        ChartDataEntry(x: 1688154531, y: 85.7),
//        ChartDataEntry(x: 1688164531, y: 82.7),
//        ChartDataEntry(x: 1688174531, y: 80.0),
//        ChartDataEntry(x: 1692681731, y: 79, icon: NSUIImage(systemName: "flag.checkered.circle.fill"))
    ]
    
    
    let waterValues: [ChartDataEntry] = [
//        ChartDataEntry(x: 1687192131, y: 2.10),
//        ChartDataEntry(x: 1687536131, y: 3.0),
//        ChartDataEntry(x: 1687881731, y: 0.0),
//        ChartDataEntry(x: 1688084531, y: 2.40),
//        ChartDataEntry(x: 1688154531, y: 1.50),
//        ChartDataEntry(x: 1688174531, y: 2.10),
//        ChartDataEntry(x: 1692681731, y: 1.70),
//        ChartDataEntry(x: 1692781731, y: 3.20)
    ]
    
    
    let fastingLength: [BarChartDataEntry] = [
////        BarChartDataEntry(x: 1687101131, y: 20, icon: NSUIImage(systemName: "fork.knife.circle.fill")),
////                BarChartDataEntry(x: 1687111131, y: 15, icon: NSUIImage(systemName: "fork.knife.circle.fill")),
//        BarChartDataEntry(x: 1687112131, y: 12),
//                BarChartDataEntry(x: 1687112132, y: 12, icon: NSUIImage(systemName: "fork.knife.circle.fill")),
//                BarChartDataEntry(x: 1687122131, y: 24.2, icon: NSUIImage(systemName: "fork.knife.circle.fill")),
//                BarChartDataEntry(x: 1687132131, y: 20, icon: NSUIImage(systemName: "fork.knife.circle.fill")),
//                BarChartDataEntry(x: 1687142131, y: 7, icon: NSUIImage(systemName: "fork.knife.circle.fill")),
//                BarChartDataEntry(x: 1687152131, y: 11, icon: NSUIImage(systemName: "fork.knife.circle.fill")),
//                BarChartDataEntry(x: 1687162131, y: 9, icon: NSUIImage(systemName: "fork.knife.circle.fill")),
//                BarChartDataEntry(x: 1687172131, y: 13, icon: NSUIImage(systemName: "fork.knife.circle.fill")),
//                BarChartDataEntry(x: 1687182131, y: 12, icon: NSUIImage(systemName: "fork.knife.circle.fill")),
//                BarChartDataEntry(x: 1687192131, y: 14, icon: NSUIImage(systemName: "fork.knife.circle.fill"))
//
//
    ]
    
    
    lazy var weightProgressChart: LineChartView = {
        return LineChartView()
    }()
    
    lazy var waterTrackerChart: LineChartView = {
        return LineChartView()
    }()
    
    lazy var fastingPreferenceChart: BarChartView = {
        return BarChartView()
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLineChartData(linechart: weightProgressChart, set: LineChartDataSet(entries: weightValues, label: "Your Weight Loss Progress"), type: .WeightChart)
        setLineChartData(linechart: waterTrackerChart, set: LineChartDataSet(entries: waterValues, label: "Your Daily Water Intake"), type: .WaterChart)
        weightProgressChart.frame = CGRect(x:10, y: 100, width: 400, height: 250)
        waterTrackerChart.frame = CGRect(x:10, y: 350, width: 400, height: 200)
        fastingPreferenceChart.frame = CGRect(x:10, y: 600, width: 400, height: 200)
        setLineChartAppearance(chart: weightProgressChart, type: .WeightChart)
        setLineChartAppearance(chart: waterTrackerChart, type: .WaterChart)
        setBarChartAppearance(chart: fastingPreferenceChart)
        
        
        view.addSubview(weightProgressChart)
        view.addSubview(waterTrackerChart)
        view.addSubview(fastingPreferenceChart)
        
        
        
        
    }
    
    func setLineChartData(linechart: LineChartView, set: LineChartDataSet, type: ChartType){
        
        switch type {
        case .WeightChart:
            //Highlight
            set.highlightColor = .systemGreen
            
            //Circles
            set.drawCirclesEnabled = false
            set.drawValuesEnabled = false
            
            //Fill
            set.drawFilledEnabled = true
            set.fillColor = .systemGreen
            
            //Line
            //Line Color
            set.colors = [.green]
            set.lineWidth = 2
            
            //Mode
            set.mode = .horizontalBezier
            //Icons
            set.iconsOffset = CGPoint(x: 0, y: -10)
        case .WaterChart:
            //Highlight
            set.highlightColor = .systemCyan
            
            //Circles
            set.drawCirclesEnabled = false
            set.drawValuesEnabled = false
            
            //Fill
            set.drawFilledEnabled = true
            set.fillColor = .systemCyan
            
            //Line
            //Line Color
            set.colors = [.systemCyan]
            set.lineWidth = 3
            
            //Mode
            set.mode = .horizontalBezier
            //Icons
            set.iconsOffset = CGPoint(x: 0, y: -10)
        default:
            fatalError()
        }
        
        let data = LineChartData(dataSet: set)
        linechart.data = data
        
        
        let set3 = BarChartDataSet(entries: fastingLength, label: "Daily Fasting Duration")
        set3.colors = [.systemOrange]
        //        set1.iconsOffset = CGPoint(x: -5, y: -5)
        //set3.drawIconsEnabled = true
        set3.drawValuesEnabled = true
        //set1.drawHorizontalHighlightIndicatorEnabled = false
        set3.highlightColor = .systemOrange

        fastingPreferenceChart.data = BarChartData(dataSet: set3)
        
    }
    
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
    }
    
    
    func setLineChartAppearance(chart: LineChartView, type: ChartType){
        
        let limitLine = ChartLimitLine()
        
        switch type {
        case .WeightChart:
            limitLine.limit = targetWeight
            limitLine.label = "Target Weight"
        case .WaterChart:
            limitLine.limit = suggestedWaterIntake
            limitLine.label = "Suggested Water Intake"
        default:
            fatalError()
        }
        
        // LIMIT LINE
//        let limitLine = ChartLimitLine(limit: targetWeight, label: "Target Weight")
        limitLine.lineWidth = 2
        limitLine.lineDashLengths = [4, 4]
        limitLine.labelPosition = .rightTop
        limitLine.valueTextColor = UIColor.systemBlue
        limitLine.valueFont = .systemFont(ofSize: 12)
        
        
        
        //LEGEND
        let legend = chart.legend
        legend.horizontalAlignment = .center
        legend.verticalAlignment = .top
        legend.font = .boldSystemFont(ofSize: 12)
        chart.legend.form = .line

        // X AXIS
        chart.xAxis.calculate(min: chart.chartXMin, max: chart.chartXMax)
        chart.xAxis.labelFont = .boldSystemFont(ofSize: 8)
        chart.xAxis.axisLineColor = .systemGreen
        chart.xAxis.drawAxisLineEnabled = false
        //chart.xAxis.setLabelCount(7, force: false)
        chart.xAxis.labelPosition = .topInside
        chart.xAxis.valueFormatter = DateValueFormatter()
        // ARKA
        chart.xAxis.drawGridLinesEnabled = false
        
        chart.noDataText = "Bilgi girmenizi bekliyoruz 😀"

        // LEFT AXIS (Y AXIS)

        if type == .WeightChart{
            chart.leftAxis.axisMaximum = startingWeight * 1.2
            chart.leftAxis.axisMinimum = targetWeight / 1.2
        }else{
            chart.leftAxis.axisMaximum = suggestedWaterIntake * 3.0
            chart.leftAxis.axisMinimum = 0.0
        }
        chart.leftAxis.removeAllLimitLines()
        chart.leftAxis.addLimitLine(limitLine)
        chart.leftAxis.gridLineDashLengths = [5, 5]
        chart.leftAxis.drawAxisLineEnabled = false
        chart.leftAxis.drawLimitLinesBehindDataEnabled = true
        chart.leftAxis.axisLineColor = .systemGreen
        //chart.leftAxis.inverted = true
        //chart.leftAxis.setLabelCount(6, force: false)
        chart.leftAxis.labelFont = .boldSystemFont(ofSize: 8)
        chart.leftAxis.calculate(min: chart.chartYMin, max: chart.chartYMax)
        // ARKA
        chart.leftAxis.drawGridLinesEnabled = false

        // RIGHT AXIS
        chart.rightAxis.drawLabelsEnabled = false
        chart.rightAxis.drawAxisLineEnabled = false
        chart.rightAxis.axisLineColor = .systemGreen
        
        // ARKA
        chart.rightAxis.drawGridLinesEnabled = false
        
        // CHART GENERAL OPTIONS
        //chart.clipValuesToContentEnabled = true
        //chart.setScaleEnabled(true)
        //Background Color
        chart.backgroundColor = .white

        
    }
    
    
    func setBarChartAppearance(chart: BarChartView){
        //chart.drawBarShadowEnabled = false
        //chart.drawValueAboveBarEnabled = false
        
        //chartView.maxVisibleCount = 60
        let xAxis = chart.xAxis
//        xAxis.calculate(min: chart.chartXMin, max: chart.chartXMax)

        xAxis.labelPosition = .bottom
        xAxis.labelFont = .systemFont(ofSize: 10)
    
        xAxis.granularity = 1
        //xAxis.labelCount = 7
        xAxis.valueFormatter = DateValueFormatter()
        
//        xAxis.axisMinimum = chart.chartXMin // FIXME: HUH?? this replaces startAtZero = YES
//        xAxis.axisMaximum = chart.chartXMax
  
    
        
        let leftAxis = chart.leftAxis
        leftAxis.labelFont = .systemFont(ofSize: 10)
        //leftAxis.labelCount = 8
        leftAxis.labelPosition = .outsideChart
        leftAxis.spaceTop = 0.15
        leftAxis.axisMinimum = 0 // FIXME: HUH?? this replaces startAtZero = YES
        leftAxis.axisMaximum = 24.0 * 5.0
        leftAxis.calculate(min: chart.chartYMin, max: chart.chartYMax)

        
        let rightAxis = chart.rightAxis
        rightAxis.enabled = false
        
//        let l = chart.legend
//        l.horizontalAlignment = .center
//        l.verticalAlignment = .top
//        l.orientation = .horizontal
//        //l.drawInside = false
//        l.form = .square
//        l.formSize = 9
//        l.font = UIFont(name: "HelveticaNeue-Light", size: 11)!
//        l.xEntrySpace = 4
////        chartView.legend = l
//        chart.maxVisibleCount = 100
        
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
