//
//  SearchApi.swift
//  may24
//
//  Created by 박진영 on 6/5/24.
//

import Foundation
import Alamofire

class SearchApi {
    
    private let baseUrl = ApiVariables.BaseURL + "/search"
    
    private init() {}
    public static let shared = SearchApi()
    
    func searchBooks(keyword: String, page: Int, size: Int, completion: @escaping (Result<BasePageableResponse<BookDto>, Error>) -> Void) {
        let url = "\(baseUrl)/books"
        let parameters = ["keyword": keyword, "page": page, "size": size] as [String : Any]
        
        AF.request(url, parameters: parameters, interceptor: AuthRequestInterceptor())
            .validate(statusCode: 200..<300)
            .responseDecodable(of: BaseResponse<BasePageableResponse<BookDto>>.self) { response in
                if let error = response.error {
                    completion(.failure(error))
                    return
                }
                
                guard let value = response.value?.data else {
                    completion(.failure(NSError(domain: "api.books.search.error", code: -1, userInfo: ["message": "Data is empty"])))
                    return
                }
                
                completion(.success(value))
            }
    }
    
    func searchPages(keyword: String, page: Int, size: Int, completion: @escaping (Result<BasePageableResponse<FullContextPageDto>, Error>) -> Void) {
        let url = "\(baseUrl)/page"
        let parameters = ["keyword": keyword, "page": page, "size": size] as [String : Any]
        
        AF.request(url, parameters: parameters)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: BaseResponse<BasePageableResponse<FullContextPageDto>>.self) { response in
                if let error = response.error {
                    completion(.failure(error))
                    return
                }
                
                guard let value = response.value?.data else {
                    completion(.failure(NSError(domain: "api.page.search.error", code: -1, userInfo: ["message": "Data is empty"])))
                    return
                }
                
                completion(.success(value))
            }
    }
    
    func getRecentPages(emotion: String, hashtag: String, page: Int, size: Int, completion: @escaping (Result<BasePageableResponse<FullContextPageDto>, Error>) -> Void) {
        let url = "\(baseUrl)/page/recent"
        var parameters = ["page": page, "size": size, "emotion": emotion, "hashtag": hashtag] as [String: Any]
        
        
        AF.request(url, parameters: parameters, interceptor: AuthRequestInterceptor())
            .validate(statusCode: 200..<300)
            .responseDecodable(of: BaseResponse<BasePageableResponse<FullContextPageDto>>.self) { response in
                if let error = response.error {
                    completion(.failure(error))
                    return
                }
                
                guard let value = response.value?.data else {
                    completion(.failure(NSError(domain: "api.page.recent.error", code: -1, userInfo: ["message": "Data is empty"])))
                    return
                }
                
                completion(.success(value))
            }
    }
    
    
    func getPagesByHashtag(hashtag: String, page: Int, size: Int, completion: @escaping (Result<BasePageableResponse<FullContextPageDto>, Error>) -> Void) {
        let url = "\(baseUrl)/pages/hashtag"
        let parameters = ["hashtag": hashtag, "page": page, "size": size] as [String : Any]
        
        AF.request(url, parameters: parameters, interceptor: AuthRequestInterceptor())
            .validate(statusCode: 200..<300)
            .responseDecodable(of: BaseResponse<BasePageableResponse<FullContextPageDto>>.self) { response in
                if let error = response.error {
                    completion(.failure(error))
                    return
                }
                
                guard let value = response.value?.data else {
                    completion(.failure(NSError(domain: "api.pages.hashtag.error", code: -1, userInfo: ["message": "Data is empty"])))
                    return
                }
                
                completion(.success(value))
            }
    }
    
    func searchUsers(keyword: String, page: Int, size: Int, completion: @escaping (Result<BasePageableResponse<UserDto>, Error>) -> Void) {
        let url = "\(baseUrl)/users"
        let parameters = ["keyword": keyword, "page": page, "size": size] as [String : Any]
        
        AF.request(url, parameters: parameters, interceptor: AuthRequestInterceptor())
            .validate(statusCode: 200..<300)
            .responseDecodable(of: BaseResponse<BasePageableResponse<UserDto>>.self) { response in
                if let error = response.error {
                    completion(.failure(error))
                    return
                }
                
                guard let value = response.value?.data else {
                    completion(.failure(NSError(domain: "api.users.search.error", code: -1, userInfo: ["message": "Data is empty"])))
                    return
                }
                
                completion(.success(value))
            }
    }
    
    func getTop10Users(completion: @escaping (Result<[RankedUserDto], Error>) -> Void) {
      let url = "\(baseUrl)/users/top10"

      AF.request(url, interceptor: AuthRequestInterceptor())
          .validate(statusCode: 200..<300)
          .responseDecodable(of: BaseResponse<[RankedUserDto]>.self) { response in
              if let error = response.error {
                  completion(.failure(error))
                  return
              }

              guard let value = response.value?.data else {
                  completion(.failure(NSError(domain: "api.users.top10.error", code: -1, userInfo: ["message": "Data is empty"])))
                  return
              }

              completion(.success(value))
          }
    }
}
