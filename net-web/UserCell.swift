//
//  UserCell.swift
//  net-web
//
//  Created by Sravanti on 23/12/25.
//

import SwiftUI

struct UserCell: View {
    var user: User
    var body: some View {
        HStack() {
            Text(user.name)
                .font(.footnote)
                .fontWeight(.semibold)
                .padding()
                .clipShape(.capsule)
            VStack {
                Text(user.email)
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .padding()
                Text(user.username)
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .padding()
            }
            Divider()
        }
        .background(Color(.systemGray6))
    }
}

#Preview {
    UserCell(user: User(id: 0, name: "", username: "", email: "", address: Address(street: "", suite: "", city: "", zipcode: "", geo: Geo(lat: "", lng: "")), phone: "", website: "", company: Company(name: "", catchPhrase: "", bs: "")))
}
