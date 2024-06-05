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
    
    
    
    
    
    
    
    
    
    var BookIds:[Int] = []
    var BookNames:[String] = []
    var BookHearts:[Int] = []
    var BookPages:[Int] = []
    
    
    
    @IBOutlet weak var BookAddView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BookAddView.layer.cornerRadius = 20
        BookAddView.layer.borderWidth = 2
        BookAddView.layer.borderColor = UIColor.black.cgColor
        
        // 여기에 북 조회하는 API를 연결
        BookIds = [2001,2002,2003,2004]
        BookNames = ["터키여행기","안될과학","영화리뷰","북제목"]
        BookHearts = [130,131,132,133]
        BookPages = [3,4,5,6]
        
        
        // 이 아래는 UI 관련 부분
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
        
        var i:Int = 0
        if(BookIds.count > i){
            Book_View_1.isHidden = false
            Book_Title_1.text = BookNames[i]
            Book_Heart_1.text = String(BookHearts[i])
            Book_Page_1.text = String(BookPages[i])
            i += 1
        }
        if(BookIds.count > i){
            Book_View_2.isHidden = false
            Book_Title_2.text = BookNames[i]
            Book_Heart_2.text = String(BookHearts[i])
            Book_Page_2.text = String(BookPages[i])
            i += 1
        }
        if(BookIds.count > i){
            Book_View_3.isHidden = false
            Book_Title_3.text = BookNames[i]
            Book_Heart_3.text = String(BookHearts[i])
            Book_Page_3.text = String(BookPages[i])
            i += 1
        }
        if(BookIds.count > i){
            Inner_ScrollView_Height.constant = 460
            Book_View_4.isHidden = false
            Book_Title_4.text = BookNames[i]
            Book_Heart_4.text = String(BookHearts[i])
            Book_Page_4.text = String(BookPages[i])
            i += 1
        }
        if(BookIds.count > i){
            Book_View_5.isHidden = false
            Book_Title_5.text = BookNames[i]
            Book_Heart_5.text = String(BookHearts[i])
            Book_Page_5.text = String(BookPages[i])
            i += 1
        }
        if(BookIds.count > i){
            Book_View_6.isHidden = false
            Book_Title_6.text = BookNames[i]
            Book_Heart_6.text = String(BookHearts[i])
            Book_Page_6.text = String(BookPages[i])
            i += 1
        }
        if(BookIds.count > i){
            Inner_ScrollView_Height.constant = 620
            Book_View_7.isHidden = false
            Book_Title_7.text = BookNames[i]
            Book_Heart_7.text = String(BookHearts[i])
            Book_Page_7.text = String(BookPages[i])
            i += 1
        }
        if(BookIds.count > i){
            Book_View_8.isHidden = false
            Book_Title_8.text = BookNames[i]
            Book_Heart_8.text = String(BookHearts[i])
            Book_Page_8.text = String(BookPages[i])
            i += 1
        }
        if(BookIds.count > i){
            Book_View_9.isHidden = false
            Book_Title_9.text = BookNames[i]
            Book_Heart_9.text = String(BookHearts[i])
            Book_Page_9.text = String(BookPages[i])
            i += 1
        }
        
        
        
        
    } // end of viewdidload
    
    
    
    @IBAction func BookButtonTapped_1(_ sender: UIButton) {
        sbvc_wvc_delegate?.sendData(BookTitle: BookNames[0])
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func BookButtonTapped_2(_ sender: UIButton) {
        sbvc_wvc_delegate?.sendData(BookTitle: BookNames[1])
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func BookButtonTapped_3(_ sender: UIButton) {
        sbvc_wvc_delegate?.sendData(BookTitle: BookNames[2])
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func BookButtonTapped_4(_ sender: UIButton) {
        sbvc_wvc_delegate?.sendData(BookTitle: BookNames[3])
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func BookButtonTapped_5(_ sender: UIButton) {
        sbvc_wvc_delegate?.sendData(BookTitle: BookNames[4])
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func BookButtonTapped_6(_ sender: UIButton) {
        sbvc_wvc_delegate?.sendData(BookTitle: BookNames[5])
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func BookButtonTapped_7(_ sender: UIButton) {
        sbvc_wvc_delegate?.sendData(BookTitle: BookNames[6])
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func BookButtonTapped_8(_ sender: UIButton) {
        sbvc_wvc_delegate?.sendData(BookTitle: BookNames[7])
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func BookButtonTapped_9(_ sender: UIButton) {
        sbvc_wvc_delegate?.sendData(BookTitle: BookNames[8])
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBAction func AddButtonTapped(_ sender: UIButton) {
        guard let abvc = self.storyboard?.instantiateViewController(withIdentifier: "AddBookVC") as? AddBookViewController else {return}
        
        self.navigationController?.pushViewController(abvc, animated: true)
    }
    
    
    
    
}
protocol SBVC_TO_WVC{
    func sendData(BookTitle : String) -> Void
}
