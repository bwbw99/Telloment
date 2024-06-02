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
    }
    
    func EVC_TO_WCVC_Level(level: String) {
        self.EmotionLevelLabel.text = level
    }
    
    var emotionDelegate_2 : EmotionDelegate_2?
    
    
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
        
        
        
    }
    
    @IBAction func EmotionButtonTapped(_ sender: UIButton) {
        EmotionView.isHidden = false
        EditButton.isHidden = false
        EmotionButton.isHidden = true
        DualLabel.text = "직접 변경"
    }
    
    
    @IBAction func EditButtonTapped(_ sender: UIButton) {
        guard let evc = self.storyboard?.instantiateViewController(identifier: "EmotionVC") as? EmotionViewController else {return}
        evc.emotionDelegate_1 = self
        
        if(EmotionTypeLabel.text == "행복" && EmotionLevelLabel.text == "낮음"){
            emotionDelegate_2?.WCVC_TO_EVC(type_num: 1, level_num: 1)
        }
        else if(EmotionTypeLabel.text == "행복" && EmotionLevelLabel.text == "보통"){
            emotionDelegate_2?.WCVC_TO_EVC(type_num: 1, level_num: 2)
        }
        else if(EmotionTypeLabel.text == "행복" && EmotionLevelLabel.text == "높음"){
            emotionDelegate_2?.WCVC_TO_EVC(type_num: 1, level_num: 3)
        }
        else if(EmotionTypeLabel.text == "슬픔" && EmotionLevelLabel.text == "낮음"){
            emotionDelegate_2?.WCVC_TO_EVC(type_num: 2, level_num: 1)
        }
        else if(EmotionTypeLabel.text == "슬픔" && EmotionLevelLabel.text == "보통"){
            emotionDelegate_2?.WCVC_TO_EVC(type_num: 2, level_num: 2)
        }
        else if(EmotionTypeLabel.text == "슬픔" && EmotionLevelLabel.text == "높음"){
            emotionDelegate_2?.WCVC_TO_EVC(type_num: 2, level_num: 3)
        }
        else if(EmotionTypeLabel.text == "화남" && EmotionLevelLabel.text == "낮음"){
            emotionDelegate_2?.WCVC_TO_EVC(type_num: 3, level_num: 1)
        }
        else if(EmotionTypeLabel.text == "화남" && EmotionLevelLabel.text == "보통"){
            emotionDelegate_2?.WCVC_TO_EVC(type_num: 3, level_num: 2)
        }
        else if(EmotionTypeLabel.text == "화남" && EmotionLevelLabel.text == "높음"){
            emotionDelegate_2?.WCVC_TO_EVC(type_num: 3, level_num: 3)
        }
        else{
            emotionDelegate_2?.WCVC_TO_EVC(type_num: 4, level_num: 2)
        }
        
        
        self.navigationController?.pushViewController(evc, animated: true)
    }
    
    
    
    @IBAction func DoneButtonTapped(_ sender: UIButton) {
    }
    
    
    
    
    
}
protocol EmotionDelegate_2 {
    func WCVC_TO_EVC(type_num : Int, level_num : Int) -> Void
}
