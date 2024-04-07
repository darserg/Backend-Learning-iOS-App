//
//  UserListViewModel.swift
//  Backend-Learning-iOS
//
//  Created by Сергей Дарьин on 27.03.2024.
//

import SwiftUI

class UserListViewModel: ObservableObject {
    @Published var users = [User]()
    
    func fetchUsers() async throws {
        let urlString = Constants.baseURL + Endpoints.users
        
        guard let url = URL(string: urlString) else {
            throw HttpError.badURL
        }
        
        let userResponse: [User] = try await HttpClient.shared.fetch(url: url)
        
        DispatchQueue.main.async {
            self.users = userResponse
        }
    }
}
