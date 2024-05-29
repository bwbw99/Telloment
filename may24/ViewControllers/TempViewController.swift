//
//  TempViewController.swift
//  may24
//
//  Created by 최병욱 on 5/29/24.
//

import UIKit

class TempViewController:UIViewController{
    var audioRecorder: AudioRecorder = AudioRecorder()
    
    @IBAction func RecordButtonTapped(_ sender: UIButton) {
        
        audioRecorder.initRecorder(path: "temp.wav")
        audioRecorder.start()
        
    }
    
    @IBAction func RecordStopButtonTapped(_ sender: UIButton) {
        
        audioRecorder.stop()
        
        
    }
    
    
    
    
}
