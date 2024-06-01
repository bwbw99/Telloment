//
//  AuthenticationApi.swift
//  may24
//
//  Created by 박진영 on 5/26/24.
//
import Alamofire

public class AuthenticationApi {
    
    private let baseUrl = "\(ApiVariables.BaseURL)/auth"
    
    static let shared = AuthenticationApi()
    private init() { }
    
    
    func login(email:String, password: String, completion: @escaping (Result<String, Error>) -> Void) {
    
        let requestParam = [
            "email": email,
            "password": password
        ]
        AF.request(
            baseUrl + "/login",
            method: .post,
            parameters: requestParam,
            encoding: JSONEncoding.default,
            headers: ["Content-Type":"application/json", "Accept":"application/json"])
        .validate(statusCode: 200..<300)
        .responseDecodable(of: BaseResponse<LoginResponseDto>.self) { res in
            guard let loginRes = res.value else {
                completion(.failure(NSError()))
                return
            }
            
            Authentication.token = loginRes.data?.accessToken ?? "" 
            Authentication.refreshToken = loginRes.data?.refreshToken ?? ""
            
            completion(.success(Authentication.token))
        }
    }
    
    func refreshToken() async throws -> LoginResponseDto  {
        let param = [
            "refreshToken": Authentication.refreshToken,
            "accessToken" : Authentication.token
        ]
        return try await AF.request(
            baseUrl + "/reissue",
            method: .post,
            parameters: param,
            headers: ["Content-Type":"application/json", "Accept":"application/json"]
        ).serializingDecodable(BaseResponse<LoginResponseDto>.self).value.data!
    }
    
    func getVoicePermission(completion: @escaping (Result<Bool, Error>) -> Void) {
        AF.request(
            baseUrl + "/voice_permission",
            method: .patch,
            interceptor: AuthRequestInterceptor()
        ).validate(statusCode: 200 ..< 300)
            .responseDecodable(of: BaseResponse<Bool>.self) { response in
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
    
    func updateVoicePermission(permit: Bool, completion: @escaping (Result<Void, Error>) -> Void) {
        let param = [
            "permit": permit
        ]
        AF.request(
            baseUrl + "/voice_permission",
            method: .patch,
            parameters: param,
            interceptor: AuthRequestInterceptor()
        ).validate(statusCode: 200 ..< 300)
            .responseString { response in
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
}
