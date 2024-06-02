//
//  WriteContentViewController.swift
//  may24
//
//  Created by 최병욱 on 6/1/24.
//

import UIKit

class WriteContentViewController:UIViewController,EmotionDelegate_1{
    func EVC_To_WCVC_Type(type: String) {
        self.EmotionTypeLabel.text = type
        if(type == "중립"){
            self.HideView.isHidden = false
        }
        else{
            self.HideView.isHidden = true
        }
    }
    
    func EVC_TO_WCVC_Level(level: String) {
        self.EmotionLevelLabel.text = level
    }
    
    
    
    @IBAction func BackButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        
    }
    @IBOutlet weak var CircleView: UIView!
    
    @IBOutlet weak var ContentTextField: UITextField!
    
    
    @IBOutlet weak var DualView: UIView!
    @IBOutlet weak var DualLabel: UILabel!
    @IBOutlet weak var EmotionButton: UIButton!
    @IBOutlet weak var EditButton: UIButton!
    
    
    @IBOutlet weak var EmotionView: UIView!
    
    @IBOutlet weak var EmotionTypeLabel: UILabel!
    @IBOutlet weak var EmotionLevelLabel: UILabel!
    
    @IBOutlet weak var HideView: UIView!
    
    @IBOutlet weak var DoneView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboard()
        
        CircleView.layer.cornerRadius = 35
        CircleView.layer.borderColor = UIColor.black.cgColor
        CircleView.layer.borderWidth = 2
        
        ContentTextField.text = "이곳에 내용을 입력하세요."
        let attrString = NSMutableAttributedString(string: ContentTextField.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 20
        paragraphStyle.alignment = .natural
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        ContentTextField.attributedText = attrString
        
        EditButton.isHidden = true
        EmotionView.isHidden = true
        
        DualView.layer.cornerRadius = 20
        DualView.layer.borderColor = UIColor.black.cgColor
        DualView.layer.borderWidth = 2
        
        
        DoneView.layer.cornerRadius = 20
        DoneView.layer.borderColor = UIColor.black.cgColor
        DoneView.layer.borderWidth = 2
        
        HideView.isHidden = true
        
    }
    
    @IBAction func EmotionButtonTapped(_ sender: UIButton) {
        EmotionView.isHidden = false
        EditButton.isHidden = false
        EmotionButton.isHidden = true
        DualLabel.text = "직접 변경"
        
        // 감정 분석을 해서 label에 연결
        
        
        if(EmotionTypeLabel.text == "중립"){
            HideView.isHidden = false
        }
        
    }
    
    
    @IBAction func EditButtonTapped(_ sender: UIButton) {
        guard let evc = self.storyboard?.instantiateViewController(identifier: "EmotionVC") as? EmotionViewController else {return}
        evc.emotionDelegate_1 = self
        
        if(EmotionTypeLabel.text == "행복"){
            evc.Type_num = 1
        }
        else if(EmotionTypeLabel.text == "슬픔"){
            evc.Type_num = 2
        }
        else if(EmotionTypeLabel.text == "화남"){
            evc.Type_num = 3
        }
        else{
            evc.Type_num = 4
        }
        
        
        if(EmotionLevelLabel.text == "낮음"){
            evc.Level_num = 1
        }
        else if(EmotionLevelLabel.text == "보통"){
            evc.Level_num = 2
        }
        else{
            evc.Level_num = 3
        }
        
        
        self.navigationController?.pushViewController(evc, animated: true)
    }
    
    
    
    @IBAction func DoneButtonTapped(_ sender: UIButton) {
    }
    
    
    
    
    
}

