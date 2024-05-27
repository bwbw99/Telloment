//
//  BaseResponse.swift
//  may24
//
//  Created by 박진영 on 5/27/24.
//

struct BaseResponse<T: Codable>: Codable {
    let message: String?
    let header: BaseResponseHeader?
    let data: T?
    
    enum CodingKeys: String, CodingKey {
        case message = "msg"
        case header
        case data
    }
}

struct BaseResponseHeader: Codable {
    let code: Int
    let message: String
    
    enum CodingKeys: CodingKey {
        case code
        case message
    }
}
