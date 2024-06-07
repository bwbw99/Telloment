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
        }, to: "\(baseUrl)/clone",
                  method: .post,
                  headers: header,
                  interceptor: AuthRequestInterceptor())
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
    
    public func getAudibleTextData(
        emotion: String, //중립 , 화남, 슬픔, 행복
        content: String,
        intensity:Int,
        voiceId: Int,
        completion: @escaping (Result<Data, Error>) -> Void
    ) {
        let requestParams = [
            "content": content,
            "emotion": emotion,
            "intensity": intensity
        ] as [String : Any]
        AF.request(
            baseUrl + "/\(voiceId)/speech",
            method: .get,
            parameters: requestParams,
            encoding: URLEncoding.default,
            interceptor: AuthRequestInterceptor()
        )
        //        .validate(statusCode: 200 ..< 300)
        .responseData { response in
            if let error = response.error {
                completion(.failure(error))
                return
            }
            
            guard let v = response.data else {
                completion(.failure(NSError(domain: "api.voice.error", code: -1, userInfo: ["message": "Data is empty"])))
                return
            }
            
            completion(.success(v))
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
                completion(.failure(NSError(domain: "api.voice.error", code: -1, userInfo: ["message": "Data is empty"])))
                return
            }
            
            completion(.success(v))
        }
    }
    
    public func removeVoiceScrap(voiceId: Int, completion: @escaping (Result<Void, Error>) -> Void) {
        AF.request(
            baseUrl + "/\(voiceId)/scrap",
            method: .delete,
            interceptor: AuthRequestInterceptor()
        )
        .responseDecodable(of : BaseResponse<String>.self) { response in
            if let error = response.error {
                completion(.failure(error))
                return
            }
            
            guard let v = response.value else {
                completion(.failure(NSError(domain: "api.voice.error", code: -1, userInfo: ["message": "Data is empty"])))
                return
            }
            
            completion(.success(()))
        }
    }
    
    public func updateVoiceScrap(voiceId: Int, completion: @escaping (Result<Void, Error>) -> Void) {
        AF.request(
            baseUrl + "/\(voiceId)/scrap",
            method: .patch,
            interceptor: AuthRequestInterceptor()
        )
        .responseDecodable(of : BaseResponse<String>.self) { response in
            if let error = response.error {
                completion(.failure(error))
                return
            }
            
            guard let v = response.value else {
                completion(.failure(NSError(domain: "api.voice.error", code: -1, userInfo: ["message": "Data is empty"])))
                return
            }
            
            completion(.success(()))
        }
    }
    
    
    public func 
    getEmotionFromContent(content : String, completion: @escaping (Result<EmotionDto, Error>) -> Void) {
        let param = ["content": content]
        AF.request(
            "\(baseUrl)/emotion",
            method: .get,
            parameters: param,
            encoder: URLEncodedFormParameterEncoder.default,
            interceptor: AuthRequestInterceptor()
        )
        .responseDecodable(of: BaseResponse<EmotionDto>.self) { res in
            if let error = res.error {
                completion(.failure(error))
                return
            }
            
            guard let v = res.value?.data else {
                completion(.failure(NSError(domain: "api.voice.error", code: -1, userInfo: ["message": "Data is empty"])))
                return
            }
            
            completion(.success((v)))
        }
    }

}


