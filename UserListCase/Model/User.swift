//
//  User.swift
//  UserListCase
//
//  Created by Bayram Yeleç on 4.03.2025.
//

import Foundation

struct User: Decodable {
    let id: Int
    let name, username, email, phone, website: String
    let address: Address
    let company: Company
}

struct Address: Decodable {
    let street, suite, city, zipcode: String
}

struct Company: Decodable {
    let name, catchPhrase, bs: String
}
