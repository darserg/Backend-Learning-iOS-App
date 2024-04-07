//
//  AddUpdateUser.swift
//  Backend-Learning-iOS
//
//  Created by Сергей Дарьин on 07.04.2024.
//

import SwiftUI

struct AddUpdateUser: View {
    
    @ObservedObject var viewModel: AddUpdateUserViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            TextField("username", text: $viewModel.userName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button{
                viewModel.addUpdateAction {
                    presentationMode.wrappedValue.dismiss()
                }
            } label: {
                Text(viewModel.buttonTitle)
            }
        }
    }
}

#Preview {
    AddUpdateUser(viewModel: AddUpdateUserViewModel())
}
