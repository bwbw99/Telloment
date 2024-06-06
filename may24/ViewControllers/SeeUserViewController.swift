//
//  SeeUserViewController.swift
//  may24
//
//  Created by 최병욱 on 6/3/24.
//

import UIKit

class SeeUserViewController:UIViewController{
    @IBAction func BackButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var NumBook: UILabel!
    @IBOutlet weak var NumHeart: UILabel!
    @IBOutlet weak var NumPage: UILabel!
    
    
    @IBOutlet weak var BookView1: UIView!
    @IBOutlet weak var BookView2: UIView!
    @IBOutlet weak var BookView3: UIView!
    @IBOutlet weak var BookView4: UIView!
    @IBOutlet weak var BookView5: UIView!
    @IBOutlet weak var BookView6: UIView!
    @IBOutlet weak var BookView7: UIView!
    @IBOutlet weak var BookView8: UIView!
    @IBOutlet weak var BookView9: UIView!
    
    
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
    
    
    @IBOutlet weak var BookName1: UILabel!
    @IBOutlet weak var BookName2: UILabel!
    @IBOutlet weak var BookName3: UILabel!
    @IBOutlet weak var BookName4: UILabel!
    @IBOutlet weak var BookName5: UILabel!
    @IBOutlet weak var BookName6: UILabel!
    @IBOutlet weak var BookName7: UILabel!
    @IBOutlet weak var BookName8: UILabel!
    @IBOutlet weak var BookName9: UILabel!
    
    
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
    var BookIds:[Int] = []
    var UserEmail:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(UserEmail)
        UserName.text = ""
        NumBook.text = "0"
        NumHeart.text = "0"
        NumPage.text = "0"
        
        // 아래의 정보들을 API 통신으로 불러오는 형태로 수정해야함. (UserEmail 로 검색하기)
        UserApi.shared.getUserByEmail(email: UserEmail){ res in
            switch res{
            case .success(let data):
                self.UserName.text = data.nickname
                self.NumBook.text = String(data.bookCount)
                self.NumHeart.text = String(data.totalLikeCount)
                self.NumPage.text = String(data.pageCount)
                // 이메일로
            case .failure(let err):
                print(err)
            }
        }
        
        
        // 아래 수정해야함. 아래의 api는 현재 로그인된 사용자를 조회하는거임. 의도는 useremail을 가지고 해야함.
        BookApi.shared.getAllBookOfOtherUser(email: UserEmail){ res in
            switch res{
            case .success(let books):
                self.BookName = books.map({book in book.bookName})
                self.BookHeart = books.map({book in book.totalLikeCount})
                self.BookPage = books.map({book in book.totalPageCount})
                self.BookIds = books.map({book in book.bookId})
                if(self.BookIds.count > 0){
                    self.BookView1.isHidden = false
                    self.BookButton1.isHidden = false
                    self.BookName1.text = self.BookName[0]
                    self.BookHeart1.text = String(self.BookHeart[0])
                    self.BookPage1.text = String(self.BookPage[0])
                }
                if(self.BookIds.count > 1){
                    self.BookView2.isHidden = false
                    self.BookButton2.isHidden = false
                    self.BookName2.text = self.BookName[1]
                    self.BookHeart2.text = String(self.BookHeart[1])
                    self.BookPage2.text = String(self.BookPage[1])
                }
                if(self.BookIds.count > 2){
                    self.BookView3.isHidden = false
                    self.BookButton3.isHidden = false
                    self.BookName3.text = self.BookName[2]
                    self.BookHeart3.text = String(self.BookHeart[2])
                    self.BookPage3.text = String(self.BookPage[2])
                }
                if(self.BookIds.count > 3){
                    self.BookView4.isHidden = false
                    self.BookButton4.isHidden = false
                    self.BookName4.text = self.BookName[3]
                    self.BookHeart4.text = String(self.BookHeart[3])
                    self.BookPage4.text = String(self.BookPage[3])
                }
                if(self.BookIds.count > 4){
                    self.BookView5.isHidden = false
                    self.BookButton5.isHidden = false
                    self.BookName5.text = self.BookName[4]
                    self.BookHeart5.text = String(self.BookHeart[4])
                    self.BookPage5.text = String(self.BookPage[4])
                }
                if(self.BookIds.count > 5){
                    self.BookView6.isHidden = false
                    self.BookButton6.isHidden = false
                    self.BookName6.text = self.BookName[5]
                    self.BookHeart6.text = String(self.BookHeart[5])
                    self.BookPage6.text = String(self.BookPage[5])
                }
                if(self.BookIds.count > 6){
                    self.BookView7.isHidden = false
                    self.BookButton7.isHidden = false
                    self.BookName7.text = self.BookName[6]
                    self.BookHeart7.text = String(self.BookHeart[6])
                    self.BookPage7.text = String(self.BookPage[6])
                }
                if(self.BookIds.count > 7){
                    self.BookView8.isHidden = false
                    self.BookButton8.isHidden = false
                    self.BookName8.text = self.BookName[7]
                    self.BookHeart8.text = String(self.BookHeart[7])
                    self.BookPage8.text = String(self.BookPage[7])
                }
                if(self.BookIds.count > 8){
                    self.BookView9.isHidden = false
                    self.BookButton9.isHidden = false
                    self.BookName9.text = self.BookName[8]
                    self.BookHeart9.text = String(self.BookHeart[8])
                    self.BookPage9.text = String(self.BookPage[8])
                }
                
            case .failure(let err):
                print(err)
            }
        }
        
        //BookName = []
        //BookHeart = []
        //BookPage = []
        //BookIds = []
        
        
        // 이 아래는 수정 필요 없음
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
        
        
        sleep(1)
        
        
    }
    
    
    @IBAction func BookButtonTapped_1(_ sender: UIButton) {
        guard let sbvc = self.storyboard?.instantiateViewController(withIdentifier: "SeeBookVC") as? SeeBookViewController else {return}
        sbvc.BookId = BookIds[0]
        self.navigationController?.pushViewController(sbvc, animated: true)
    }
    
    @IBAction func BookButtonTapped_2(_ sender: UIButton) {
        guard let sbvc = self.storyboard?.instantiateViewController(withIdentifier: "SeeBookVC") as? SeeBookViewController else {return}
        sbvc.BookId = BookIds[1]
        self.navigationController?.pushViewController(sbvc, animated: true)
    }
    
    @IBAction func BookButtonTapped_3(_ sender: UIButton) {
        guard let sbvc = self.storyboard?.instantiateViewController(withIdentifier: "SeeBookVC") as? SeeBookViewController else {return}
        sbvc.BookId = BookIds[2]
        self.navigationController?.pushViewController(sbvc, animated: true)
    }
    
    @IBAction func BookButtonTapped_4(_ sender: UIButton) {
        guard let sbvc = self.storyboard?.instantiateViewController(withIdentifier: "SeeBookVC") as? SeeBookViewController else {return}
        sbvc.BookId = BookIds[3]
        self.navigationController?.pushViewController(sbvc, animated: true)
    }
    
    @IBAction func BookButtonTapped_5(_ sender: UIButton) {
        guard let sbvc = self.storyboard?.instantiateViewController(withIdentifier: "SeeBookVC") as? SeeBookViewController else {return}
        sbvc.BookId = BookIds[4]
        self.navigationController?.pushViewController(sbvc, animated: true)
    }
    
    @IBAction func BookButtonTapped_6(_ sender: UIButton) {
        guard let sbvc = self.storyboard?.instantiateViewController(withIdentifier: "SeeBookVC") as? SeeBookViewController else {return}
        sbvc.BookId = BookIds[5]
        self.navigationController?.pushViewController(sbvc, animated: true)
    }
    
    @IBAction func BookButtonTapped_7(_ sender: UIButton) {
        guard let sbvc = self.storyboard?.instantiateViewController(withIdentifier: "SeeBookVC") as? SeeBookViewController else {return}
        sbvc.BookId = BookIds[6]
        self.navigationController?.pushViewController(sbvc, animated: true)
    }
    
    @IBAction func BookButtonTapped_8(_ sender: UIButton) {
        guard let sbvc = self.storyboard?.instantiateViewController(withIdentifier: "SeeBookVC") as? SeeBookViewController else {return}
        sbvc.BookId = BookIds[7]
        self.navigationController?.pushViewController(sbvc, animated: true)
    }
    
    @IBAction func BookButtonTapped_9(_ sender: UIButton) {
        guard let sbvc = self.storyboard?.instantiateViewController(withIdentifier: "SeeBookVC") as? SeeBookViewController else {return}
        sbvc.BookId = BookIds[8]
        self.navigationController?.pushViewController(sbvc, animated: true)
    }
    
    
}
