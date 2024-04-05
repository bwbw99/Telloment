//
//  TextToSpeech.swift
//  Telloment
//
//  Created by 박진영 on 4/5/24.
//

import Foundation
import AVFoundation


class TextToSpeech {
    
    private let synthesizer = AVSpeechSynthesizer()
    private var utterance = AVSpeechUtterance()
    private var rate : Float = 0.4
    
    func textToSpeech(text : String) {
        utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR")
        utterance.rate = self.rate
        synthesizer.speak(utterance)
        print("called")
    }
    
    func setRate(rate: Float) {
        self.rate = rate
    }
    
    func getRate() -> Float {
        return self.rate
    }
    
    func stop() {
        synthesizer.stopSpeaking(at: .immediate)
    }
    
    func pause() {
        synthesizer.pauseSpeaking(at: .immediate)
    }
    
    func resume() {
        if(synthesizer.isPaused) {
            synthesizer.continueSpeaking()
        }
    }
    
}

