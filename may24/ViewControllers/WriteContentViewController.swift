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
    
    @IBOutlet weak var TagTextField: UITextField!
    
    @IBOutlet weak var DualView: UIView!
    @IBOutlet weak var DualLabel: UILabel!
    @IBOutlet weak var EmotionButton: UIButton!
    @IBOutlet weak var EditButton: UIButton!
    
    
    @IBOutlet weak var EmotionView: UIView!
    
    @IBOutlet weak var EmotionTypeLabel: UILabel!
    @IBOutlet weak var EmotionLevelLabel: UILabel!
    
    @IBOutlet weak var HideView: UIView!
    
    
    
    @IBOutlet weak var VoiceView_1: UIView!
    @IBOutlet weak var VoiceView_2: UIView!
    @IBOutlet weak var VoiceView_3: UIView!
    
    @IBOutlet weak var VoiceLabel_1: UILabel!
    @IBOutlet weak var VoiceLabel_2: UILabel!
    @IBOutlet weak var VoiceLabel_3: UILabel!
    
    
    
    
    
    
    
    
    @IBOutlet weak var DoneView: UIView!
    
    var BookId:Int = 0
    var PageTitle:String = ""
    var defaultVoice:String = ""
    
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
        
        VoiceView_1.layer.cornerRadius = 20
        VoiceView_1.layer.borderWidth = 2
        VoiceView_1.layer.borderColor = UIColor.lightGray.cgColor
        
        VoiceView_2.layer.cornerRadius = 20
        VoiceView_2.layer.borderWidth = 2
        VoiceView_2.layer.borderColor = UIColor.lightGray.cgColor
        
        VoiceView_3.layer.cornerRadius = 20
        VoiceView_3.layer.borderWidth = 2
        VoiceView_3.layer.borderColor = UIColor.lightGray.cgColor
        
        VoiceLabel_1.textColor = UIColor.lightGray
        VoiceLabel_2.textColor = UIColor.lightGray
        VoiceLabel_3.textColor = UIColor.lightGray
            
    }
    
    
    @IBAction func STTButtonTapped(_ sender: UIButton) {
        
        let url = URL(string: "https://naveropenapi.apigw.ntruss.com/recog/v1/stt?lang=Kor")!
        let headers = [
            "Content-Type": "application/octet-stream",
            "X-NCP-APIGW-API-KEY-ID": "4k0u4eeqjb",
            "X-NCP-APIGW-API-KEY": "6UCOsnQ7DgDuPP7sGKNvNnYOfUusxbftQ3Pw1MUR"
        ]
        
        // 녹음을 해서 data에 넣어야 할듯.
        
        let data = NSMutableData(data: "speaker=".data(using: .utf8)!)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = data as Data
        
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error)
            } else if let data = data {
                print(data)
                
            }
        }
        
        task.resume()
        
        
        
        
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
    
    
    @IBAction func VoiceTapped_1(_ sender: UIButton) {
        VoiceView_1.layer.borderColor = UIColor.black.cgColor
        VoiceView_2.layer.borderColor = UIColor.lightGray.cgColor
        VoiceView_3.layer.borderColor = UIColor.lightGray.cgColor
        
        VoiceLabel_1.textColor = UIColor.black
        VoiceLabel_2.textColor = UIColor.lightGray
        VoiceLabel_3.textColor = UIColor.lightGray
        
        defaultVoice = ""
    }
    
    
    
    @IBAction func VoiceTapped_2(_ sender: UIButton) {
        VoiceView_1.layer.borderColor = UIColor.lightGray.cgColor
        VoiceView_2.layer.borderColor = UIColor.black.cgColor
        VoiceView_3.layer.borderColor = UIColor.lightGray.cgColor
        
        VoiceLabel_1.textColor = UIColor.lightGray
        VoiceLabel_2.textColor = UIColor.black
        VoiceLabel_3.textColor = UIColor.lightGray
            
        defaultVoice = ""
    }
    
    
    
    @IBAction func VoiceTapped_3(_ sender: UIButton) {
        VoiceView_1.layer.borderColor = UIColor.lightGray.cgColor
        VoiceView_2.layer.borderColor = UIColor.lightGray.cgColor
        VoiceView_3.layer.borderColor = UIColor.black.cgColor
        
        VoiceLabel_1.textColor = UIColor.lightGray
        VoiceLabel_2.textColor = UIColor.lightGray
        VoiceLabel_3.textColor = UIColor.black
        
        defaultVoice = ""
    }
    
    @IBAction func PlayButtonTapped_1(_ sender: UIButton) {
    }
    
    
    @IBAction func PlayButtonTapped_2(_ sender: UIButton) {
    }
    
    @IBAction func PlayButtonTapped_3(_ sender: UIButton) {
    }
    
    
    
    @IBAction func DoneButtonTapped(_ sender: UIButton) {
        
        var TagArrTemp:[String.SubSequence] = TagTextField.text!.split(separator: ", ", omittingEmptySubsequences: true)
        var TagArr:[String] = []
        for i in TagArrTemp{
            TagArr.append(String(i.suffix(i.count - 1)))
        }
        
       
        var emo_type:String = ""
        if (EmotionTypeLabel.text == "화남") { emo_type = "ANGER" }
        if (EmotionTypeLabel.text == "슬픔") { emo_type = "SADNESS" }
        if (EmotionTypeLabel.text == "행복") { emo_type = "HAPPINESS" }
        if (EmotionTypeLabel.text == "중립") { emo_type = "NEUTRAL" }
        
        
        var emo_intensity:Int = 0
        if (EmotionLevelLabel.text == "낮음") { emo_intensity = 0 }
        if (EmotionLevelLabel.text == "보통") { emo_intensity = 1 }
        if (EmotionLevelLabel.text == "높음") { emo_intensity = 2 }
        
        
        // 아래 api 에 defaultVoice 를 넣을 수 있게 수정 필요한것 같음
        PageApi.shared.savePage(bookId: BookId, content: ContentTextField.text!, emotionIntensity: emo_intensity, emotionType: emo_type, hashtags: TagArr, title: PageTitle){ res in
            switch res{
            case .success(let data):
                print(data)
                print("page saving success")
            case .failure(let err):
                print(err)
            }
        }
    }
    
    
    
    
    
}

