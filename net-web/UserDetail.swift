//
//  UserDetail.swift
//  net-web
//
//  Created by Sravanti on 21/12/25.
//

import SwiftUI

struct UserDetail: View {
     var user: User
     @State var id = 0
     @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            Image(user.image)
                .resizable()
                .scaledToFill()
                
            VStack {
                Text(user.name)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .opacity(isAnimating ? 1 : 0)
                    .offset(y: isAnimating ? 0 : -50)
                
                VStack(alignment: .leading ) {
                    Text("Personal Details :")
                        .font(.title)
                        .fontWeight(.regular)
                        .underline()
                        .padding(.top, 20)
                        
                    VStack(alignment: .leading) {
                        Text(user.username)
                            .modifier(TextModifier())
                        Text(user.email)
                            .modifier(TextModifier())
                        Text(user.phone)
                            .modifier(TextModifier())
                    }
                }
                .opacity(isAnimating ? 1 : 0)
                .offset(x: isAnimating ? 0 : -100)
            }
        }
        .onAppear {
            withAnimation(.spring(response: 0.9, dampingFraction: 0.8)) {
                isAnimating = true
            }
        }
    }
}

#Preview {
    UserDetail(user: User(id: 0, name: "", username: "", email: "", address: Address(street: "", suite: "", city: "", zipcode: "", geo: Geo(lat: "", lng: "")), phone: "", website: "", company: Company(name: "", catchPhrase: "", bs: "")))
        .preferredColorScheme(.dark)
}
