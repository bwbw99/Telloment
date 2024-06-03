//
//  HomeViewController.swift
//  may24
//
//  Created by 최병욱 on 5/2/24.
//

import UIKit
import DGCharts

class HomeViewController:UIViewController{
    
    // 관심 카테고리
    @IBOutlet weak var CategoryChart: PieChartView!
    @IBOutlet weak var normalButton: UIButton!
    @IBOutlet weak var happyButton: UIButton!
    @IBOutlet weak var sadButton: UIButton!
    @IBOutlet weak var rageButton: UIButton!
    
    
    // 감정별 컨텐츠 추천
    @IBOutlet weak var TodayEmotionTitle: UILabel!

    @IBOutlet weak var EmotionSelectView: UIView!
    @IBOutlet weak var EmotionHappyView: UIView!
    @IBOutlet weak var EmotionSadView: UIView!
    @IBOutlet weak var EmotionRageView: UIView!
    
    @IBOutlet weak var EmotionSelectView_Height: NSLayoutConstraint!
    @IBOutlet weak var EmotionHappyView_Height: NSLayoutConstraint!
    @IBOutlet weak var EmotionSadView_Height: NSLayoutConstraint!
    @IBOutlet weak var EmotionRageView_Height: NSLayoutConstraint!
    
    
    // 작가 추천
    @IBOutlet weak var User_Outter_1: UIView!
    @IBOutlet weak var User_Outter_2: UIView!
    
    
    @IBOutlet weak var User_Inner_1: UIView!
    @IBOutlet weak var User_Inner_2: UIView!
    
    
    @IBOutlet weak var User_Name_1: UILabel!
    @IBOutlet weak var User_Name_2: UILabel!
    
    
    @IBOutlet weak var User_Book_1: UILabel!
    @IBOutlet weak var User_Book_2: UILabel!
    
    
    @IBOutlet weak var User_Heart_1: UILabel!
    @IBOutlet weak var User_Heart_2: UILabel!
    
    
    @IBOutlet weak var User_Page_1: UILabel!
    @IBOutlet weak var User_Page_2: UILabel!
    
    
    
    
    
    var colorData = [UIColor]()
    var nameData: [String] = ["여행", "음악", "자기계발", "유머", "기타"]
    var scoreData: [Double]! = [453, 401, 229, 201, 30]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 관심 카테고리 추천
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
        
        
        
        // 감정 선택에 따른 추천 컨텐츠 제공
        EmotionHappyView_Height.constant = 0
        EmotionSadView_Height.constant = 0
        EmotionRageView_Height.constant = 0
        
        
        // 작가 추천
        User_Outter_1.layer.cornerRadius = 12
        User_Outter_2.layer.cornerRadius = 12
        User_Inner_1.layer.cornerRadius = 10
        User_Inner_2.layer.cornerRadius = 10
        
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
        EmotionSelectView.isHidden = true
        EmotionSelectView_Height.constant = 0
    }
    
    @IBAction func happyButtonTapped(_ sender: UIButton) {
        // 전체 글에서 즐거움과 관련된 감정의 글(페이지)들을 불러옴
        EmotionSelectView.isHidden = true
        EmotionSelectView_Height.constant = 0
        EmotionHappyView_Height.constant = 300
    }
    
    @IBAction func sadButtonTapped(_ sender: UIButton) {
        // 전체 글에서 위로 태그가 있는 글(페이지)들을 불러옴
        EmotionSelectView.isHidden = true
        EmotionSelectView_Height.constant = 0
        EmotionSadView_Height.constant = 300
    }
    
    @IBAction func rageButtonTapped(_ sender: UIButton) {
        // 유머 카테고리의 북을 불러옴
        EmotionSelectView.isHidden = true
        EmotionSelectView_Height.constant = 0
        EmotionRageView_Height.constant = 300
    }
    
    // 작가 추천
    @IBAction func UserButton_1_Tapped(_ sender: UIButton) {
        
    }
    
    @IBAction func UserButton_2_Tapped(_ sender: UIButton) {
        
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
