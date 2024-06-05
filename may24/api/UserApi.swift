//
//  UserApi.swift
//  may24
//
//  Created by 박진영 on 6/5/24.
//

import Foundation
import Alamofire

class UserApi {
    
    private let baseUrl = ApiVariables.BaseURL + "/user"
    private init() {}
    public static let shared = UserApi()
    
    func getUserByEmail(email: String, completion: @escaping (Result<UserDto, Error>) -> Void) {
        let url = "\(baseUrl)/\(email)" // Path interpolation with email
        
        AF.request(url, interceptor: AuthRequestInterceptor())
            .validate(statusCode: 200..<300)
            .responseDecodable(of: UserDto.self) { response in
                if let error = response.error {
                    completion(.failure(error))
                    return
                }
                
                guard let value = response.value else {
                    completion(.failure(NSError(domain: "api.user.get.error", code: -1, userInfo: ["message": "Data is empty"])))
                    return
                }
                
                completion(.success(value))
            }
    }
    
    func getCurrentUser(completion: @escaping (Result<UserDto, Error>) -> Void) {
        let url = "\(baseUrl)/me" // Path interpolation with email
        
        AF.request(url, interceptor: AuthRequestInterceptor())
            .validate(statusCode: 200..<300)
            .responseDecodable(of: UserDto.self) { response in
                if let error = response.error {
                    completion(.failure(error))
                    return
                }
                
                guard let value = response.value else {
                    completion(.failure(NSError(domain: "api.user.get.error", code: -1, userInfo: ["message": "Data is empty"])))
                    return
                }
                
                completion(.success(value))
            }
    }
    func getUserCategoryScores(completion: @escaping (Result<[CategoryScoreDto], Error>) -> Void) {
      let url = "\(baseUrl)/score"

      AF.request(url)
          .validate(statusCode: 200..<300)
          .responseDecodable(of: BaseResponse<[CategoryScoreDto]>.self) { response in
              if let error = response.error {
                  completion(.failure(error))
                  return
              }

              guard let value = response.value?.data else {
                  completion(.failure(NSError(domain: "api.score.get.error", code: -1, userInfo: ["message": "Data is empty"])))
                  return
              }

              completion(.success(value))
          }
    }
}
