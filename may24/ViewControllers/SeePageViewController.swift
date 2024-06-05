//
//  SeePageViewController.swift
//  may24
//
//  Created by 최병욱 on 6/3/24.
//

import UIKit

class SeePageViewController:UIViewController{
    @IBAction func BackButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    var PageId: Int = 1
    
    @IBOutlet weak var InnerScrollView: UIView!
    
    @IBOutlet weak var PageTitle: UILabel!
    
    @IBOutlet weak var Tag_1: UILabel!
    @IBOutlet weak var Tag_2: UILabel!
    @IBOutlet weak var Tag_3: UILabel!
    
    @IBOutlet weak var ContentTextView: UITextView!
    @IBOutlet weak var Heart: UILabel!
    
    @IBOutlet weak var PlayImage: UIImageView!
    @IBOutlet weak var PauseImage: UIImageView!
    @IBOutlet weak var PlayButton: UIButton!
    @IBOutlet weak var PauseButton: UIButton!
    
    @IBOutlet weak var EmotionType: UILabel!
    @IBOutlet weak var EmotionLevel: UILabel!
    
    @IBOutlet weak var ChangeVoiceView: UIView!
    
    
    @IBOutlet weak var TotalHeight: NSLayoutConstraint!
    
    
    var Tags:[String] = []
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TotalHeight.constant = ContentTextView.frame.size.height + 400
        
        // 아래의 정보들을 API 통신으로 불러오는 형태로 수정해야함.
        print(PageId)
        PageTitle.text = "페이지 제목 11"
        Tags = ["테스트1","택택"]
        ContentTextView.text = "가나다라마바사아자차카타파하"
        Heart.text = "8"
        EmotionType.text = "슬픔"
        EmotionLevel.text = "낮음"
        
        
        // 아래는 수정 필요 없음
        Tag_1.isHidden = true
        Tag_2.isHidden = true
        Tag_3.isHidden = true
        
        
        var i:Int = 0
        if(Tags.count > i){
            Tag_1.isHidden = false
            Tag_1.text = "#" + Tags[i]
            i += 1
        }
        if(Tags.count > i){
            Tag_2.isHidden = false
            Tag_2.text = "#" + Tags[i]
            i += 1
        }
        if(Tags.count > i){
            Tag_3.isHidden = false
            Tag_3.text = "#" + Tags[i]
            i += 1
        }
        
        
        ChangeVoiceView.layer.cornerRadius = 20
        ChangeVoiceView.layer.borderColor = UIColor.black.cgColor
        ChangeVoiceView.layer.borderWidth = 2
        
    }
    
    
    @IBAction func PlayButtonTapped(_ sender: UIButton) {
        PlayImage.isHidden = true
        PlayButton.isHidden = true
        PauseImage.isHidden = false
        PauseButton.isHidden = false
    }
    
    
    @IBAction func PauseButtonTapped(_ sender: UIButton) {
        PlayImage.isHidden = false
        PlayButton.isHidden = false
        PauseImage.isHidden = true
        PauseButton.isHidden = true
    }
    
    @IBAction func ChangeVoiceButtonTapped(_ sender: UIButton) {
    }
    
}
