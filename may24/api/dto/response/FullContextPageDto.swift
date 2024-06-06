//
//  FullContextPageDto.swift
//  may24
//
//  Created by 박진영 on 6/5/24.
//

import Foundation

struct FullContextPageDto: Codable {
    let content: String
    let createdAt: String
    let defaultVoiceUserMail: String?
    let emotionIntensity: Int
    let emotionType: String
    let hashtags: [String]
    let likeCount: Int
    let nextId: Int
    let pageId: Int
    let prevId: Int
    let rootId: Int
    let title: String
    let userId: Int
    
    enum CodingKeys: String, CodingKey {
        case content = "content"
        case createdAt = "createdAt"
        case defaultVoiceUserMail = "defaultVoiceUserMail"
        case emotionIntensity = "emotionIntensity"
        case emotionType = "emotionType"
        case hashtags = "hashtags"
        case likeCount = "likeCount"
        case nextId = "nextId"
        case pageId = "pageId"
        case prevId = "prevId"
        case rootId = "rootId"
        case title = "title"
        case userId = "userId"
    }
}
