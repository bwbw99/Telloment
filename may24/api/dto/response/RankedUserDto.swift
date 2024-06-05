//
//  RankedUserDto.swift
//  may24
//
//  Created by 박진영 on 6/5/24.
//

import Foundation

struct RankedUserDto: Codable {
    let name: String
    let nickName: String
    let userEmail: String
    let userId: Int
    let totalLikes :Int
}
