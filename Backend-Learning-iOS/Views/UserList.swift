//
//  ContentView.swift
//  Backend-Learning-iOS
//
//  Created by Сергей Дарьин on 26.03.2024.
//

import SwiftUI

struct UserList: View {
    
    @StateObject var viewModel = UserListViewModel()
    
    @State var modal: ModalType? = nil
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(viewModel.users) { user in
                    Button {
                        print("selected")
                    } label: {
                        Text(user.name)
                            .font(.title3)
                            .foregroundColor(Color(.label))
                    }
                }
            }
            .navigationTitle(Text("Users"))
            .toolbar{
                Button {
                    modal = .add
                } label: {
                    Label("Add User", systemImage: "plus.circle")
                }
            }
        }
        .sheet(item: $modal, onDismiss: {
            Task {
                do {
                    try await viewModel.fetchUsers()
                } catch {
                    print("Error \(error)")
                }
            }
        }) { modal in
            switch modal {
            case .add:
                AddUpdateUser(viewModel: AddUpdateUserViewModel())
            case .update(let user):
                AddUpdateUser(viewModel: AddUpdateUserViewModel(currentUser: user))
            }
            
        }
        .onAppear {
            Task {
                do {
                    try await viewModel.fetchUsers()
                } catch {
                    print("Error: \(error)")
                }
            }
        }
    }
}

#Preview {
    UserList()
}
