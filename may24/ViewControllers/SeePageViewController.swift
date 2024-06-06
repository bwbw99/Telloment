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
    @IBOutlet weak var HidingView: UIView!
    
    @IBOutlet weak var TotalHeight: NSLayoutConstraint!
    
    
    var Tags:[String] = []
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        Tag_1.isHidden = true
        Tag_2.isHidden = true
        Tag_3.isHidden = true
        HidingView.isHidden = true
        
        
        PageTitle.text = ""
        Tags = []
        ContentTextView.text = ""
        Heart.text = ""
        EmotionType.text = ""
        EmotionLevel.text = ""

        
        
        // 아래의 정보들을 API 통신으로 불러오는 형태로 수정해야함.
        PageApi.shared.getPageById(pageId: PageId){ res in
            switch res{
            case .success(let data):
                self.PageTitle.text = data.title
                self.Tags = data.hashtags
                self.ContentTextView.text = data.content
                // 줄간격 설정하기
                let attrString = NSMutableAttributedString(string: self.ContentTextView.text!)
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.lineSpacing = 15
                attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
                self.ContentTextView.attributedText = attrString
                self.ContentTextView.font = UIFont(name: "BMHANNAAirOTF", size: 20)
                self.TotalHeight.constant = self.ContentTextView.frame.size.height + 1000
                
                self.Heart.text = String(data.likeCount)
                self.EmotionType.text = data.emotionType
                if(data.emotionType == "중립") { self.HidingView.isHidden = false}
                
                if(data.emotionIntensity == 0){ self.EmotionLevel.text = "낮음" }
                if(data.emotionIntensity == 1){ self.EmotionLevel.text = "보통" }
                if(data.emotionIntensity == 2){ self.EmotionLevel.text = "높음" }
                
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
                
            case .failure(let err):
                print(err)
            }
        }
        //sleep(1)
    } // end of ViewDidLoad
    
    
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
