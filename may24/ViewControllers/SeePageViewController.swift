//
//  SeePageViewController.swift
//  may24
//
//  Created by 최병욱 on 6/3/24.
//

import UIKit
import AVFoundation

class SeePageViewController:UIViewController{
    @IBAction func BackButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    private var player: AVAudioPlayer?
    var tts_speaker:String = "nara"
    var tts_emotion:Int = 0
    var tts_emotion_strength:Int = 0
    var tts_text:String = "문장이 입력되지 않았습니다"
    var tts_volume:Int = 0
    var tts_speed:Int = 0
    var tts_pitch:Int = 0
    
    
    
    
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
    
    @IBOutlet weak var VoiceView_1: UIView!
    @IBOutlet weak var VoiceView_2: UIView!
    @IBOutlet weak var VoiceView_3: UIView!
    
    
    
    @IBOutlet weak var VoiceLabel_1: UILabel!
    @IBOutlet weak var VoiceLabel_2: UILabel!
    @IBOutlet weak var VoiceLabel_3: UILabel!
    
    var voice_emails:[String] = ["","",""]
    var voice_ids:[Int] = [0, 0, 0]
    var voice_name:String = ""
    var voice_flag:Int = 0
    var voice_ID:Int = 0
    
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
        
        VoiceView_1.layer.cornerRadius = 20
        VoiceView_1.layer.borderColor = UIColor.lightGray.cgColor
        VoiceView_1.layer.borderWidth = 2
        
        VoiceView_2.layer.cornerRadius = 20
        VoiceView_2.layer.borderColor = UIColor.lightGray.cgColor
        VoiceView_2.layer.borderWidth = 2
        
        VoiceView_3.layer.cornerRadius = 20
        VoiceView_3.layer.borderColor = UIColor.lightGray.cgColor
        VoiceView_3.layer.borderWidth = 2
        
        
        
        
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
        
        VoiceApi.shared.getScrappedVoiceList(){res in
            switch res{
            case .success(let data):
                print(data)
                if(data.count > 0){
                    self.voice_ids[1] = data[0].id
                    self.VoiceLabel_2.text = data[0].userNickname + " 님의 목소리"
                }
                if(data.count > 1){
                    self.voice_ids[2] = data[1].id
                    self.VoiceLabel_3.text = data[1].userNickname + " 님의 목소리"
                }
                
            case .failure(let err):
                print(err)
            }
        }
        
        
        
    } // end of ViewDidLoad
    
    
    @IBAction func PlayButtonTapped(_ sender: UIButton) {
        PlayImage.isHidden = true
        PlayButton.isHidden = true
        PauseImage.isHidden = false
        PauseButton.isHidden = false
        print(voice_flag)
        
        
        if(voice_flag == 0){
            // CLOVA로 TTS
            if(voice_name == "CLOVA_simple"){
                self.tts_speaker = "nara"
                self.tts_emotion = 0
            }
            if(voice_name == "CLOVA_sad_0"){
                self.tts_speaker = "ngoeun"
                self.tts_emotion = 1
                self.tts_emotion_strength = 0
            }
            if(voice_name == "CLOVA_sad_1"){
                self.tts_speaker = "ngoeun"
                self.tts_emotion = 1
                self.tts_emotion_strength = 1
            }
            if(voice_name == "CLOVA_sad_2"){
                self.tts_speaker = "ngoeun"
                self.tts_emotion = 1
                self.tts_emotion_strength = 2
            }
            if(voice_name == "CLOVA_happy_0"){
                self.tts_speaker = "ndonghyun"
                self.tts_emotion = 2
                self.tts_emotion_strength = 0
            }
            if(voice_name == "CLOVA_happy_1"){
                self.tts_speaker = "ndonghyun"
                self.tts_emotion = 2
                self.tts_emotion_strength = 1
            }
            if(voice_name == "CLOVA_happy_2"){
                self.tts_speaker = "ndonghyun"
                self.tts_emotion = 2
                self.tts_emotion_strength = 2
            }
            if(voice_name == "CLOVA_rage_0"){
                self.tts_speaker = "ndonghyun"
                self.tts_emotion = 3
                self.tts_emotion_strength = 0
            }
            if(voice_name == "CLOVA_rage_1"){
                self.tts_speaker = "ndonghyun"
                self.tts_emotion = 3
                self.tts_emotion_strength = 1
            }
            if(voice_name == "CLOVA_rage_2"){
                self.tts_speaker = "ndonghyun"
                self.tts_emotion = 3
                self.tts_emotion_strength = 2
            }
            
            let session = AVAudioSession.sharedInstance()
            
            try? session.setCategory(.playAndRecord, options: [.allowAirPlay,.allowBluetooth,.defaultToSpeaker])
            try? session.setActive(true)
            
            self.tts_text = ContentTextView.text!
            
            let data = NSMutableData(data: "speaker=\(tts_speaker)".data(using: .utf8)!)
            data.append("&text=\(tts_text)".data(using: .utf8)!)
            data.append("&volume=\(tts_volume)".data(using: .utf8)!)
            data.append("&speed=\(tts_speed)".data(using: .utf8)!)
            data.append("&pitch=\(tts_pitch)".data(using: .utf8)!)
            
            let url = URL(string: "https://naveropenapi.apigw.ntruss.com/tts-premium/v1/tts")!
            let headers = [
                "Content-Type": "application/x-www-form-urlencoded",
                "X-NCP-APIGW-API-KEY-ID": "4k0u4eeqjb",
                "X-NCP-APIGW-API-KEY": "6UCOsnQ7DgDuPP7sGKNvNnYOfUusxbftQ3Pw1MUR"
            ]
            
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.allHTTPHeaderFields = headers
            request.httpBody = data as Data
            
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print(error)
                } else if let data = data {
                    self.player = try? AVAudioPlayer(data: data)
                    self.player?.prepareToPlay()
                    self.player?.play()
                }
            }
            
            task.resume()
        }
        else{
            // 우리 API로 TTS
            voice_ID = voice_ids[voice_flag]
            VoiceApi.shared.getAudibleTextData(
                    emotion: "중립",
                    content: "안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 안녕하세요 ",
                    intensity: 0,
                    voiceId: voice_ID
                ) { res in
                    switch res {
                    case .failure(let error):
                        print(error)
                        //todo: error handle
                        
                    case .success(let data):
                        self.playAudioData(data: data)
                    }
                    
                }
            
        }
        
        
    }
    
    
    @IBAction func PauseButtonTapped(_ sender: UIButton) {
        self.player?.pause()
        PlayImage.isHidden = false
        PlayButton.isHidden = false
        PauseImage.isHidden = true
        PauseButton.isHidden = true
    }
    
    @IBAction func VoiceTapped_1(_ sender: UIButton) {
        if(EmotionType.text == "중립"){ voice_name = "CLOVA_simple" }
        if(EmotionType.text == "행복"){
            if(EmotionLevel.text == "낮음"){ voice_name = "CLOVA_happy_0" }
            if(EmotionLevel.text == "보통"){ voice_name = "CLOVA_happy_1" }
            if(EmotionLevel.text == "높음"){ voice_name = "CLOVA_happy_2" }
        }
        if(EmotionType.text == "슬픔"){
            if(EmotionLevel.text == "낮음"){ voice_name = "CLOVA_sad_0" }
            if(EmotionLevel.text == "보통"){ voice_name = "CLOVA_sad_1" }
            if(EmotionLevel.text == "높음"){ voice_name = "CLOVA_sad_2" }
        }
        if(EmotionType.text == "분노"){
            if(EmotionLevel.text == "낮음"){ voice_name = "CLOVA_rage_0" }
            if(EmotionLevel.text == "보통"){ voice_name = "CLOVA_rage_1" }
            if(EmotionLevel.text == "높음"){ voice_name = "CLOVA_rage_2" }
        }
        voice_flag = 0
        
        VoiceView_1.layer.borderColor = UIColor.black.cgColor
        VoiceView_2.layer.borderColor = UIColor.lightGray.cgColor
        VoiceView_3.layer.borderColor = UIColor.lightGray.cgColor
        
        VoiceLabel_1.textColor = UIColor.black
        VoiceLabel_2.textColor = UIColor.lightGray
        VoiceLabel_3.textColor = UIColor.lightGray
    }
    
    @IBAction func VoiceTapped_2(_ sender: UIButton) {
        voice_flag = 1
        VoiceView_1.layer.borderColor = UIColor.lightGray.cgColor
        VoiceView_2.layer.borderColor = UIColor.black.cgColor
        VoiceView_3.layer.borderColor = UIColor.lightGray.cgColor
        
        VoiceLabel_1.textColor = UIColor.lightGray
        VoiceLabel_2.textColor = UIColor.black
        VoiceLabel_3.textColor = UIColor.lightGray
    }
    
    @IBAction func VoiceTapped_3(_ sender: UIButton) {
        voice_flag = 2
        VoiceView_1.layer.borderColor = UIColor.lightGray.cgColor
        VoiceView_2.layer.borderColor = UIColor.lightGray.cgColor
        VoiceView_3.layer.borderColor = UIColor.black.cgColor
        
        VoiceLabel_1.textColor = UIColor.lightGray
        VoiceLabel_2.textColor = UIColor.lightGray
        VoiceLabel_3.textColor = UIColor.black
    }
    
    private func playAudioData(data: Data) {
        do {
            player = try AVAudioPlayer(data: data)
        } catch {
            print("error on AVplayer")
            return
        }
        
        // Try to create an AVAudioPlayer object from the data
        guard let audioPlayer = player else {
            // If creating the player fails, it's likely not audio data
            print("Error: Unable to create AVAudioPlayer from data")
            return
        }
        
        audioPlayer.volume = 0.5
        audioPlayer.play()
    }
    
}
