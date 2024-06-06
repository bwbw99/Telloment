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
    @IBOutlet weak var User_Outter_3: UIView!
    @IBOutlet weak var User_Outter_4: UIView!
    @IBOutlet weak var User_Outter_5: UIView!
    
    
    @IBOutlet weak var User_Inner_1: UIView!
    @IBOutlet weak var User_Inner_2: UIView!
    @IBOutlet weak var User_Inner_3: UIView!
    @IBOutlet weak var User_Inner_4: UIView!
    @IBOutlet weak var User_Inner_5: UIView!
    
    
    @IBOutlet weak var User_Name_1: UILabel!
    @IBOutlet weak var User_Name_2: UILabel!
    @IBOutlet weak var User_Name_3: UILabel!
    @IBOutlet weak var User_Name_4: UILabel!
    @IBOutlet weak var User_Name_5: UILabel!
    
    
    @IBOutlet weak var User_Book_1: UILabel!
    @IBOutlet weak var User_Book_2: UILabel!
    @IBOutlet weak var User_Book_3: UILabel!
    @IBOutlet weak var User_Book_4: UILabel!
    @IBOutlet weak var User_Book_5: UILabel!
    
    
    @IBOutlet weak var User_Heart_1: UILabel!
    @IBOutlet weak var User_Heart_2: UILabel!
    @IBOutlet weak var User_Heart_3: UILabel!
    @IBOutlet weak var User_Heart_4: UILabel!
    @IBOutlet weak var User_Heart_5: UILabel!
    
    
    @IBOutlet weak var User_Page_1: UILabel!
    @IBOutlet weak var User_Page_2: UILabel!
    @IBOutlet weak var User_Page_3: UILabel!
    @IBOutlet weak var User_Page_4: UILabel!
    @IBOutlet weak var User_Page_5: UILabel!
    
    
    
    
    // 관심 카테고리
    var colorData = [UIColor]()
    var nameData: [String] = []
    var scoreData: [Int]! = []
    
    
    // 감정별 추천
    var EmotionIds: [Int] = [] // 페이지 아이디가 들어가거나, 북 아이디가 들어가거나.
    var Emotion_Id_1 : Int = 0
    var Emotion_Id_2 : Int = 0
    var Emotion_Id_3 : Int = 0
    var Emotion_Id_4 : Int = 0
    var Emotion_Id_5 : Int = 0
    
    // 감정별 추천 - 행복
    @IBOutlet weak var Happy_View_1: UIView!
    @IBOutlet weak var Happy_View_2: UIView!
    @IBOutlet weak var Happy_View_3: UIView!
    @IBOutlet weak var Happy_View_4: UIView!
    @IBOutlet weak var Happy_View_5: UIView!
    
    @IBOutlet weak var Happy_Title_1: UILabel!
    @IBOutlet weak var Happy_Title_2: UILabel!
    @IBOutlet weak var Happy_Title_3: UILabel!
    @IBOutlet weak var Happy_Title_4: UILabel!
    @IBOutlet weak var Happy_Title_5: UILabel!
    
    @IBOutlet weak var Happy_Content_1: UITextView!
    @IBOutlet weak var Happy_Content_2: UITextView!
    @IBOutlet weak var Happy_Content_3: UITextView!
    @IBOutlet weak var Happy_Content_4: UITextView!
    @IBOutlet weak var Happy_Content_5: UITextView!
    
    @IBOutlet weak var Happy_Heart_1: UILabel!
    @IBOutlet weak var Happy_Heart_2: UILabel!
    @IBOutlet weak var Happy_Heart_3: UILabel!
    @IBOutlet weak var Happy_Heart_4: UILabel!
    @IBOutlet weak var Happy_Heart_5: UILabel!
    
    @IBOutlet weak var Happy_Button_1: UIButton!
    @IBOutlet weak var Happy_Button_2: UIButton!
    @IBOutlet weak var Happy_Button_3: UIButton!
    @IBOutlet weak var Happy_Button_4: UIButton!
    @IBOutlet weak var Happy_Button_5: UIButton!
    
    
    // 감정별 추천 - 슬픔
    @IBOutlet weak var Sad_View_1: UIView!
    @IBOutlet weak var Sad_View_2: UIView!
    @IBOutlet weak var Sad_View_3: UIView!
    @IBOutlet weak var Sad_View_4: UIView!
    @IBOutlet weak var Sad_View_5: UIView!
    
    @IBOutlet weak var Sad_Title_1: UILabel!
    @IBOutlet weak var Sad_Title_2: UILabel!
    @IBOutlet weak var Sad_Title_3: UILabel!
    @IBOutlet weak var Sad_Title_4: UILabel!
    @IBOutlet weak var Sad_Title_5: UILabel!
    
    @IBOutlet weak var Sad_Content_1: UITextView!
    @IBOutlet weak var Sad_Content_2: UITextView!
    @IBOutlet weak var Sad_Content_3: UITextView!
    @IBOutlet weak var Sad_Content_4: UITextView!
    @IBOutlet weak var Sad_Content_5: UITextView!
    
    @IBOutlet weak var Sad_Heart_1: UILabel!
    @IBOutlet weak var Sad_Heart_2: UILabel!
    @IBOutlet weak var Sad_Heart_3: UILabel!
    @IBOutlet weak var Sad_Heart_4: UILabel!
    @IBOutlet weak var Sad_Heart_5: UILabel!
    
    @IBOutlet weak var Sad_Button_1: UIButton!
    @IBOutlet weak var Sad_Button_2: UIButton!
    @IBOutlet weak var Sad_Button_3: UIButton!
    @IBOutlet weak var Sad_Button_4: UIButton!
    @IBOutlet weak var Sad_Button_5: UIButton!
    
    
    // 감정별 추천 - 화남
    @IBOutlet weak var Rage_View_1: UIView!
    @IBOutlet weak var Rage_View_2: UIView!
    @IBOutlet weak var Rage_View_3: UIView!
    @IBOutlet weak var Rage_View_4: UIView!
    @IBOutlet weak var Rage_View_5: UIView!
    
    @IBOutlet weak var Rage_Title_1: UILabel!
    @IBOutlet weak var Rage_Title_2: UILabel!
    @IBOutlet weak var Rage_Title_3: UILabel!
    @IBOutlet weak var Rage_Title_4: UILabel!
    @IBOutlet weak var Rage_Title_5: UILabel!
    
    @IBOutlet weak var Rage_Heart_1: UILabel!
    @IBOutlet weak var Rage_Heart_2: UILabel!
    @IBOutlet weak var Rage_Heart_3: UILabel!
    @IBOutlet weak var Rage_Heart_4: UILabel!
    @IBOutlet weak var Rage_Heart_5: UILabel!
    
    @IBOutlet weak var Rage_Page_1: UILabel!
    @IBOutlet weak var Rage_Page_2: UILabel!
    @IBOutlet weak var Rage_Page_3: UILabel!
    @IBOutlet weak var Rage_Page_4: UILabel!
    @IBOutlet weak var Rage_Page_5: UILabel!
    
    @IBOutlet weak var Rage_Button_1: UIButton!
    @IBOutlet weak var Rage_Button_2: UIButton!
    @IBOutlet weak var Rage_Button_3: UIButton!
    @IBOutlet weak var Rage_Button_4: UIButton!
    @IBOutlet weak var Rage_Button_5: UIButton!
    
    
    
    
    
    // 작가 추천
    var UserEmails: [String] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UserApi.shared.getUserCategoryScores(){ res in
            switch res{
            case .success(let data):
                for i in 0...4{
                    self.nameData[i] = self.categoryEnglishToKorean(category: data[i].category)
                    self.scoreData[i] = data[i].score
                }
                self.setPieData(pieChartView: self.CategoryChart, pieChartDataEntries: self.entryData(values: self.scoreData))
                
                self.setup(pieChartView: self.CategoryChart)
            case .failure(let err):
                print(err)
            }
            
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 관심 카테고리 추천 - API 관련
        nameData = ["여행", "음악", "자기계발", "유머", "기타"]
        scoreData = [453, 401, 229, 201, 30]
        
        colorData.append(UIColor(hexCode: "A38DEF"))
        colorData.append(UIColor(hexCode: "7DB2EF"))
        colorData.append(UIColor(hexCode: "94EF7A"))
        colorData.append(UIColor(hexCode: "EFB56E"))
        colorData.append(UIColor(hexCode: "EF8070"))
        
        
        self.CategoryChart.noDataText = "출력 데이터가 없습니다."
        self.CategoryChart.noDataFont = .systemFont(ofSize: 20)
        self.CategoryChart.noDataTextColor = .lightGray
        self.CategoryChart.backgroundColor = .white
        
        
        
        
        
        
        
        
        
        
        
        // 감정 선택에 따른 추천 컨텐츠 제공 - API 관련
        // -> line 300 쯤에 가서 구현 / happyButtonTapped, sadButtonTapped, rageButtonTapped
        
        
        // 감정 선택에 따른 추천 컨텐츠 제공 - UI 관련
        EmotionHappyView_Height.constant = 0
        EmotionSadView_Height.constant = 0
        EmotionRageView_Height.constant = 0
        
        
        // 작가 추천 - API 관련
        
        // 유저 이메일 저장
        SearchApi.shared.getTop10Users(){ res in
            switch res{
            case .success(let users):
                self.UserEmails = users.map({user in user.userEmail})
                self.CheckByEmail(Emails: self.UserEmails)
            case .failure(let err):
                print(err)
            }
        }
        
        
        
        
        
        
        // 작가 추천 - UI 관련
        User_Outter_1.layer.cornerRadius = 12
        User_Outter_2.layer.cornerRadius = 12
        User_Outter_3.layer.cornerRadius = 12
        User_Outter_4.layer.cornerRadius = 12
        User_Outter_5.layer.cornerRadius = 12
        
        User_Inner_1.layer.cornerRadius = 10
        User_Inner_2.layer.cornerRadius = 10
        User_Inner_3.layer.cornerRadius = 10
        User_Inner_4.layer.cornerRadius = 10
        User_Inner_5.layer.cornerRadius = 10
        
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
    func entryData(values: [Int]) -> [PieChartDataEntry] {
        // entry 담을 array
        var pieDataEntries: [PieChartDataEntry] = []
        // 담기
        for i in 0 ..< values.count {
            let pieDataEntry = PieChartDataEntry(value: Double(values[i]), label: nameData[i])
            
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
    } // end of ViewDidLoad
    
    
    @IBAction func normalButtonTapped(_ sender: UIButton) {
        // 사실 아무것도 안함
        EmotionSelectView.isHidden = true
        EmotionSelectView_Height.constant = 0
    }
    
    @IBAction func happyButtonTapped(_ sender: UIButton) {
        // 전체 글에서 즐거움과 관련된 감정의 글(페이지)들을 불러옴
        RankingApi.shared.getTopLikedPagesInEmotion(emotion: .Happy, top: 5) { res in
            switch res{
            case .success(let datas):
                self.Happy_Title_1.text = datas[0].title
                self.Happy_Title_2.text = datas[1].title
                self.Happy_Title_3.text = datas[2].title
                self.Happy_Title_4.text = datas[3].title
                self.Happy_Title_5.text = datas[4].title
                
                self.Happy_Content_1.text = datas[0].content
                self.Happy_Content_2.text = datas[1].content
                self.Happy_Content_3.text = datas[2].content
                self.Happy_Content_4.text = datas[3].content
                self.Happy_Content_5.text = datas[4].content
                
                self.Happy_Heart_1.text = String(datas[0].likeCount)
                self.Happy_Heart_2.text = String(datas[1].likeCount)
                self.Happy_Heart_3.text = String(datas[2].likeCount)
                self.Happy_Heart_4.text = String(datas[3].likeCount)
                self.Happy_Heart_5.text = String(datas[4].likeCount)
                
                self.Emotion_Id_1 = datas[0].pageId
                self.Emotion_Id_2 = datas[1].pageId
                self.Emotion_Id_3 = datas[2].pageId
                self.Emotion_Id_4 = datas[3].pageId
                self.Emotion_Id_5 = datas[4].pageId
                
                
            case .failure(let err):
                print(err)
            }
            
        }
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
    
    @IBAction func HappyButtonTapped_1(_ sender: UIButton) {
        guard let spvc = self.storyboard?.instantiateViewController(withIdentifier: "SeePageVC") as? SeePageViewController else {return}
        spvc.PageId = Emotion_Id_1
        self.navigationController?.pushViewController(spvc, animated: true)
    }
    
    @IBAction func HappyButtonTapped_2(_ sender: UIButton) {
        guard let spvc = self.storyboard?.instantiateViewController(withIdentifier: "SeePageVC") as? SeePageViewController else {return}
        spvc.PageId = Emotion_Id_2
        self.navigationController?.pushViewController(spvc, animated: true)
    }
    
    @IBAction func HappyButtonTapped_3(_ sender: UIButton) {
        guard let spvc = self.storyboard?.instantiateViewController(withIdentifier: "SeePageVC") as? SeePageViewController else {return}
        spvc.PageId = Emotion_Id_3
        self.navigationController?.pushViewController(spvc, animated: true)
    }
    
    @IBAction func HappyButtonTapped_4(_ sender: UIButton) {
        guard let spvc = self.storyboard?.instantiateViewController(withIdentifier: "SeePageVC") as? SeePageViewController else {return}
        spvc.PageId = Emotion_Id_4
        self.navigationController?.pushViewController(spvc, animated: true)
    }
    
    @IBAction func HappyButtonTapped_5(_ sender: UIButton) {
        guard let spvc = self.storyboard?.instantiateViewController(withIdentifier: "SeePageVC") as? SeePageViewController else {return}
        spvc.PageId = Emotion_Id_5
        self.navigationController?.pushViewController(spvc, animated: true)
    }
    
    
    
    
    
    
    
    
    
    // 작가 추천
    @IBAction func UserButton_1_Tapped(_ sender: UIButton) {
        guard let suvc = self.storyboard?.instantiateViewController(withIdentifier: "SeeUserVC") as? SeeUserViewController else {return}
        suvc.UserEmail = UserEmails[0]
        self.navigationController?.pushViewController(suvc, animated: true)
    }
    
    @IBAction func UserButton_2_Tapped(_ sender: UIButton) {
        guard let suvc = self.storyboard?.instantiateViewController(withIdentifier: "SeeUserVC") as? SeeUserViewController else {return}
        suvc.UserEmail = UserEmails[1]
        self.navigationController?.pushViewController(suvc, animated: true)
    }
    
    @IBAction func UserButton_3_Tapped(_ sender: UIButton) {
        guard let suvc = self.storyboard?.instantiateViewController(withIdentifier: "SeeUserVC") as? SeeUserViewController else {return}
        suvc.UserEmail = UserEmails[2]
        self.navigationController?.pushViewController(suvc, animated: true)
    }
    
    @IBAction func UserButton_4_Tapped(_ sender: UIButton) {
        guard let suvc = self.storyboard?.instantiateViewController(withIdentifier: "SeeUserVC") as? SeeUserViewController else {return}
        suvc.UserEmail = UserEmails[3]
        self.navigationController?.pushViewController(suvc, animated: true)
    }
    
    @IBAction func UserButton_5_Tapped(_ sender: UIButton) {
        guard let suvc = self.storyboard?.instantiateViewController(withIdentifier: "SeeUserVC") as? SeeUserViewController else {return}
        suvc.UserEmail = UserEmails[4]
        self.navigationController?.pushViewController(suvc, animated: true)
    }

    
    func drawRankedUserByIndex(email: String, temp: Int) {
        UserApi.shared.getUserByEmail(email: email){ res in
            switch res{
            case .success(let data):
                if(temp == 0){
                    self.User_Name_1.text = data.nickname
                    self.User_Book_1.text = String(data.bookCount)
                    self.User_Heart_1.text = String(data.totalLikeCount)
                    self.User_Page_1.text = String(data.pageCount)
                }
                if(temp == 1){
                    self.User_Name_2.text = data.nickname
                    self.User_Book_2.text = String(data.bookCount)
                    self.User_Heart_2.text = String(data.totalLikeCount)
                    self.User_Page_2.text = String(data.pageCount)
                }
                if(temp == 2){
                    self.User_Name_3.text = data.nickname
                    self.User_Book_3.text = String(data.bookCount)
                    self.User_Heart_3.text = String(data.totalLikeCount)
                    self.User_Page_3.text = String(data.pageCount)
                }
                if(temp == 3){
                    self.User_Name_4.text = data.nickname
                    self.User_Book_4.text = String(data.bookCount)
                    self.User_Heart_4.text = String(data.totalLikeCount)
                    self.User_Page_4.text = String(data.pageCount)
                }
                if(temp == 4){
                    self.User_Name_5.text = data.nickname
                    self.User_Book_5.text = String(data.bookCount)
                    self.User_Heart_5.text = String(data.totalLikeCount)
                    self.User_Page_5.text = String(data.pageCount)
                }
                
            case .failure(let err):
                print(err)
            }
            
        }
    }
    
    func CheckByEmail(Emails:[String]){
        var temp:Int = 0
        
        for i in Emails{
            drawRankedUserByIndex(email: i, temp: temp)
            temp += 1
        }
    }
    
    func categoryEnglishToKorean(category:String) -> String{
        if(category == "COOKING"){
            return "요리"
        }
        else if(category == "HUMOR"){
            return "유머"
        }
        else if(category == "ITNSCIENCE"){
            return "IT·과학"
        }
        else if(category == "STUDYING"){
            return "자기계발"
        }
        else if(category == "LITERATURE"){
            return "소설"
        }
        else if(category == "ANIMAL"){
            return "동물"
        }
        else if(category == "ROMANCE"){
            return "연애"
        }
        else if(category == "HEALTH"){
            return "건강·운동"
        }
        else if(category == "MARRIAGE"){
            return "결혼·육아"
        }
        else if(category == "MUSIC"){
            return "음악"
        }
        else if(category == "TRIP"){
            return "여행"
        }
        else if(category == "MOVIEDRAMA"){
            return "영화·드라마"
        }
        else if(category == "ART"){
            return "문화·예술"
        }
        else if(category == "HUMANITY"){
            return "인문·철학"
        }
        else{
            return "부동산·주식"
        }
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
