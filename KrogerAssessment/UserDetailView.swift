//
//  UserDetailView.swift
//  KrogerAssessment
//
//  Created by Chetan Dhowlaghar on 7/15/24.
//

import SwiftUI

import SwiftUI

struct UserDetailView: View {
    var user: User
    var name: String {
        "\(user.firstName) \(user.lastName)"
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Name: \(name)")
                .font(.largeTitle)
            Text("Phone: \(user.phoneNumber)")
            Text("Email: \(user.emailAddress)")
            Text("Gender: \(user.gender)")
            Spacer()
        }
        .padding()
        .navigationBarTitle(Text("\(name)"), displayMode: .inline)
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(user: User(firstName: "John", lastName: "Doe", phoneNumber: "123-456-7890", emailAddress: "john.doe@example.com", gender: "male"))
    }
}


