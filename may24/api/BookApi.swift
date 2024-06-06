//
//  BookApi.swift
//  may24
//
//  Created by 박진영 on 6/5/24.
//

import Foundation
import Alamofire

class BookApi {
    
    private let baseUrl = ApiVariables.BaseURL + "/book"
    
    public static let shared = BookApi()
    private init() {}
    
    
    func getBook(bookId: Int, completion: @escaping (Result<BookDto, Error>) -> Void) {
        let url = "\(baseUrl)/\(bookId)"

        AF.request(url,
        interceptor: AuthRequestInterceptor())
            .validate(statusCode: 200..<300)
            .responseDecodable(of: BaseResponse<BookDto>.self) { response in
                if let error = response.error {
                    completion(.failure(error))
                    return
                }

                guard let value = response.value?.data else {
                    completion(.failure(NSError(domain: "api.book.get.error", code: -1, userInfo: ["message": "Data is empty"])))
                    return
                }

                completion(.success(value))
            }
    }
    
    
    
    func addPageToBook(bookId: Int, pageId: Int, authToken: String, completion: @escaping (Result<Int, Error>) -> Void) {
        let url = "\(baseUrl)/addPage"
        let requestBody = AddPageToRequest(bookId: bookId, pageId: pageId)

        AF.request(url, method: .put, parameters: requestBody, encoder: JSONParameterEncoder.default, interceptor: AuthRequestInterceptor())
            .validate(statusCode: 200..<300)
            .responseDecodable(of: BaseResponse<Int>.self) { response in
                if let error = response.error {
                    completion(.failure(error))
                    return
                }

                guard let value = response.value?.data else {
                    completion(.failure(NSError(domain: "api.book.addPage.error", code: -1, userInfo: ["message": "Data is empty"])))
                    return
                }

                completion(.success(value))
            }
    }
    
    func getAllBooks(page: Int, size: Int, authToken: String, completion: @escaping (Result<BasePageableResponse<BookDto>, Error>) -> Void) {
        let url = "\(baseUrl)/allbooks"
        let parameters = ["page": page, "size": size]

        AF.request(url, parameters: parameters, interceptor: AuthRequestInterceptor())
            .validate(statusCode: 200..<300)
            .responseDecodable(of: BasePageableResponse<BookDto>.self) { response in
                if let error = response.error {
                    completion(.failure(error))
                    return
                }

                guard let value = response.value else {
                    completion(.failure(NSError(domain: "api.book.allbooks.error", code: -1, userInfo: ["message": "Data is empty"])))
                    return
                }

                completion(.success(value))
            }
    }
    
    func getAllBooksByCategory(category: String, page: Int, size: Int, authToken: String, completion: @escaping (Result<BasePageableResponse<BookDto>, Error>) -> Void) {
        let url = "\(baseUrl)/allbooks/category"
        let parameters = ["category": category, "page": page, "size": size] as [String : Any]

        AF.request(url, parameters: parameters, interceptor: AuthRequestInterceptor())
            .validate(statusCode: 200..<300)
            .responseDecodable(of: BasePageableResponse<BookDto>.self) { response in
                if let error = response.error {
                    completion(.failure(error))
                    return
                }

                guard let value = response.value else {
                    completion(.failure(NSError(domain: "api.book.allbooks.category.error", code: -1, userInfo: ["message": "Data is empty"])))
                    return
                }

                completion(.success(value))
            }
    }
    
    func getAllBookCategories(authToken: String, completion: @escaping (Result<[BookCategoryDto], Error>) -> Void) {
      let url = "\(baseUrl)/categories"

      AF.request(url, interceptor: AuthRequestInterceptor())
          .validate(statusCode: 200..<300)
          .responseDecodable(of: BaseResponse<[BookCategoryDto]>.self) { response in
              if let error = response.error {
                  completion(.failure(error))
                  return
              }

              guard let value = response.value?.data else {
                  completion(.failure(NSError(domain: "api.book.categories.error", code: -1, userInfo: ["message": "Data is empty"])))
                  return
              }

              completion(.success(value))
          }
    }
    
    func createBook(bookName: String, categoryCode: String, hashtags: [String], authToken: String, completion: @escaping (Result<Int, Error>) -> Void) {
      let url = "\(baseUrl)/create"
      let requestBody = CreateBookRequestDto(bookName: bookName, categoryCode: categoryCode, hashtags: hashtags)

      AF.request(url, 
                 method: .post,
                 parameters: requestBody,
                 encoder: JSONParameterEncoder.default,
                 interceptor: AuthRequestInterceptor())
          .validate(statusCode: 200..<300)
          .responseDecodable(of: BaseResponse<Int>.self) { response in
              if let error = response.error {
                  completion(.failure(error))
                  return
              }

              guard let value = response.value?.data else {
                  completion(.failure(NSError(domain: "api.book.create.error", code: -1, userInfo: ["message": "Data is empty"])))
                  return
              }

              completion(.success(value))
          }
    }
    
    
    func likeBook(bookId: Int, authToken: String, completion: @escaping (Result<BookDto, Error>) -> Void) {
      let url = "\(baseUrl)/like/\(bookId)"

      AF.request(url, method: .post, interceptor: AuthRequestInterceptor())
          .validate(statusCode: 200..<300)
          .responseDecodable(of: BaseResponse<BookDto>.self) { response in
              if let error = response.error {
                  completion(.failure(error))
                  return
              }

              guard let value = response.value?.data else {
                  completion(.failure(NSError(domain: "api.book.like.error", code: -1, userInfo: ["message": "Data is empty"])))
                  return
              }

              completion(.success(value))
          }
    }
    
    func getAllBookOfCurrentUser(authToken: String, completion: @escaping (Result<[BookDto], Error>) -> Void) {
      let url = "\(baseUrl)/list"

      AF.request(url, interceptor: AuthRequestInterceptor())
          .validate(statusCode: 200..<300)
          .responseDecodable(of: BaseResponse<[BookDto]>.self) { response in
              if let error = response.error {
                  completion(.failure(error))
                  return
              }

              guard let value = response.value?.data else {
                  completion(.failure(NSError(domain: "api.book.list.error", code: -1, userInfo: ["message": "Data is empty"])))
                  return
              }

              completion(.success(value))
          }
    }
    
    func getAllBookOfOtherUser(email: String, completion: @escaping (Result<[BookDto], Error>) -> Void) {
      let url = "\(baseUrl)/user/" + email

      AF.request(url, interceptor: AuthRequestInterceptor())
          .validate(statusCode: 200..<300)
          .responseDecodable(of: BaseResponse<[BookDto]>.self) { response in
              if let error = response.error {
                  completion(.failure(error))
                  return
              }

              guard let value = response.value?.data else {
                  completion(.failure(NSError(domain: "api.book.user.error", code: -1, userInfo: ["message": "Data is empty"])))
                  return
              }

              completion(.success(value))
          }
    }
    
    
}
