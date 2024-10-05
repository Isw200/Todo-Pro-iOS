//
//  User.swift
//  Todo-Pro
//
//  Created by Isuru Ariyarathna on 2024-10-05.
//

import Foundation

struct User : Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
