//
//  Model.swift
//  RiceList
//
//  Created by MA-15 on 28/07/23.
//

import Foundation

struct PostModel: Codable {
    let page, perPage, total, totalPages: Int
    let userdata: [Usrelist]
    let support: Support

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case userdata = "data"
        case support
    }
}

struct Usrelist: Codable {
    let id: Int
    let email, firstName, lastName: String
    let avatar: String

    enum CodingKeys: String, CodingKey {
        case id, email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}

// MARK: - Support
struct Support: Codable {
    let url: String
    let text: String
}


struct LoginResponse: Codable {
    let token: String?
    let error: String?
}
