//
//  User.swift
//  Backend-Learning-iOS
//
//  Created by Сергей Дарьин on 27.03.2024.
//

import Foundation

struct User: Identifiable, Codable {
    let id: UUID?
    var name: String
}
