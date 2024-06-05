//
//  PageApi.swift
//  may24
//
//  Created by 박진영 on 6/5/24.
//

import Alamofire

class PageApi {
    let baseUrl = ApiVariables.BaseURL + "/page"
    public static let shared = PageApi()
    private init() { }
    
    func getPageById(pageId: Int, completion: @escaping (Result<PageDto, Error>) -> Void) {
        let url = "\(baseUrl)/page/\(pageId)"

        AF.request(url,
                   method: .get,
                   interceptor: AuthRequestInterceptor()
        )
            .validate(statusCode: 200..<300)
            .responseDecodable(of: BaseResponse<PageDto>.self) { response in
                if let error = response.error {
                    completion(.failure(error))
                    return
                }

                guard let dt = response.value?.data else {
                    completion(.failure(NSError(domain: "api.page.error", code: -1, userInfo: ["message": "Data is empty"])))
                    return
                }

                completion(.success(dt))
            }
    }
    
    func getDefaultVoiceByPage(pageId: Int, completion: @escaping (Result<String, Error>) -> Void) {
        let url = "\(baseUrl)/api/page/\(pageId)/default_voice"

        AF.request(url,
                   method: .get,
        interceptor: AuthRequestInterceptor())
            .validate(statusCode: 200..<300)
            .responseDecodable(of: BaseResponse<String>.self) { response in
                if let error = response.error {
                    completion(.failure(error))
                    return
                }

                guard let value = response.value?.data else {
                    completion(.failure(NSError(domain: "api.page.default_voice.error", code: -1, userInfo: ["message": "Data is empty"])))
                    return
                }

                completion(.success(value))
            }
    }
    
    func updateDefaultVoiceByPage(pageId: Int, email: String, completion: @escaping (Result<BaseResponse<String>, Error>) -> Void) {
        let url = "\(baseUrl)/api/page/\(pageId)/default_voice"
        let parameters: [String: Any] = ["email": email]

        AF.request(url, method: .patch, parameters: parameters, interceptor: AuthRequestInterceptor())
            .validate(statusCode: 200..<300)
            .responseDecodable(of: BaseResponse<String>.self) { response in
                if let error = response.error {
                    completion(.failure(error))
                    return
                }

                guard let value = response.value else {
                    completion(.failure(NSError(domain: "api.page.default_voice.error", code: -1, userInfo: ["message": "Data is empty"])))
                    return
                }

                completion(.success(value))
            }
    }
    
    func getAllPageablePages(page: Int, size: Int, completion: @escaping (Result<BasePageableResponse<FullContextPageDto>, Error>) -> Void) {
        let url = "\(baseUrl)/api/page/allpages"
        let parameters: [String: Any] = ["page": page, "size": size]

        AF.request(url, parameters: parameters, interceptor: AuthRequestInterceptor())
            .validate(statusCode: 200..<300)
            .responseDecodable(of: BasePageableResponse<FullContextPageDto>.self) { response in
                if let error = response.error {
                    completion(.failure(error))
                    return
                }

                guard let value = response.value else {
                    completion(.failure(NSError(domain: "api.page.allpages.error", code: -1, userInfo: ["message": "Data is empty"])))
                    return
                }

                completion(.success(value))
            }
    }
    
    
    func getAllPageablePagesByEmotion(page: Int, size: Int, emotion: BackendEmotions, completion: @escaping (Result<BasePageableResponse<FullContextPageDto>, Error>) -> Void) {
        let url = "\(baseUrl)/api/page/allpages/emotion"
        let parameters: [String: Any] = ["page": page, "size": size, "emotion": emotion.rawValue]

        AF.request(url, method: .get, parameters: parameters, interceptor: AuthRequestInterceptor())
            .validate(statusCode: 200..<300)
            .responseDecodable(of: BasePageableResponse<FullContextPageDto>.self) { response in
                if let error = response.error {
                    completion(.failure(error))
                    return
                }

                guard let value = response.value else {
                    completion(.failure(NSError(domain: "api.page.allpages.emotion.error", code: -1, userInfo: ["message": "Data is empty"])))
                    return
                }

                completion(.success(value))
            }
    }
    
    func deletePageById(pageId: Int, completion: @escaping (Result<BaseResponse<String>, Error>) -> Void) {
        let url = "\(baseUrl)/api/page/delete/\(pageId)"

        AF.request(url, method: .delete, interceptor: AuthRequestInterceptor())
            .validate(statusCode: 200..<300)
            .responseDecodable(of: BaseResponse<String>.self) { response in
                if let error = response.error {
                    completion(.failure(error))
                    return
                }

                guard let value = response.value else {
                    completion(.failure(NSError(domain: "api.page.delete.error", code: -1, userInfo: ["message": "Data is empty"])))
                    return
                }

                completion(.success(value))
            }
    }

    func dislikePageById(pageId: Int, completion: @escaping (Result<BaseResponse<String>, Error>) -> Void) {
        let url = "\(baseUrl)/api/page/dislike"
        let requestBody = DeletePageLikeRequest(pageId: pageId)

        AF.request(url, method: .delete, parameters: requestBody, encoder: JSONParameterEncoder.default, interceptor: AuthRequestInterceptor())
            .validate(statusCode: 200..<300)
            .responseDecodable(of: BaseResponse<String>.self) { response in
                if let error = response.error {
                    completion(.failure(error))
                    return
                }

                guard let value = response.value else {
                    completion(.failure(NSError(domain: "api.page.dislike.error", code: -1, userInfo: ["message": "Data is empty"])))
                    return
                }

                completion(.success(value))
            }
    }

    func likePage(pageId: Int, completion: @escaping (Result<BaseResponse<FullContextPageDto>, Error>) -> Void) {
        let url = "\(baseUrl)/api/page/like"
        let requestBody = LikePageRequest(pageId: pageId)

        AF.request(url, method: .post, parameters: requestBody, encoder: JSONParameterEncoder.default, interceptor: AuthRequestInterceptor())
            .validate(statusCode: 200..<300)
            .responseDecodable(of: BaseResponse<FullContextPageDto>.self) { response in
                if let error = response.error {
                    completion(.failure(error))
                    return
                }

                guard let value = response.value else {
                    completion(.failure(NSError(domain: "api.page.like.error", code: -1, userInfo: ["message": "Data is empty"])))
                    return
                }

                completion(.success(value))
            }
    }
    
    func linkPages(nextPageId: Int, prevPageId: Int, completion: @escaping (Result<BaseResponse<FullContextPageDto>, Error>) -> Void) {
        let url = "\(baseUrl)/api/page/link"
        let requestBody = PutLinkPagesRequest(nextPageId: nextPageId, prevPageId: prevPageId)

        AF.request(url, method: .put, parameters: requestBody, encoder: JSONParameterEncoder.default, interceptor: AuthRequestInterceptor())
            .validate(statusCode: 200..<300)
            .responseDecodable(of: BaseResponse<FullContextPageDto>.self) { response in
                if let error = response.error {
                    completion(.failure(error))
                    return
                }

                guard let value = response.value else {
                    completion(.failure(NSError(domain: "api.page.link.error", code: -1, userInfo: ["message": "Data is empty"])))
                    return
                }

                completion(.success(value))
            }
    }
    
    func getPageListOfCurrentUser(completion: @escaping (Result<BaseResponse<[FullContextPageDto]>, Error>) -> Void) {
        let url = "\(baseUrl)/api/page/list"

        AF.request(url,
                   interceptor: AuthRequestInterceptor()
        )
            .validate(statusCode: 200..<300)
            .responseDecodable(of: BaseResponse<[FullContextPageDto]>.self) { response in
                if let error = response.error {
                    completion(.failure(error))
                    return
                }

                guard let value = response.value else {
                    completion(.failure(NSError(domain: "api.page.list.error", code: -1, userInfo: ["message": "Data is empty"])))
                    return
                }

                completion(.success(value))
            }
    }
    
    func savePage(bookId: Int, content: String, emotionIntensity: Int, emotionType: String, hashtags: [String], title: String, completion: @escaping (Result<BaseResponse<FullContextPageDto>, Error>) -> Void) {
        let url = "\(baseUrl)/api/page/save"
        let requestBody = SavePageRequest(bookId: bookId, content: content, emotionIntensity: emotionIntensity, emotionType: emotionType, hashtags: hashtags, title: title)

        AF.request(url, method: .post, parameters: requestBody, encoder: JSONParameterEncoder.default, interceptor: AuthRequestInterceptor())
            .validate(statusCode: 200..<300)
            .responseDecodable(of: BaseResponse<FullContextPageDto>.self) { response in
                if let error = response.error {
                    completion(.failure(error))
                    return
                }

                guard let value = response.value else {
                    completion(.failure(NSError(domain: "api.page.save.error", code: -1, userInfo: ["message": "Data is empty"])))
                    return
                }

                completion(.success(value))
            }
    }
    
    func updatePage(pageId: Int, content: String, title: String, completion: @escaping (Result<BaseResponse<FullContextPageDto>, Error>) -> Void) {
        let url = "\(baseUrl)/api/page/update"
        let requestBody = UpdatePageRequest(content: content, pageId: pageId, title: title)

        AF.request(url, method: .put, parameters: requestBody, encoder: JSONParameterEncoder.default, interceptor: AuthRequestInterceptor())
            .validate(statusCode: 200..<300)
            .responseDecodable(of: BaseResponse<FullContextPageDto>.self) { response in
                if let error = response.error {
                    completion(.failure(error))
                    return
                }

                guard let value = response.value else {
                    completion(.failure(NSError(domain: "api.page.update.error", code: -1, userInfo: ["message": "Data is empty"])))
                    return
                }

                completion(.success(value))
            }
    }
}
