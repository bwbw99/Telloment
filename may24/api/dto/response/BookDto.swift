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
  let totalLikeCount: Int
  let totalViewCount: Int
}
