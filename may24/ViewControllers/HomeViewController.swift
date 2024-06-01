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
    @IBOutlet weak var normalButton: UIButton!
    @IBOutlet weak var happyButton: UIButton!
    @IBOutlet weak var sadButton: UIButton!
    @IBOutlet weak var rageButton: UIButton!
    
    
    @IBOutlet weak var TodayEmotionTitle: UILabel!
   
    
    
    
    
    
    
    
    
    
    
    
    var colorData = [UIColor]()
    var nameData: [String] = ["여행", "음악", "자기계발", "유머", "기타"]
    var scoreData: [Double]! = [453, 401, 229, 201, 30]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorData.append(UIColor(hexCode: "A38DEF"))
        colorData.append(UIColor(hexCode: "7DB2EF"))
        colorData.append(UIColor(hexCode: "94EF7A"))
        colorData.append(UIColor(hexCode: "EFB56E"))
        colorData.append(UIColor(hexCode: "EF8070"))
        
        
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
        chartView.entryLabelFont = NSUIFont(name: "BMJUAOTF", size: 12.0)
    }

    
    @IBAction func normalButtonTapped(_ sender: UIButton) {
        // 사실 아무것도 안함
    }
    
    @IBAction func happyButtonTapped(_ sender: UIButton) {
        
        // 전체 글에서 즐거움과 관련된 감정의 글(페이지)들을 불러옴
    }
    
    @IBAction func sadButtonTapped(_ sender: UIButton) {
        
        // 전체 글에서 위로 태그가 있는 글(페이지)들을 불러옴
    }
    
    @IBAction func rageButtonTapped(_ sender: UIButton) {
        
        // 유머 카테고리의 북을 불러옴
    }
    
    
    
    
    
    
}
 extension UIColor {
     
     convenience init(hexCode: String, alpha: CGFloat = 1.0) {
         var hexFormatted: String = hexCode.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
         
         if hexFormatted.hasPrefix("#") {
             hexFormatted = String(hexFormatted.dropFirst())
         }
         
         assert(hexFormatted.count == 6, "Invalid hex code used.")
         
         var rgbValue: UInt64 = 0
         Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
         
         self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                   green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                   blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                   alpha: alpha)
     }
 }
