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
    
        var requestParam = [
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
        .responseDecodable(of: LoginResponseDto.self) { res in
            guard let loginRes = res.value else {
                completion(.failure(NSError()))
                return
            }
            
            Authentication.token = loginRes.data?.accessToken ?? "" 
            Authentication.refreshToken = loginRes.data?.refreshToken ?? ""
            
            completion(.success(Authentication.token))
        }
    }
    
    func refreshToken() async throws -> LoginResponseDataDto  {
        let param = [
            "refreshToken": Authentication.refreshToken,
            "accessToken" : Authentication.token
        ]
        return try await AF.request(
            baseUrl + "/reissue",
            method: .post,
            parameters: param,
            headers: ["Content-Type":"application/json", "Accept":"application/json"]
        ).serializingDecodable(LoginResponseDto.self).value.data!
    }
}
