//
//  UpdatePageRequestDto.swift
//  may24
//
//  Created by 박진영 on 6/5/24.
//

import Foundation

struct UpdatePageRequest: Encodable {
    let content: String
    let pageId: Int
    let title: String
}


