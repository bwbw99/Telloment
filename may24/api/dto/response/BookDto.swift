//
//  BookDto.swift
//  may24
//
//  Created by 박진영 on 6/5/24.
//

import Foundation

struct BookDto: Codable {
    let bookId: Int
    let bookName: String
    let categoryCode: String
    let hashtags: [String]
    let pageIds: [Int]
    let totalLikeCount: Int
    let totalPageCount: Int
    let totalViewCount: Int
    let userId: Int
    let userNickname: String
    
}
