//
//  CategoryScoreDto.swift
//  may24
//
//  Created by 박진영 on 6/5/24.
//

import Foundation

struct CategoryScoreDto : Codable {
    let code: String
    let score : Int
    
    enum CodingKeys : String, CodingKey {
        case code = "key"
        case score = "value"
    }
}
