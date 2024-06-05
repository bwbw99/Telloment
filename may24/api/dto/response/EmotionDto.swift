//
//  EmotionDto.swift
//  may24
//
//  Created by 박진영 on 6/5/24.
//

import Foundation

struct EmotionDto : Codable {
    let emotion: String
    let strength: Int
    
    enum CodingKeys: String, CodingKey {
        case emotion
        case strength = "value"
    }
}
