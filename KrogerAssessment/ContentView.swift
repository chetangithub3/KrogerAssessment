//
//  ContentView.swift
//  KrogerAssessment
//
//  Created by Chetan Dhowlaghar on 7/15/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: UserViewModel

    var body: some View {
        NavigationView {
            VStack {
                switch viewModel.loadingState {
                    case .none:
                     Text("Empty")
                    case .loading:
                        ProgressView { 
                            Text("Loading users")
                        }
                    case .success:
                        UserListView()
                    case .failure(let error):
                        Text("\(error.localizedDescription)")
                }
            }
            .navigationBarTitle("Users")
        }
    }
}

struct UserListView: View {
    @EnvironmentObject var viewModel: UserViewModel

    var body: some View {
        List($viewModel.users, id: \.phoneNumber) { user in
            let user = user.wrappedValue
            NavigationLink(destination: UserDetailView(user: user)) {
                userLabel(user: user)
                .padding(.vertical, 4)
            }
        }
    }

    func userLabel(user: User) -> some View {
        VStack(alignment: .leading) {
            Text("\(user.firstName) \(user.lastName)")
                .font(.headline)
            Text("Phone: \(user.phoneNumber)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#Preview {
    ContentView()
}

