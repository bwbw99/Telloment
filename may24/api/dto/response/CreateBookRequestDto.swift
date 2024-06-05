//
//  CreateBookRequestDto.swift
//  may24
//
//  Created by 박진영 on 6/5/24.
//

import Foundation

struct CreateBookRequestDto: Encodable {
  let bookName: String
  let categoryCode: String
  let hashtags: [String]
}
