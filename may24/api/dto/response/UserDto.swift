//
//  UserDto.swift
//  may24
//
//  Created by 박진영 on 6/5/24.
//

import Foundation

struct UserDto: Codable {
    let name: String
    let nickname: String
    let email: String
    let id: Int
    let bookCount: Int
    let pageCount: Int
    let totalLikeCount: Int
}
