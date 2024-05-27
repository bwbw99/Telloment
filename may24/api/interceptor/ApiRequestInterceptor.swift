//
//  ApiRequestInterceptor.swift
//  may24
//
//  Created by 박진영 on 5/26/24.
//
import Alamofire

private let retryLimit = 2

extension RequestInterceptor {
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var urlRequest = urlRequest
        let token = Authentication.token
        if urlRequest.headers.dictionary["Authorization"] == nil {
            urlRequest.setValue(token, forHTTPHeaderField: "Authorization")
        }
        completion(.success(urlRequest))
    }
    

    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        guard let response = request.task?.response as? HTTPURLResponse, response.statusCode == 401 else {
            return completion(.doNotRetryWithError(error))
        }
        guard request.retryCount < retryLimit else { return completion(.doNotRetryWithError(error)) }
        Task {      
            do {
                var data = try await AuthenticationApi.shared.refreshToken()
                Authentication.token = data.accessToken!
                Authentication.refreshToken = data.refreshToken!
                return completion(.retry)
            } catch {
                return completion(.doNotRetryWithError(error))
            }
            
        }
    }
}
