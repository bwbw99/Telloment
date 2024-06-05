//
//  BasePageableResponse.swift
//  may24
//
//  Created by 박진영 on 6/5/24.
//
struct BasePageableResponse<T: Codable>: Codable {
    let content: [T]
    let empty: Bool
    let first: Bool
    let last: Bool
    let number: Int
    let numberOfElements: Int
    let pageable: PageableInfo
    let size: Int
    let sort: SortInfo
    let totalElements: Int
    let totalPages: Int
    
    enum CodingKeys: String, CodingKey {
        case content = "content"
        case empty = "empty"
        case first = "first"
        case last = "last"
        case number = "number"
        case numberOfElements = "numberOfElements"
        case pageable = "pageable"
        case size = "size"
        case sort = "sort"
        case totalElements = "totalElements"
        case totalPages = "totalPages"
    }
}

struct PageableInfo: Codable {
    let offset: Int
    let pageNumber: Int
    let pageSize: Int
    let paged: Bool
    let sort: SortInfo
    let unpaged: Bool
    
    enum CodingKeys: String, CodingKey {
        case offset = "offset"
        case pageNumber = "pageNumber"
        case pageSize = "pageSize"
        case paged = "paged"
        case sort = "sort"
        case unpaged = "unpaged"
    }
}

struct SortInfo: Codable {
    let empty: Bool
    let sorted: Bool
    let unsorted: Bool
    
    enum CodingKeys: String, CodingKey {
        case empty = "empty"
        case sorted = "sorted"
        case unsorted = "unsorted"
    }
}
