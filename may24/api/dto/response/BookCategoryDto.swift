//
//  BookCategoryDto.swift
//  may24
//
//  Created by 박진영 on 6/5/24.
//

import Foundation

struct BookCategoryDto : Codable {
    let bookCount: Int
    let code : String
    let name : String
    
    enum CodingKeys: String, CodingKey {
        case bookCount
        case code
        case name
    }
}
