//
//  HomeViewController.swift
//  may24
//
//  Created by 최병욱 on 5/2/24.
//

import UIKit
import DGCharts

class HomeViewController:UIViewController{
    
    @IBOutlet weak var CategoryChart: PieChartView!
    

    
    var colorData = [UIColor]()
    var nameData: [String] = ["여행", "음악", "자기계발", "유머", "기타"]
    var scoreData: [Double]! = [453, 401, 229, 201, 30]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorData.append(UIColor.lightGray)
        colorData.append(UIColor.blue)
        colorData.append(UIColor.red)
        colorData.append(UIColor.green)
        colorData.append(UIColor.orange)
        
        
        self.CategoryChart.noDataText = "출력 데이터가 없습니다."
        self.CategoryChart.noDataFont = .systemFont(ofSize: 20)
        self.CategoryChart.noDataTextColor = .lightGray
        self.CategoryChart.backgroundColor = .white
        
        self.setPieData(pieChartView: self.CategoryChart, pieChartDataEntries: self.entryData(values: self.scoreData))
        
        self.setup(pieChartView: CategoryChart)
    }
    
    // 데이터 적용하기
    func setPieData(pieChartView: PieChartView, pieChartDataEntries: [ChartDataEntry]) {
        // Entry들을 이용해 Data Set 만들기
        let pieChartdataSet = PieChartDataSet(entries: pieChartDataEntries, label: "")
        // DataSet을 차트 데이터로 넣기
        let pieChartData = PieChartData(dataSet: pieChartdataSet)
        //  차트에 색상 입히기
        pieChartdataSet.colors = colorData
        // 데이터 출력
        pieChartView.data = pieChartData
    }

    // entry 만들기
    func entryData(values: [Double]) -> [PieChartDataEntry] {
        // entry 담을 array
        var pieDataEntries: [PieChartDataEntry] = []
        // 담기
        for i in 0 ..< values.count {
            let pieDataEntry = PieChartDataEntry(value: values[i], label: nameData[i])
            
            pieDataEntries.append(pieDataEntry)
        }
        // 반환
        return pieDataEntries
    }
    
    // PieChart 속성 설정
    func setup(pieChartView chartView: PieChartView) {
        chartView.drawSlicesUnderHoleEnabled = true
        chartView.holeRadiusPercent = 0.58
        chartView.chartDescription.enabled = false
        chartView.drawCenterTextEnabled = true
        chartView.drawHoleEnabled = true
        chartView.rotationAngle = 270
        chartView.rotationEnabled = true
        chartView.highlightPerTapEnabled = false
    }

    
    
    
}
