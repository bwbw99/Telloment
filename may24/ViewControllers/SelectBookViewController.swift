//
//  SelectBookViewController.swift
//  may24
//
//  Created by 최병욱 on 6/1/24.
//

import UIKit

class SelectBookViewController:UIViewController{
    
    
    @IBAction func BackButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    var sbvc_wvc_delegate : SBVC_TO_WVC?
    
    @IBOutlet weak var Inner_ScrollView_Height: NSLayoutConstraint!
    
    
    @IBOutlet weak var Book_View_1: UIView!
    @IBOutlet weak var Book_View_2: UIView!
    @IBOutlet weak var Book_View_3: UIView!
    @IBOutlet weak var Book_View_4: UIView!
    @IBOutlet weak var Book_View_5: UIView!
    @IBOutlet weak var Book_View_6: UIView!
    @IBOutlet weak var Book_View_7: UIView!
    @IBOutlet weak var Book_View_8: UIView!
    @IBOutlet weak var Book_View_9: UIView!
    
    @IBOutlet weak var Book_Title_1: UILabel!
    @IBOutlet weak var Book_Title_2: UILabel!
    @IBOutlet weak var Book_Title_3: UILabel!
    @IBOutlet weak var Book_Title_4: UILabel!
    @IBOutlet weak var Book_Title_5: UILabel!
    @IBOutlet weak var Book_Title_6: UILabel!
    @IBOutlet weak var Book_Title_7: UILabel!
    @IBOutlet weak var Book_Title_8: UILabel!
    @IBOutlet weak var Book_Title_9: UILabel!
    
    @IBOutlet weak var Book_Heart_1: UILabel!
    @IBOutlet weak var Book_Heart_2: UILabel!
    @IBOutlet weak var Book_Heart_3: UILabel!
    @IBOutlet weak var Book_Heart_4: UILabel!
    @IBOutlet weak var Book_Heart_5: UILabel!
    @IBOutlet weak var Book_Heart_6: UILabel!
    @IBOutlet weak var Book_Heart_7: UILabel!
    @IBOutlet weak var Book_Heart_8: UILabel!
    @IBOutlet weak var Book_Heart_9: UILabel!
    
    @IBOutlet weak var Book_Page_1: UILabel!
    @IBOutlet weak var Book_Page_2: UILabel!
    @IBOutlet weak var Book_Page_3: UILabel!
    @IBOutlet weak var Book_Page_4: UILabel!
    @IBOutlet weak var Book_Page_5: UILabel!
    @IBOutlet weak var Book_Page_6: UILabel!
    @IBOutlet weak var Book_Page_7: UILabel!
    @IBOutlet weak var Book_Page_8: UILabel!
    @IBOutlet weak var Book_Page_9: UILabel!
    
    
    
    
    
    
    
    
    
    var BookID:[Int] = []
    var BookName:[String] = []
    var BookHeart:[Int] = []
    var BookPage:[Int] = []
    
    
    
    @IBOutlet weak var BookAddView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BookAddView.layer.cornerRadius = 20
        BookAddView.layer.borderWidth = 2
        BookAddView.layer.borderColor = UIColor.black.cgColor
        
        Book_View_1.isHidden = true
        Book_View_2.isHidden = true
        Book_View_3.isHidden = true
        Book_View_4.isHidden = true
        Book_View_5.isHidden = true
        Book_View_6.isHidden = true
        Book_View_7.isHidden = true
        Book_View_8.isHidden = true
        Book_View_9.isHidden = true
        
        Inner_ScrollView_Height.constant = 300
        
        
        // 여기에 북 조회하는 API를 연결
        BookApi.shared.getAllBookOfCurrentUser(authToken: Authentication.token){ res in
            switch res{
            case .success(let books):
                self.BookName = books.map({book in book.bookName})
                self.BookHeart = books.map({book in book.totalLikeCount})
                self.BookPage = books.map({book in book.totalPageCount})
                self.BookID = books.map({book in book.bookId})
                var len_books = self.BookName.count
                var i:Int = 0
                if (len_books > i){
                    self.Book_View_1.isHidden = false
                    self.Book_Title_1.text = self.BookName[i]
                    self.Book_Heart_1.text = String(self.BookHeart[i])
                    self.Book_Page_1.text = String(self.BookPage[i])
                    i += 1
                }
                if (len_books > i){
                    self.Book_View_2.isHidden = false
                    self.Book_Title_2.text = self.BookName[i]
                    self.Book_Heart_2.text = String(self.BookHeart[i])
                    self.Book_Page_2.text = String(self.BookPage[i])
                    i += 1
                }
                if (len_books > i){
                    self.Book_View_3.isHidden = false
                    self.Book_Title_3.text = self.BookName[i]
                    self.Book_Heart_3.text = String(self.BookHeart[i])
                    self.Book_Page_3.text = String(self.BookPage[i])
                    i += 1
                }
                if (len_books > i){
                    self.Inner_ScrollView_Height.constant = 460
                    self.Book_View_4.isHidden = false
                    self.Book_Title_4.text = self.BookName[i]
                    self.Book_Heart_4.text = String(self.BookHeart[i])
                    self.Book_Page_4.text = String(self.BookPage[i])
                    i += 1
                }
                if (len_books > i){
                    self.Book_View_5.isHidden = false
                    self.Book_Title_5.text = self.BookName[i]
                    self.Book_Heart_5.text = String(self.BookHeart[i])
                    self.Book_Page_5.text = String(self.BookPage[i])
                    i += 1
                }
                if (len_books > i){
                    self.Book_View_6.isHidden = false
                    self.Book_Title_6.text = self.BookName[i]
                    self.Book_Heart_6.text = String(self.BookHeart[i])
                    self.Book_Page_6.text = String(self.BookPage[i])
                    i += 1
                }
                if (len_books > i){
                    self.Inner_ScrollView_Height.constant = 620
                    self.Book_View_7.isHidden = false
                    self.Book_Title_7.text = self.BookName[i]
                    self.Book_Heart_7.text = String(self.BookHeart[i])
                    self.Book_Page_7.text = String(self.BookPage[i])
                    i += 1
                }
                if (len_books > i){
                    self.Book_View_8.isHidden = false
                    self.Book_Title_8.text = self.BookName[i]
                    self.Book_Heart_8.text = String(self.BookHeart[i])
                    self.Book_Page_8.text = String(self.BookPage[i])
                    i += 1
                }
                if (len_books > i){
                    self.Book_View_9.isHidden = false
                    self.Book_Title_9.text = self.BookName[i]
                    self.Book_Heart_9.text = String(self.BookHeart[i])
                    self.Book_Page_9.text = String(self.BookPage[i])
                    i += 1
                }
            case .failure(let err):
                print(err)
            }
        }
        
    } // end of viewdidload
    
    
    
    @IBAction func BookButtonTapped_1(_ sender: UIButton) {
        sbvc_wvc_delegate?.sendData(BookTitle: BookName[0], BookId: BookID[0])
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func BookButtonTapped_2(_ sender: UIButton) {
        sbvc_wvc_delegate?.sendData(BookTitle: BookName[1], BookId: BookID[1])
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func BookButtonTapped_3(_ sender: UIButton) {
        sbvc_wvc_delegate?.sendData(BookTitle: BookName[2], BookId: BookID[2])
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func BookButtonTapped_4(_ sender: UIButton) {
        sbvc_wvc_delegate?.sendData(BookTitle: BookName[3], BookId: BookID[3])
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func BookButtonTapped_5(_ sender: UIButton) {
        sbvc_wvc_delegate?.sendData(BookTitle: BookName[4], BookId: BookID[4])
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func BookButtonTapped_6(_ sender: UIButton) {
        sbvc_wvc_delegate?.sendData(BookTitle: BookName[5], BookId: BookID[5])
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func BookButtonTapped_7(_ sender: UIButton) {
        sbvc_wvc_delegate?.sendData(BookTitle: BookName[6], BookId: BookID[6])
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func BookButtonTapped_8(_ sender: UIButton) {
        sbvc_wvc_delegate?.sendData(BookTitle: BookName[7], BookId: BookID[7])
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func BookButtonTapped_9(_ sender: UIButton) {
        sbvc_wvc_delegate?.sendData(BookTitle: BookName[8], BookId: BookID[8])
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBAction func AddButtonTapped(_ sender: UIButton) {
        guard let abvc = self.storyboard?.instantiateViewController(withIdentifier: "AddBookVC") as? AddBookViewController else {return}
        
        self.navigationController?.pushViewController(abvc, animated: true)
    }
    
    
    
    
}
protocol SBVC_TO_WVC{
    func sendData(BookTitle : String, BookId : Int) -> Void
}
