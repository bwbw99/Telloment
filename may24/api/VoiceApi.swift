//
//  VoiceApi.swift
//  may24
//
//  Created by 박진영 on 5/26/24.
//

import Alamofire

public class VoiceApi {
    private let baseUrl = "\(ApiVariables.BaseURL)/voice"
    
    static let shared = VoiceApi()
    
    private init() { }
    
    public func cloneVoice(userId: String, audioData: Data, completion: @escaping (Result<String, Error>) -> Void) {
        
        let header: HTTPHeaders  = [
            "Content-Type" : "multipart/form-data"
        ]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMddhhmmss"
        let dateString = dateFormatter.string(from: Date())
        let audioFileName = "\(dateString)_audio.wav"
        
        // 멀티파트 데이터를 구성하고 업로드합니다.
        AF.upload(multipartFormData: { multipartFormData in
            // wav 파일을 추가합니다.
            multipartFormData.append(audioData, withName: "audio_file", fileName: audioFileName, mimeType: "audio/wav")
            
            // user_id 문자열 값을 추가합니다.
            if let userData = userId.data(using: .utf8) {
                multipartFormData.append(userData, withName: "user_id")
            }
        }, to: "\(baseUrl)/clone", method: .post, headers: header)
        .validate()
        .responseString { res in
            switch res.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    // Function to fetch the voice list
    public func getScrappedVoiceList(completion: @escaping (Result<[VoiceResponseDto], Error>) -> Void) {
        
        AF.request(
            baseUrl + "/user/scrap/all",
            interceptor: AuthRequestInterceptor()
            )
            .responseDecodable(of : BaseResponse<[VoiceResponseDto]>.self) { response in
                if let error = response.error {
                    completion(.failure(error))
                    return
                }
                
                guard let v = response.value?.data else {
                    completion(.failure(NSError(domain: "com.yourapp.error", code: -1, userInfo: ["message": "Data is empty"])))
                    return
                }
                
                completion(.success(v))
            }
    }
}

