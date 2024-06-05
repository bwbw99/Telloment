//
//  SavePageRequestDto.swift
//  may24
//
//  Created by 박진영 on 6/5/24.
//

import Foundation

struct SavePageRequest: Encodable {
    let bookId: Int
    let content: String
    let emotionIntensity: Int
    let emotionType: String
    let hashtags: [String]
    let title: String
}
