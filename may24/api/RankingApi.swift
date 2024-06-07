//
//  RankingApi.swift
//  may24
//
//  Created by 박진영 on 6/5/24.
//

import Foundation
import Alamofire


class RankingApi {
    private let baseUrl = ApiVariables.BaseURL + "/ranking"
    
    private init() {}
    public static let shared = RankingApi()
    
    func getTopLikedBooksInCategory(category: String, top: Int, completion: @escaping (Result<[BookDto], Error>) -> Void) {
        let url = "\(baseUrl)/book/category/topliked"
        var parameters = ["category": category, "top": top] as [String : Any]
        
        
        AF.request(url, parameters: parameters, interceptor: AuthRequestInterceptor())
            .validate(statusCode: 200..<300)
            .responseDecodable(of: BaseResponse<[BookDto]>.self) { response in
                if let error = response.error {
                    completion(.failure(error))
                    return
                }
                
                guard let value = response.value?.data else {
                    completion(.failure(NSError(domain: "api.book.category.topliked.error", code: -1, userInfo: ["message": "Data is empty"])))
                    return
                }
                
                completion(.success(value))
            }
    }
    
    func getTopViewedBooksInCategory(category: String, top: Int, completion: @escaping (Result<[BookDto], Error>) -> Void) {
        let url = "\(baseUrl)/book/category/topviewed"
        var parameters = ["category": category, "top": top] as [String : Any]
        
        
        AF.request(url, parameters: parameters, interceptor: AuthRequestInterceptor())
            .validate(statusCode: 200..<300)
            .responseDecodable(of: BaseResponse<[BookDto]>.self) { response in
                if let error = response.error {
                    completion(.failure(error))
                    return
                }
                
                guard let value = response.value?.data else {
                    completion(.failure(NSError(domain: "api.book.category.topliked.error", code: -1, userInfo: ["message": "Data is empty"])))
                    return
                }
                
                completion(.success(value))
            }
    }
    
    func getTopLikedPagesInEmotion(emotion: BackendEmotions, top: Int, completion: @escaping (Result<[FullContextPageDto], Error>) -> Void) {
        let url = "\(baseUrl)/page/emotion/topliked"
        var parameters = ["emotion": emotion.rawValue, "top": top] as [String : Any]
        
        
        AF.request(url, parameters: parameters, interceptor: AuthRequestInterceptor())
            .validate(statusCode: 200..<300)
            .responseDecodable(of: BaseResponse<[FullContextPageDto]>.self) { response in
                if let error = response.error {
                    completion(.failure(error))
                    return
                }
                
                guard let value = response.value?.data else {
                    completion(.failure(NSError(domain: "api.book.category.topliked.error", code: -1, userInfo: ["message": "Data is empty"])))
                    return
                }
                
                completion(.success(value))
            }
    }
    
    func getTopViewedPagesInEmotion(emotion: BackendEmotions, top: Int, completion: @escaping (Result<[PageDto], Error>) -> Void) {
        let url = "\(baseUrl)/page/emotion/topviewed"
        var parameters = ["emotion": emotion.rawValue, "top": top] as [String : Any]
        
        
        AF.request(url, parameters: parameters, interceptor: AuthRequestInterceptor())
            .validate(statusCode: 200..<300)
            .responseDecodable(of: BaseResponse<[PageDto]>.self) { response in
                if let error = response.error {
                    completion(.failure(error))
                    return
                }
                
                guard let value = response.value?.data else {
                    completion(.failure(NSError(domain: "api.book.category.topliked.error", code: -1, userInfo: ["message": "Data is empty"])))
                    return
                }
                
                completion(.success(value))
            }
    }
    
    func getTopLikedPagesInTag(tag: String, top: Int, completion: @escaping (Result<[FullContextPageDto], Error>) -> Void) {
        let url = "\(baseUrl)/page/tag/topliked"
        var parameters = ["tag": tag, "top": top] as [String : Any]
        
        
        AF.request(url, parameters: parameters, interceptor: AuthRequestInterceptor())
            .validate(statusCode: 200..<300)
            .responseDecodable(of: BaseResponse<[FullContextPageDto]>.self) { response in
                if let error = response.error {
                    completion(.failure(error))
                    return
                }
                
                guard let value = response.value?.data else {
                    completion(.failure(NSError(domain: "api.book.category.topliked.error", code: -1, userInfo: ["message": "Data is empty"])))
                    return
                }
                
                completion(.success(value))
            }
    }
    
    func getTopViewedPagesInEmotion(tag: String, top: Int, completion: @escaping (Result<[PageDto], Error>) -> Void) {
        let url = "\(baseUrl)/page/tag/topviewed"
        var parameters = ["tag": tag, "top": top] as [String : Any]
        
        
        AF.request(url, parameters: parameters, interceptor: AuthRequestInterceptor())
            .validate(statusCode: 200..<300)
            .responseDecodable(of: BaseResponse<[PageDto]>.self) { response in
                if let error = response.error {
                    completion(.failure(error))
                    return
                }
                
                guard let value = response.value?.data else {
                    completion(.failure(NSError(domain: "api.book.category.topliked.error", code: -1, userInfo: ["message": "Data is empty"])))
                    return
                }
                
                completion(.success(value))
            }
    }
}

