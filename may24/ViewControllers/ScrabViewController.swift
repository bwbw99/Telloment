//
//  ScrabViewController.swift
//  may24
//
//  Created by 최병욱 on 5/30/24.

// Things To DO
// 1. Line 124, 135 에 목소리 사용 동의 관련 서버통신연결하기
// 2. Line 96에 스크랩 목록을 서버에서 조회하는 코드 구현하기
// 3. Line 176, 189...에 선택한 목소리의 샘플을 들어보기 -> "안녕하세요, 반갑습니다" 라는 문장을 선택한 목소리로 들려주기
// 4. Line 298에 스크랩 목록에서 보이스를 삭제하는 경우, 서버에서도 제거하는 코드 구현하기

import UIKit
import AVFoundation

class ScrabViewController:UIViewController{
    
    @IBOutlet weak var TitleLabel_1: UILabel!
    
    @IBOutlet weak var Outter_1: UIView!
    @IBOutlet weak var Outter_2: UIView!
    
    @IBOutlet weak var Inner_1: UIView!
    @IBOutlet weak var Inner_2: UIView!
    
    @IBOutlet weak var AcceptLabel: UILabel!
    @IBOutlet weak var DeclineLabel: UILabel!
    
    @IBOutlet weak var NoticeLabel: UILabel!
    
    
    // 저장 보이스 관리
    @IBOutlet weak var ListOutlineView: UIView!
    var scrapVoices:[VoiceResponseDto] = []
    
    @IBOutlet weak var EditLabel: UILabel!
    @IBOutlet weak var EditButton: UIButton!
    @IBOutlet weak var EditDoneButton: UIButton!
    
    
    @IBOutlet weak var Voice_1: UIView!
    @IBOutlet weak var Voice_2: UIView!
    @IBOutlet weak var Voice_3: UIView!
    @IBOutlet weak var Voice_4: UIView!
    @IBOutlet weak var Voice_5: UIView!
    
    
    @IBOutlet var VoiceViews: [UIView]!
    
    
    
    @IBOutlet weak var VoiceLabel_1: UILabel!
    @IBOutlet weak var VoiceLabel_2: UILabel!
    @IBOutlet weak var VoiceLabel_3: UILabel!
    @IBOutlet weak var VoiceLabel_4: UILabel!
    @IBOutlet weak var VoiceLabel_5: UILabel!
    
    @IBOutlet weak var play_1: UIImageView!
    @IBOutlet weak var play_2: UIImageView!
    @IBOutlet weak var play_3: UIImageView!
    @IBOutlet weak var play_4: UIImageView!
    @IBOutlet weak var play_5: UIImageView!
    
    
    @IBOutlet var PlayImages: [UIImageView]!
    
    
    

    @IBOutlet weak var ListHeight: NSLayoutConstraint!
    
    @IBOutlet var Trailings: [NSLayoutConstraint]!
    
    
    private var player :AVAudioPlayer?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Outter_1.layer.cornerRadius = 5
        self.Outter_2.layer.cornerRadius = 5
        self.Inner_1.layer.cornerRadius = 4
        self.Inner_2.layer.cornerRadius = 4
        Outter_1.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        Inner_1.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        Outter_2.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        Inner_2.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        
        for i in VoiceViews{
            i.layer.cornerRadius = 20
            i.layer.borderWidth = 2
            i.layer.borderColor = UIColor.black.cgColor
        }
        
        do {
            try AVAudioSession.sharedInstance().setMode(.default )
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                    
        } catch {
            print("error" )
        }
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        // 서버와 통신해서 스크랩 목록을 scrab 에 저장함
        // ex) scrabs = ["suzy", "abc", "은하수"]
        
        AuthenticationApi.shared.getVoicePermission { res in
            switch res {
            case .failure(let error):
                print(error)
                //todo: error handle
                
            case .success(let permitVoiceUse):
                self.loadVoicePermissionSwitch(permit: permitVoiceUse)
            }
        }
        
        VoiceApi.shared.getScrappedVoiceList { result in
            switch result {
            case .failure(let error):
                print(error) //todo: error handle
            case .success(let list):
                self.scrapVoices = list
            
                self.loadVoiceList()
            }
        }
    }
    
    
    
    @IBAction func AcceptButtonTapped(_ sender: UIButton) {
        
        // 동의한다는 요청을 서버로 전송
        
        AuthenticationApi.shared.updateVoicePermission(permit: true) { res in
            switch res {
            case .failure(let error):
                print(error)
                //todo: error handle
            case .success():
                self.loadVoicePermissionSwitch(permit: true)
            }
        }
        
    }
    
    private func loadVoicePermissionSwitch(permit: Bool) {
        if permit {
            self.AcceptLabel.textColor = UIColor.black
            self.DeclineLabel.textColor = UIColor.lightGray
            self.Outter_1.backgroundColor = UIColor.black
            self.Outter_2.backgroundColor = UIColor.lightGray
            self.NoticeLabel.text = "나의 목소리 모델을 다른 사람이 사용하는 것에 동의합니다."
        }
        else {
            
                self.AcceptLabel.textColor = UIColor.lightGray
                self.DeclineLabel.textColor = UIColor.black
                self.Outter_1.backgroundColor = UIColor.lightGray
                self.Outter_2.backgroundColor = UIColor.black
                self.NoticeLabel.text = "나의 목소리 모델을 다른 사람이 사용할 수 없습니다."
        }
    }
    
    @IBAction func DeclineButtonTapped(_ sender: UIButton) {
        // 거부한다는 요청을 서버로 전송
        AuthenticationApi.shared.updateVoicePermission(permit: false) { res in
            switch res {
            case .failure(let error):
                print(error)
                //todo: error handle
            case .success():
                self.loadVoicePermissionSwitch(permit: false)
            }
        }

    }
    
    
    
    
    
    
    @IBAction func EditButtonTapped(_ sender: UIButton) {
        self.EditLabel.text = "완료"
        self.EditButton.isHidden = true
        self.EditDoneButton.isHidden = false
        for i in Trailings{
            i.constant = 80
        }
        for i in PlayImages{
            i.image = UIImage(systemName: "minus.circle.fill")
            i.tintColor = UIColor.systemPink
        }
    }
    
    
    
    @IBAction func EditDoneButtonTapped(_ sender: UIButton) {
        self.EditLabel.text = "편집"
        self.EditButton.isHidden = false
        self.EditDoneButton.isHidden = true
        
        for i in Trailings{
            i.constant = 10
        }
        
        for i in PlayImages{
            i.image = UIImage(systemName: "play.circle.fill")
            i.tintColor = UIColor.lightGray
        }
    }
    
    
    @IBAction func PlayButtonTapped_1(_ sender: UIButton) {
        if(EditLabel.text == "편집"){
            // 재생기능
            let voiceId = scrapVoices[0].id
            playVoiceTest(voiceId: voiceId)
        }
        else{
            // 삭제기능
            makeRemoveAlert(idx: 0)
        }
    }
    
    
    
    @IBAction func PlayButtonTapped_2(_ sender: UIButton) {
        if(EditLabel.text == "편집"){
            // 재생기능
            let voiceId = scrapVoices[1].id
            playVoiceTest(voiceId: voiceId)
        }
        else{
            // 삭제기능
            makeRemoveAlert(idx: 1)
        }
    }
    
    
    
    @IBAction func PlayButtonTapped_3(_ sender: UIButton) {
        if(EditLabel.text == "편집"){
            // 재생기능
            let voiceId = scrapVoices[2].id
            playVoiceTest(voiceId: voiceId)
        }
        else{
            // 삭제기능
            makeRemoveAlert(idx: 2)
        }
    }
    
    
    
    @IBAction func PlayButtonTapped_4(_ sender: UIButton) {
        if(EditLabel.text == "편집"){
            // 재생기능
            let voiceId = scrapVoices[3].id
            playVoiceTest(voiceId: voiceId)
        }
        else{
            // 삭제기능
            makeRemoveAlert(idx: 3)
        }
    }
    
    
    
    @IBAction func PlayButtonTapped_5(_ sender: UIButton) {
        if(EditLabel.text == "편집"){
            // 재생기능
            let voiceId = scrapVoices[4].id
            playVoiceTest(voiceId: voiceId)
        }
        else{
            // 삭제기능
            makeRemoveAlert(idx: 4)
        }
    }
    
    
    
    
    
    func loadVoiceList(){
        
        let len_scrabs = self.scrapVoices.count
        
        for i in VoiceViews{
            i.isHidden = true
        }
        for i in PlayImages{
            i.isHidden = true
        }
        
        if (len_scrabs >= 1){
            Voice_1.isHidden = false
            play_1.isHidden = false
            VoiceLabel_1.text = scrapVoices[0].userNickname + " 님의 목소리"
            ListHeight.constant = 100
        }
        if (len_scrabs >= 2){
            Voice_2.isHidden = false
            play_2.isHidden = false
            VoiceLabel_2.text = scrapVoices[1].userNickname + " 님의 목소리"
            ListHeight.constant = 190
        }
        if (len_scrabs >= 3){
            Voice_3.isHidden = false
            play_3.isHidden = false
            VoiceLabel_3.text = scrapVoices[2].userNickname + " 님의 목소리"
            ListHeight.constant = 280
        }
        if (len_scrabs >= 4){
            Voice_4.isHidden = false
            play_4.isHidden = false
            VoiceLabel_4.text = scrapVoices[3].userNickname + " 님의 목소리"
            ListHeight.constant = 370
        }
        if (len_scrabs >= 5){
            Voice_5.isHidden = false
            play_5.isHidden = false
            VoiceLabel_5.text = scrapVoices[4].userNickname + " 님의 목소리"
            ListHeight.constant = 460
        }
        
    }
    
    
    
    
    
    func makeRemoveAlert(idx:Int){
        let alert = UIAlertController(title:"아래의 보이스를 삭제할까요?",message: self.scrapVoices[idx].userNickname + " 님의 목소리",preferredStyle: UIAlertController.Style.alert)
        let alert_cancel = UIAlertAction(title: "취소", style: .default, handler: nil)
        //확인 버튼 만들기
        let alert_delete = UIAlertAction(title: "삭제", style: .destructive, handler: { action in
            let voiceToRemove = self.scrapVoices[idx]
            VoiceApi.shared.removeVoiceScrap(voiceId: voiceToRemove.id) { res in
                switch res {
                case .failure(let error):
                    print(error)
                    //todo: error handle
                case .success():
                    self.scrapVoices.remove(at: idx)
                    self.loadVoiceList( )
                }
            }
            // 지우고 싶은 목소리를, 로컬의 스크랩 목록에서는 아래와 같이 클라이언트단에서 제거하고...
            
            // 서버의 스크랩 목록에도 제거 요청
            
        })
        alert.addAction(alert_cancel)
        //확인 버튼 경고창에 추가하기
        alert.addAction(alert_delete)
        present(alert,animated: true,completion: nil)
        
    }
    
    private func playVoiceTest(voiceId:Int) {
        VoiceApi.shared.getAudibleTextData(
            emotion: "중립",
            content: "안녕하세요. 만나서 반갑습니다",
            intensity: 0,
            voiceId: voiceId
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

