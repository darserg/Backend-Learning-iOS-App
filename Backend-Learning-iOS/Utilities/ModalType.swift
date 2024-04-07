//
//  ModalType.swift
//  Backend-Learning-iOS
//
//  Created by Сергей Дарьин on 07.04.2024.
//

import Foundation

enum ModalType: Identifiable {
    var id: String {
        switch self {
        case .add: return "add"
        case .update: return "update"
        }
    }
    
    case add
    case update(User)
}
