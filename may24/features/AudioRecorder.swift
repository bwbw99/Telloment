//
//  AudioRecorder.swift
//  may24
//
//  Created by 박진영 on 5/27/24.
//

import Foundation
import AVFoundation
/**
 requestAudioPermission체크로 앱 자체 권한을 허용해주시고
 initRecorder(path)를 통해 파일을 생성해줍니다
 start 시 녹음을 시작하고
 stop 시 멈춥니다.
 */
class AudioRecorder: NSObject, AVAudioRecorderDelegate {
    var audioRecorder: AVAudioRecorder?
    var recordingSession: AVAudioSession!
    var outputFilePath: String?

    override init() {
        super.init()
        recordingSession = AVAudioSession.sharedInstance()
        
        do {
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)
        } catch {
            
        }
    }
    
    
    func requestAudioPermission(){
            AVCaptureDevice.requestAccess(for: .audio, completionHandler: { (granted: Bool) in
                if granted {
                    print("Audio: 권한 허용")
                } else {
                    print("Audio: 권한 거부")
                }
            })
        }
        
    func initRecorder(path: String) {
        
        self.outputFilePath = path
        
        let settings = [
            AVFormatIDKey: kAudioFormatLinearPCM,
            AVSampleRateKey: 44100,
            AVNumberOfChannelsKey: 2,
            AVLinearPCMBitDepthKey: 16,
            AVLinearPCMIsBigEndianKey: false,
            AVLinearPCMIsFloatKey: false
        ] as [String : Any]
        
        do {
            audioRecorder = try AVAudioRecorder(url: URL(fileURLWithPath: path), settings: settings)
            audioRecorder?.delegate = self
            audioRecorder?.prepareToRecord()
        } catch {
            print("Failed to initialize audio recorder: \(error)")
        }
    }

    func start() {
        if let recorder = audioRecorder {
            if !recorder.isRecording {
                recorder.record()
                print("Recording started")
            }
        } else {
            print("Audio recorder is not initialized")
        }
    }

    func stop() {
        if let recorder = audioRecorder {
            if recorder.isRecording {
                recorder.stop()
            }
        }
    }
    
    func fetchData() -> Data? {
        guard let filePath = outputFilePath else {
            print("Error: Recording file path not available")
            return nil
        }

        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: filePath))
            return data
        } catch {
            print("Error reading recorded audio data: \(error)")
            return nil
        }
    }
}

