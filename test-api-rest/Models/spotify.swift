//
//  spotify.swift
//  test-api-rest
//
//  Created by Linder Anderson Hassinger Solano    on 30/11/23.
//

import Foundation

struct Spotify: Codable {
    let href: String
    let items: [Items]
}

struct Items: Codable {
    let collaborative: Bool
    let description: String?
    let href: String
    let images: [Images]
    let name: String
    let owner: Owner
}

struct Images: Codable {
    let height: Int?
    let url: String?
    let width: Int?
}

struct Owner: Codable {
    let display_name: String
}
