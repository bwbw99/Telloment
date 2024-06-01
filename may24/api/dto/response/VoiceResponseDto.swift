//
//  VoiceResponseDto.swift
//  may24
//
//  Created by 박진영 on 6/1/24.
//

public struct VoiceResponseDto : Codable {
    let id: Int
    let status: String
    let userEmail: String // Use camelCase for property names
    let userId: Int
    let userNickname: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case status
        case userId = "user_id"
        case userEmail="user_email"
        case userNickname="user_nickname"
    }
}
