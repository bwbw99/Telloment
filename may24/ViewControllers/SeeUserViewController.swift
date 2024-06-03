//
//  SeeUserViewController.swift
//  may24
//
//  Created by 최병욱 on 6/3/24.
//

import UIKit

class SeeUserViewController:UIViewController{
    
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
    
    var BookName:[String] = []
    var BookHeart:[Int] = []
    var BookPage:[Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 예시
        BookName = ["터키여행기", "안될과학", "유머모음집"]
        BookHeart = [123,22,7]
        BookPage = [13,9,2]
        
        BookView1.isHidden = true
        BookView2.isHidden = true
        BookView3.isHidden = true
        BookView4.isHidden = true
        BookView5.isHidden = true
        BookView6.isHidden = true
        BookView7.isHidden = true
        BookView8.isHidden = true
        BookView9.isHidden = true
        
        if(Int(NumBook.text!)! > 0){
            BookView1.isHidden = false
            BookName1.text = BookName[0]
            BookHeart1.text = String(BookHeart[0])
            BookPage1.text = String(BookPage[0])
        }
        if(Int(NumBook.text!)! > 1){
            BookView2.isHidden = false
            BookName2.text = BookName[1]
            BookHeart2.text = String(BookHeart[1])
            BookPage2.text = String(BookPage[1])
        }
        if(Int(NumBook.text!)! > 2){
            BookView3.isHidden = false
            BookName3.text = BookName[2]
            BookHeart3.text = String(BookHeart[2])
            BookPage3.text = String(BookPage[2])
        }
        if(Int(NumBook.text!)! > 3){
            BookView4.isHidden = false
            BookName4.text = BookName[3]
            BookHeart4.text = String(BookHeart[3])
            BookPage4.text = String(BookPage[3])
        }
        if(Int(NumBook.text!)! > 4){
            BookView5.isHidden = false
            BookName5.text = BookName[4]
            BookHeart5.text = String(BookHeart[4])
            BookPage5.text = String(BookPage[4])
        }
        if(Int(NumBook.text!)! > 5){
            BookView6.isHidden = false
            BookName6.text = BookName[5]
            BookHeart6.text = String(BookHeart[5])
            BookPage6.text = String(BookPage[5])
        }
        if(Int(NumBook.text!)! > 6){
            BookView7.isHidden = false
            BookName7.text = BookName[6]
            BookHeart7.text = String(BookHeart[6])
            BookPage7.text = String(BookPage[6])
        }
        if(Int(NumBook.text!)! > 7){
            BookView8.isHidden = false
            BookName8.text = BookName[7]
            BookHeart8.text = String(BookHeart[7])
            BookPage8.text = String(BookPage[7])
        }
        if(Int(NumBook.text!)! > 8){
            BookView9.isHidden = false
            BookName9.text = BookName[8]
            BookHeart9.text = String(BookHeart[8])
            BookPage9.text = String(BookPage[8])
        }
        
        
    }
    
    
    
}
