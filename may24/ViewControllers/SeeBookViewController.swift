//
//  SeeBookViewController.swift
//  may24
//
//  Created by 최병욱 on 6/3/24.
//

import UIKit

class SeeBookViewController:UIViewController{
    
    
    
    @IBAction func BackButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var Tag_1: UILabel!
    @IBOutlet weak var Tag_2: UILabel!
    @IBOutlet weak var Tag_3: UILabel!
    
    
    @IBOutlet weak var PageView1: UIView!
    @IBOutlet weak var PageView2: UIView!
    @IBOutlet weak var PageView3: UIView!
    @IBOutlet weak var PageView4: UIView!
    @IBOutlet weak var PageView5: UIView!
    @IBOutlet weak var PageView6: UIView!
    @IBOutlet weak var PageView7: UIView!
    @IBOutlet weak var PageView8: UIView!
    
    
    @IBOutlet weak var Content1: UILabel!
    @IBOutlet weak var Content2: UILabel!
    @IBOutlet weak var Content3: UILabel!
    @IBOutlet weak var Content4: UILabel!
    @IBOutlet weak var Content5: UILabel!
    @IBOutlet weak var Content6: UILabel!
    @IBOutlet weak var Content7: UILabel!
    @IBOutlet weak var Content8: UILabel!
    
    
    @IBOutlet weak var Heart1: UILabel!
    @IBOutlet weak var Heart2: UILabel!
    @IBOutlet weak var Heart3: UILabel!
    @IBOutlet weak var Heart4: UILabel!
    @IBOutlet weak var Heart5: UILabel!
    @IBOutlet weak var Heart6: UILabel!
    @IBOutlet weak var Heart7: UILabel!
    @IBOutlet weak var Heart8: UILabel!
    
    
    var Tags:[String] = []
    var Contents:[String] = []
    var Hearts:[Int] = []
    var PageIDs:[Int] = []
    var BookId:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        TitleLabel.text = ""
        
        Content1.text = ""
        Content2.text = ""
        Content3.text = ""
        Content4.text = ""
        Content5.text = ""
        Content6.text = ""
        Content7.text = ""
        Content8.text = ""
        
        
        Tag_1.isHidden = true
        Tag_2.isHidden = true
        Tag_3.isHidden = true
        
        
        PageView1.isHidden = true
        PageView2.isHidden = true
        PageView3.isHidden = true
        PageView4.isHidden = true
        PageView5.isHidden = true
        PageView6.isHidden = true
        PageView7.isHidden = true
        PageView8.isHidden = true
        
        
        print(BookId)
        // 아래의 정보들을 API 통신으로 불러오는 형태로 수정해야함. (BookId 로 조회하기)
        
        BookApi.shared.getBook(bookId: BookId){ res in
            switch res{
            case .success(let book):
                self.TitleLabel.text = book.bookName
                self.Tags = book.hashtags
                self.PageIDs = book.pageIds
                
                var i:Int = 0
                if(self.Tags.count > i){
                    self.Tag_1.isHidden = false
                    self.Tag_1.text = "#" + self.Tags[i]
                    i += 1
                }
                if(self.Tags.count > i){
                    self.Tag_2.isHidden = false
                    self.Tag_2.text = "#" + self.Tags[i]
                    i += 1
                }
                if(self.Tags.count > i){
                    self.Tag_3.isHidden = false
                    self.Tag_3.text = "#" + self.Tags[i]
                    i += 1
                }
                var temp = 0
                for j in self.PageIDs{
                    print(j)
                    self.loadPage(pageId: j, temp: temp)
                    temp += 1
                }// end of for-loop
                if(temp > 0) { self.PageView1.isHidden = false }
                if(temp > 1) { self.PageView2.isHidden = false }
                if(temp > 2) { self.PageView3.isHidden = false }
                if(temp > 3) { self.PageView4.isHidden = false }
                if(temp > 4) { self.PageView5.isHidden = false }
                if(temp > 5) { self.PageView6.isHidden = false }
                if(temp > 6) { self.PageView7.isHidden = false }
                if(temp > 7) { self.PageView8.isHidden = false }
                
            case .failure(let err):
                print(err)
            }
            
        }
        
        //TitleLabel.text = "나홀로 여행기"
        //Tags = ["여행","혼자"]
        //PageIDs = [1238, 1239]
        //Contents = ["가나다라마바사아자차카타파하", "ㅇㅇㅇㅇㄱㄱㄱㄱㄱㅇㅇㅇㅇㅇㄴㄴㄴㄴㄹㅁㄹㄷㅁㄹㅁ"]
        //Hearts = [122,3]
        
       
        
        
        
    }
    
    
    
    @IBAction func PageButtonTapped_1(_ sender: UIButton) {
       // PageIds[i] 의 값을 넘김
        guard let spvc = self.storyboard?.instantiateViewController(identifier: "SeePageVC") as? SeePageViewController else {return}
        spvc.PageId = PageIDs[0]
        self.navigationController?.pushViewController(spvc, animated: true)
    }
    
    @IBAction func PageButtonTapped_2(_ sender: UIButton) {
        guard let spvc = self.storyboard?.instantiateViewController(identifier: "SeePageVC") as? SeePageViewController else {return}
        spvc.PageId = PageIDs[1]
        self.navigationController?.pushViewController(spvc, animated: true)
    }
    
    @IBAction func PageButtonTapped_3(_ sender: UIButton) {
        guard let spvc = self.storyboard?.instantiateViewController(identifier: "SeePageVC") as? SeePageViewController else {return}
        spvc.PageId = PageIDs[2]
        self.navigationController?.pushViewController(spvc, animated: true)
    }
    
    @IBAction func PageButtonTapped_4(_ sender: UIButton) {
        guard let spvc = self.storyboard?.instantiateViewController(identifier: "SeePageVC") as? SeePageViewController else {return}
        spvc.PageId = PageIDs[3]
        self.navigationController?.pushViewController(spvc, animated: true)
    }
    
    @IBAction func PageButtonTapped_5(_ sender: UIButton) {
        guard let spvc = self.storyboard?.instantiateViewController(identifier: "SeePageVC") as? SeePageViewController else {return}
        spvc.PageId = PageIDs[4]
        self.navigationController?.pushViewController(spvc, animated: true)
    }
    
    @IBAction func PageButtonTapped_6(_ sender: UIButton) {
        guard let spvc = self.storyboard?.instantiateViewController(identifier: "SeePageVC") as? SeePageViewController else {return}
        spvc.PageId = PageIDs[5]
        self.navigationController?.pushViewController(spvc, animated: true)
    }
    
    @IBAction func PageButtonTapped_7(_ sender: UIButton) {
        guard let spvc = self.storyboard?.instantiateViewController(identifier: "SeePageVC") as? SeePageViewController else {return}
        spvc.PageId = PageIDs[6]
        self.navigationController?.pushViewController(spvc, animated: true)
    }
    
    @IBAction func PageButtonTapped_8(_ sender: UIButton) {
        guard let spvc = self.storyboard?.instantiateViewController(identifier: "SeePageVC") as? SeePageViewController else {return}
        spvc.PageId = PageIDs[7]
        self.navigationController?.pushViewController(spvc, animated: true)
    }
    
    
    
    
    private func loadPage(pageId: Int,temp: Int) {
        PageApi.shared.getPageById(pageId: pageId){ res in
            print(res)
            switch res{
            case .success(let data):
                if(temp == 0){
                    print(data)
                    self.Content1.text = data.content
                    self.Heart1.text = String(data.likeCount)
                }
                else if(temp == 1){
                    self.Content2.text = data.content
                    self.Heart2.text = String(data.likeCount)
                }
                else if(temp == 2){
                    self.Content3.text = data.content
                    self.Heart3.text = String(data.likeCount)
                }
                else if(temp == 3){
                    self.Content4.text = data.content
                    self.Heart4.text = String(data.likeCount)
                }
                else if(temp == 4){
                    self.Content5.text = data.content
                    self.Heart5.text = String(data.likeCount)
                }
                else if(temp == 5){
                    self.Content6.text = data.content
                    self.Heart6.text = String(data.likeCount)
                }
                else if(temp == 6){
                    self.Content7.text = data.content
                    self.Heart7.text = String(data.likeCount)
                }
                else{
                    self.Content8.text = data.content
                    self.Heart8.text = String(data.likeCount)
                }
            case .failure(let err):
                print(err)
            } // end of switch
        }
    }
    
}
