//
//  MypageViewController.swift
//  may24
//
//  Created by 최병욱 on 5/17/24.
//

import UIKit
import Darwin

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
        
        NicknameLabel.text = ""
        Num_Book.text = "0"
        Num_Heart.text = "0"
        Num_Page.text = "0"
        BookName = []
        BookHeart = []
        BookPage = []
        BookID = []
        
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
        
       
        
        // 유저 정보를 조회
        UserApi.shared.getCurrentUser(){ res in
            switch res{
            case .success(let profile):
                self.NicknameLabel.text = profile.nickname
                self.Num_Book.text = String(profile.bookCount)
                self.Num_Heart.text = String(profile.totalLikeCount)
                self.Num_Page.text = String(profile.pageCount)
            case .failure(let err):
                print(err)
            }
        }
        
        
        
        // 북 정보를 조회
        BookApi.shared.getAllBookOfCurrentUser(authToken: Authentication.token){ res in
            switch res{
            case .success(let books):
                self.BookName = books.map({book in book.bookName})
                self.BookHeart = books.map({book in book.totalLikeCount})
                self.BookPage = books.map({book in book.totalPageCount})
                self.BookID = books.map({book in book.bookId})
                var len_books = Int(self.Num_Book.text!)!
                var i:Int = 0
                if (len_books > i){
                    self.BookView1.isHidden = false
                    self.BookButton1.isHidden = false
                    self.BookName1.text = self.BookName[i]
                    self.BookHeart1.text = String(self.BookHeart[i])
                    self.BookPage1.text = String(self.BookPage[i])
                    i += 1
                }
                if (len_books > i){
                    self.BookView2.isHidden = false
                    self.BookButton2.isHidden = false
                    self.BookName2.text = self.BookName[i]
                    self.BookHeart2.text = String(self.BookHeart[i])
                    self.BookPage2.text = String(self.BookPage[i])
                    i += 1
                }
                if (len_books > i){
                    self.BookView3.isHidden = false
                    self.BookButton3.isHidden = false
                    self.BookName3.text = self.BookName[i]
                    self.BookHeart3.text = String(self.BookHeart[i])
                    self.BookPage3.text = String(self.BookPage[i])
                    i += 1
                }
                if (len_books > i){
                    self.BookView4.isHidden = false
                    self.BookButton4.isHidden = false
                    self.BookName4.text = self.BookName[i]
                    self.BookHeart4.text = String(self.BookHeart[i])
                    self.BookPage4.text = String(self.BookPage[i])
                    i += 1
                }
                if (len_books > i){
                    self.BookView5.isHidden = false
                    self.BookButton5.isHidden = false
                    self.BookName5.text = self.BookName[i]
                    self.BookHeart5.text = String(self.BookHeart[i])
                    self.BookPage5.text = String(self.BookPage[i])
                    i += 1
                }
                if (len_books > i){
                    self.BookView6.isHidden = false
                    self.BookButton6.isHidden = false
                    self.BookName6.text = self.BookName[i]
                    self.BookHeart6.text = String(self.BookHeart[i])
                    self.BookPage6.text = String(self.BookPage[i])
                    i += 1
                }
                if (len_books > i){
                    self.BookView7.isHidden = false
                    self.BookButton7.isHidden = false
                    self.BookName7.text = self.BookName[i]
                    self.BookHeart7.text = String(self.BookHeart[i])
                    self.BookPage7.text = String(self.BookPage[i])
                    i += 1
                }
                if (len_books > i){
                    self.BookView8.isHidden = false
                    self.BookButton8.isHidden = false
                    self.BookName8.text = self.BookName[i]
                    self.BookHeart8.text = String(self.BookHeart[i])
                    self.BookPage8.text = String(self.BookPage[i])
                    i += 1
                }
                if (len_books > i){
                    self.BookView9.isHidden = false
                    self.BookButton9.isHidden = false
                    self.BookName9.text = self.BookName[i]
                    self.BookHeart9.text = String(self.BookHeart[i])
                    self.BookPage9.text = String(self.BookPage[i])
                    i += 1
                }
            case .failure(let err):
                print(err)
            }
        }
        
        sleep(1)
        
        
    }
    
    
    @IBAction func LogoutButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBAction func BookButtonTapped_1(_ sender: UIButton) {
        guard let sbvc = self.storyboard?.instantiateViewController(identifier: "SeeBookVC") as? SeeBookViewController else { return }
        sbvc.BookId = BookID[0]
        self.navigationController?.pushViewController(sbvc, animated: true)
    }
    
    @IBAction func BookButtonTapped_2(_ sender: UIButton) {
        guard let sbvc = self.storyboard?.instantiateViewController(identifier: "SeeBookVC") as? SeeBookViewController else { return }
        sbvc.BookId = BookID[1]
        self.navigationController?.pushViewController(sbvc, animated: true)
    }
    
    @IBAction func BookButtonTapped_3(_ sender: UIButton) {
        guard let sbvc = self.storyboard?.instantiateViewController(identifier: "SeeBookVC") as? SeeBookViewController else { return }
        sbvc.BookId = BookID[2]
        self.navigationController?.pushViewController(sbvc, animated: true)
    }
    
    @IBAction func BookButtonTapped_4(_ sender: UIButton) {
        guard let sbvc = self.storyboard?.instantiateViewController(identifier: "SeeBookVC") as? SeeBookViewController else { return }
        sbvc.BookId = BookID[3]
        self.navigationController?.pushViewController(sbvc, animated: true)
    }
    
    @IBAction func BookButtonTapped_5(_ sender: UIButton) {
        guard let sbvc = self.storyboard?.instantiateViewController(identifier: "SeeBookVC") as? SeeBookViewController else { return }
        sbvc.BookId = BookID[4]
        self.navigationController?.pushViewController(sbvc, animated: true)
    }
    
    @IBAction func BookButtonTapped_6(_ sender: UIButton) {
        guard let sbvc = self.storyboard?.instantiateViewController(identifier: "SeeBookVC") as? SeeBookViewController else { return }
        sbvc.BookId = BookID[5]
        self.navigationController?.pushViewController(sbvc, animated: true)
    }
    
    @IBAction func BookButtonTapped_7(_ sender: UIButton) {
        guard let sbvc = self.storyboard?.instantiateViewController(identifier: "SeeBookVC") as? SeeBookViewController else { return }
        sbvc.BookId = BookID[6]
        self.navigationController?.pushViewController(sbvc, animated: true)
    }
    
    @IBAction func BookButtonTapped_8(_ sender: UIButton) {
        guard let sbvc = self.storyboard?.instantiateViewController(identifier: "SeeBookVC") as? SeeBookViewController else { return }
        sbvc.BookId = BookID[7]
        self.navigationController?.pushViewController(sbvc, animated: true)
    }
    
    @IBAction func BookButtonTapped_9(_ sender: UIButton) {
        guard let sbvc = self.storyboard?.instantiateViewController(identifier: "SeeBookVC") as? SeeBookViewController else { return }
        sbvc.BookId = BookID[8]
        self.navigationController?.pushViewController(sbvc, animated: true)
    }
    
    
    
    
    
    
}
