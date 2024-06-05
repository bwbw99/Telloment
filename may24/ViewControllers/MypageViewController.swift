//
//  MypageViewController.swift
//  may24
//
//  Created by 최병욱 on 5/17/24.
//

import UIKit

class MypageViewController:UIViewController{
    
    
    @IBOutlet weak var LogoutView: UIView!
    
    @IBOutlet weak var NicknameLabel: UILabel!
    @IBOutlet weak var Num_Book: UILabel!
    @IBOutlet weak var Num_Heart: UILabel!
    @IBOutlet weak var Num_Page: UILabel!
    
    
    @IBOutlet weak var BookView1: UIView!
    @IBOutlet weak var BookView2: UIView!
    @IBOutlet weak var BookView3: UIView!
    @IBOutlet weak var BookView4: UIView!
    @IBOutlet weak var BookView5: UIView!
    @IBOutlet weak var BookView6: UIView!
    @IBOutlet weak var BookView7: UIView!
    @IBOutlet weak var BookView8: UIView!
    @IBOutlet weak var BookView9: UIView!
    
    
    @IBOutlet weak var BookName1: UILabel!
    @IBOutlet weak var BookName2: UILabel!
    @IBOutlet weak var BookName3: UILabel!
    @IBOutlet weak var BookName4: UILabel!
    @IBOutlet weak var BookName5: UILabel!
    @IBOutlet weak var BookName6: UILabel!
    @IBOutlet weak var BookName7: UILabel!
    @IBOutlet weak var BookName8: UILabel!
    @IBOutlet weak var BookName9: UILabel!
    
    
    @IBOutlet weak var BookHeart1: UILabel!
    @IBOutlet weak var BookHeart2: UILabel!
    @IBOutlet weak var BookHeart3: UILabel!
    @IBOutlet weak var BookHeart4: UILabel!
    @IBOutlet weak var BookHeart5: UILabel!
    @IBOutlet weak var BookHeart6: UILabel!
    @IBOutlet weak var BookHeart7: UILabel!
    @IBOutlet weak var BookHeart8: UILabel!
    @IBOutlet weak var BookHeart9: UILabel!
    
    
    @IBOutlet weak var BookPage1: UILabel!
    @IBOutlet weak var BookPage2: UILabel!
    @IBOutlet weak var BookPage3: UILabel!
    @IBOutlet weak var BookPage4: UILabel!
    @IBOutlet weak var BookPage5: UILabel!
    @IBOutlet weak var BookPage6: UILabel!
    @IBOutlet weak var BookPage7: UILabel!
    @IBOutlet weak var BookPage8: UILabel!
    @IBOutlet weak var BookPage9: UILabel!
    
    
    @IBOutlet weak var BookButton1: UIButton!
    @IBOutlet weak var BookButton2: UIButton!
    @IBOutlet weak var BookButton3: UIButton!
    @IBOutlet weak var BookButton4: UIButton!
    @IBOutlet weak var BookButton5: UIButton!
    @IBOutlet weak var BookButton6: UIButton!
    @IBOutlet weak var BookButton7: UIButton!
    @IBOutlet weak var BookButton8: UIButton!
    @IBOutlet weak var BookButton9: UIButton!
    
    
    var BookName:[String] = []
    var BookHeart:[Int] = []
    var BookPage:[Int] = []
    var BookID:[Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        LogoutView.layer.borderWidth = 2
        LogoutView.layer.borderColor = UIColor.black.cgColor
        LogoutView.layer.cornerRadius = 20
        
        // 유저 정보를 조회
        NicknameLabel.text = "닉넴111"
        Num_Book.text = "4"
        Num_Heart.text = "66"
        Num_Page.text = "88"
        // 위 네줄의 북 정보는 static 하게 넣은 것임. 지우고 API 통신을 할 것.
        
        
        
        
        // 북 정보를 조회.
        BookName = ["터키여행기", "안될과학", "유머모음집", "북북"]
        BookHeart = [129,42,27,4]
        BookPage = [13,8,6,2]
        BookID = [111,222,333,444]
        // 위 세줄의 북 정보는 static 하게 넣은 것임. 지우고 API 통신을 할 것.
        
        
        
        // 이 아래는 바꿀 필요 없음, 북의 개수가 9개 보다 많으면 바꿔야하긴하는데,, 그런 시뮬레이션 상황을 만들지 않는게 어떤지..
        BookView1.isHidden = true
        BookView2.isHidden = true
        BookView3.isHidden = true
        BookView4.isHidden = true
        BookView5.isHidden = true
        BookView6.isHidden = true
        BookView7.isHidden = true
        BookView8.isHidden = true
        BookView9.isHidden = true
        
        BookButton1.isHidden = true
        BookButton2.isHidden = true
        BookButton3.isHidden = true
        BookButton4.isHidden = true
        BookButton5.isHidden = true
        BookButton6.isHidden = true
        BookButton7.isHidden = true
        BookButton8.isHidden = true
        BookButton9.isHidden = true
        
        
        
        var len_books = Int(Num_Book.text!)!
        var i:Int = 0
        if (len_books > i){
            BookView1.isHidden = false
            BookButton1.isHidden = false
            BookName1.text = BookName[i]
            BookHeart1.text = String(BookHeart[i])
            BookPage1.text = String(BookPage[i])
            i += 1
        }
        if (len_books > i){
            BookView2.isHidden = false
            BookButton2.isHidden = false
            BookName2.text = BookName[i]
            BookHeart2.text = String(BookHeart[i])
            BookPage2.text = String(BookPage[i])
            i += 1
        }
        if (len_books > i){
            BookView3.isHidden = false
            BookButton3.isHidden = false
            BookName3.text = BookName[i]
            BookHeart3.text = String(BookHeart[i])
            BookPage3.text = String(BookPage[i])
            i += 1
        }
        if (len_books > i){
            BookView4.isHidden = false
            BookButton4.isHidden = false
            BookName4.text = BookName[i]
            BookHeart4.text = String(BookHeart[i])
            BookPage4.text = String(BookPage[i])
            i += 1
        }
        if (len_books > i){
            BookView5.isHidden = false
            BookButton5.isHidden = false
            BookName5.text = BookName[i]
            BookHeart5.text = String(BookHeart[i])
            BookPage5.text = String(BookPage[i])
            i += 1
        }
        if (len_books > i){
            BookView6.isHidden = false
            BookButton6.isHidden = false
            BookName6.text = BookName[i]
            BookHeart6.text = String(BookHeart[i])
            BookPage6.text = String(BookPage[i])
            i += 1
        }
        if (len_books > i){
            BookView7.isHidden = false
            BookButton7.isHidden = false
            BookName7.text = BookName[i]
            BookHeart7.text = String(BookHeart[i])
            BookPage7.text = String(BookPage[i])
            i += 1
        }
        if (len_books > i){
            BookView8.isHidden = false
            BookButton8.isHidden = false
            BookName8.text = BookName[i]
            BookHeart8.text = String(BookHeart[i])
            BookPage8.text = String(BookPage[i])
            i += 1
        }
        if (len_books > i){
            BookView9.isHidden = false
            BookButton9.isHidden = false
            BookName9.text = BookName[i]
            BookHeart9.text = String(BookHeart[i])
            BookPage9.text = String(BookPage[i])
            i += 1
        }
        
        
    }
    
    
    @IBAction func LogoutButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBAction func BookButtonTapped_1(_ sender: UIButton) {
        // param : BookID[0] , 토큰
        
        
        
        
        guard let sbvc = self.storyboard?.instantiateViewController(identifier: "SeeBookVC") as? SeeBookViewController else { return }
        self.navigationController?.pushViewController(sbvc, animated: true)
    }
    
    @IBAction func BookButtonTapped_2(_ sender: UIButton) {
        
    }
    
    @IBAction func BookButtonTapped_3(_ sender: UIButton) {
        
    }
    
    @IBAction func BookButtonTapped_4(_ sender: UIButton) {
        
    }
    
    @IBAction func BookButtonTapped_5(_ sender: UIButton) {
        
    }
    
    @IBAction func BookButtonTapped_6(_ sender: UIButton) {
        
    }
    
    @IBAction func BookButtonTapped_7(_ sender: UIButton) {
        
    }
    
    @IBAction func BookButtonTapped_8(_ sender: UIButton) {
        
    }
    
    @IBAction func BookButtonTapped_9(_ sender: UIButton) {
        
    }
    
    
    
    
    
    
}
