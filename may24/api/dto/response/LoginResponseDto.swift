//
//  LoginResponseDto.swift
//  may24
//
//  Created by 박진영 on 5/26/24.
//

struct LoginResponseDto: Codable {
    var data : LoginResponseDataDto?
    var header : LoginResponseHeaderDto?
    var message: String?
    
    enum CodingKeys: String, CodingKey {
        case data
        case header
        case message = "msg"
    }
}

struct LoginResponseDataDto: Codable {
    var accessToken: String?
    var accessTokenExpiresIn : Int
        var grantType: String?
    var refreshToken : String?
    
    enum CodingKeys: String, CodingKey {
        case accessToken
        case accessTokenExpiresIn
        case grantType
        case refreshToken
    }
}

struct LoginResponseHeaderDto: Codable {
    var code: Int
    var message: String?
    
    enum CodingKeys: String, CodingKey {
        case code
        case message
    }
}
