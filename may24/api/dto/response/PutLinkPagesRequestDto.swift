//
//  PutLinkPagesRequestDto.swift
//  may24
//
//  Created by 박진영 on 6/5/24.
//

import Foundation

struct PutLinkPagesRequest: Encodable {
    let nextPageId: Int
    let prevPageId: Int
}
