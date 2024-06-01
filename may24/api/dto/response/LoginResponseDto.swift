//
//  LoginResponseDto.swift
//  may24
//
//  Created by 박진영 on 5/26/24.
//

struct LoginResponseDto: Codable {
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
