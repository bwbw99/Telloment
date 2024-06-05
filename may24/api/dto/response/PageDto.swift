//
//  PageDto.swift
//  may24
//
//  Created by 박진영 on 6/5/24.
//

import Foundation

struct PageDto: Codable {
    let content: String
    let createdAt: Date
    let defaultVoiceUserMail: String
    let emotionIntensity: Int
    let emotionType: String
    let hashtags: [String]

    enum CodingKeys: String, CodingKey {
        case content = "content"
        case createdAt = "createdAt"
        case defaultVoiceUserMail = "defaultVoiceUserMail"
        case emotionIntensity = "emotionIntensity"
        case emotionType = "emotionType"
        case hashtags = "hashtags"
    }
}
