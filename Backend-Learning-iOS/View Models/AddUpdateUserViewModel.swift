//
//  AddUpdateUserViewModel.swift
//  Backend-Learning-iOS
//
//  Created by Сергей Дарьин on 07.04.2024.
//

import SwiftUI

final class AddUpdateUserViewModel: ObservableObject {
    @Published var userName = ""
    
    var userID: UUID?
    
    var isUpdating: Bool {
        userID != nil
    }
    
    var buttonTitle: String {
        userID != nil ? "Update user" : "Add user"
    }
    
    init() {}
    
    init(currentUser: User) {
        self.userName = currentUser.name
        self.userID = currentUser.id
    }
    
    func addUser() async throws {
        let urlString = Constants.baseURL + Endpoints.users
        
        guard let url = URL(string: urlString) else {
            throw HttpError.badURL
        }
        
        let user = User(id: nil, name: userName)
        
        try await HttpClient.shared.sendData(to: url, 
                                             object: user,
                                             httpMethod: HttpMethods.POST.rawValue)
    }
    
    func addUpdateAction(completion: @escaping () -> Void) {
        Task {
            do {
                if isUpdating {
                    // updateUser()
                }
                else {
                    try await addUser()
                }
            } catch {
                print("Error: \(error)")
            }
            completion()
        }
    }
}
