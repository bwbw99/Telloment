//
//  SpeechToText.swift
//  Telloment
//
//  Created by 박진영 on 4/5/24.
//

import Foundation
import Speech

final class SpeechToText: NSObject, SFSpeechRecognizerDelegate {
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "ko-KR"))!
      private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
      private var recognitionTask: SFSpeechRecognitionTask?
      private let audioEngine = AVAudioEngine()
    
    @Published var transcript = ""
    private var isTranscribing = false
    
    override init() {
      super.init()
        self.speechRecognizer.delegate = self
    }
    
    func startTranscribing() {
      // 기존 음성 인식중인지 판단
      guard !isTranscribing else { return }
      
      // 음성 인식 시작 판별 프로퍼티 상태 변경
      isTranscribing = true
      
      // 오디오 엔진이 실행 중이면 중지하고 모든 tap을 제거
      if audioEngine.isRunning {
        audioEngine.stop()
        audioEngine.inputNode.removeTap(onBus: 0)
      }
      
      // 기존 실행된 음성 인식 작업인, recognitionTask가 있다면 해당 작업 취소
      recognitionTask?.cancel()
      recognitionTask = nil
      
      // 오디오 세션 설정 및 활성화
      let audioSession = AVAudioSession.sharedInstance()
      do {
        try audioSession.setCategory(.record, mode: .measurement, options: .duckOthers)
        try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
      } catch {
        print("오디오 세션 설정 실패: \(error)")
        isTranscribing = false
        return
      }
      
      // 음성 인식 요청 생성
      recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
      guard let recognitionRequest = recognitionRequest else {
        // 설정 중 오류 시 음성 인식 상태 변경
        isTranscribing = false
        return
      }
      
      // 부분적 결과 보고 설정
      recognitionRequest.shouldReportPartialResults = true
      
      // 음성 인식 작업 설정
      recognitionTask = speechRecognizer.recognitionTask(with: recognitionRequest) { [weak self] result, error in
        guard let strongSelf = self else { return }
        
        var isFinal = false
        
        if let result = result {
          DispatchQueue.main.async {
            strongSelf.transcript = result.bestTranscription.formattedString
          }
          isFinal = result.isFinal
        }
        
        if error != nil || isFinal {
          // 초기화
          strongSelf.cleanup()
        }
      }
      
      // 오디오 엔진에 tap을 추가
      let recordingFormat = audioEngine.inputNode.outputFormat(forBus: 0)
      audioEngine.inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { buffer, _ in
        recognitionRequest.append(buffer)
      }
      
      // 오디오 엔진 시작
      do {
        try audioEngine.start()
      } catch {
        print("오디오 엔진 시작 실패: \(error)")
        cleanup()
      }
    }
    
    func stopTranscribing() {
        
          recognitionTask?.cancel()
          cleanup()
    
    }
    
    private func cleanup() {
      if audioEngine.isRunning {
        audioEngine.stop()
        audioEngine.inputNode.removeTap(onBus: 0)
      }
      recognitionRequest?.endAudio()
      recognitionRequest = nil
      recognitionTask = nil
      isTranscribing = false // 인식 중 상태 해제
    }
}

