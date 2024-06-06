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
            case .failure(let err):
                print(err)
            }
            
        }
        
        //TitleLabel.text = "나홀로 여행기"
        //Tags = ["여행","혼자"]
        //PageIDs = [1238, 1239]
        Contents = ["가나다라마바사아자차카타파하", "ㅇㅇㅇㅇㄱㄱㄱㄱㄱㅇㅇㅇㅇㅇㄴㄴㄴㄴㄹㅁㄹㄷㅁㄹㅁ"]
        Hearts = [122,3]
        
        
        // 위에서 저장한 정보를 바탕으로 화면 출력. 아래는 수정할 필요 없음.
        let len_Tags:Int = Tags.count
        var i:Int = 0
        
        if(len_Tags > i){
            Tag_1.isHidden = false
            Tag_1.text = "#"+Tags[i]
            i += 1
        }
        if(len_Tags > i){
            Tag_2.isHidden = false
            Tag_2.text = "#"+Tags[i]
            i += 1
        }
        if(len_Tags > i){
            Tag_3.isHidden = false
            Tag_3.text = "#"+Tags[i]
            i += 1
        }
        
        
        let len_Pages:Int = Contents.count
        i = 0
        
        if(len_Pages > i){
            PageView1.isHidden = false
            Content1.text = Contents[i]
            Heart1.text = String(Hearts[i])
            i += 1
        }
        if(len_Pages > i){
            PageView2.isHidden = false
            Content2.text = Contents[i]
            Heart2.text = String(Hearts[i])
            i += 1
        }
        if(len_Pages > i){
            PageView3.isHidden = false
            Content3.text = Contents[i]
            Heart3.text = String(Hearts[i])
            i += 1
        }
        if(len_Pages > i){
            PageView4.isHidden = false
            Content4.text = Contents[i]
            Heart4.text = String(Hearts[i])
            i += 1
        }
        if(len_Pages > i){
            PageView5.isHidden = false
            Content5.text = Contents[i]
            Heart5.text = String(Hearts[i])
            i += 1
        }
        if(len_Pages > i){
            PageView6.isHidden = false
            Content6.text = Contents[i]
            Heart6.text = String(Hearts[i])
            i += 1
        }
        if(len_Pages > i){
            PageView7.isHidden = false
            Content7.text = Contents[i]
            Heart7.text = String(Hearts[i])
            i += 1
        }
        if(len_Pages > i){
            PageView8.isHidden = false
            Content8.text = Contents[i]
            Heart8.text = String(Hearts[i])
            i += 1
        }
        
        
        
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
    
    
    
    
    
    
}
