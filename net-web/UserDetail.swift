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
            withAnimation(.snappy) {
                isAnimating = true
            }
        }
        .overlay{
            LinearGradient(stops: [
                Gradient.Stop(color: .black.opacity(0.1), location: 0.5),
                Gradient.Stop(color: .yellow.opacity(0.6), location: 1)
            ], startPoint: .top, endPoint: .bottom)
        }
    }
}

#Preview {
    UserDetail(user: User(id: 0, name: "", username: "", email: "", address: Address(street: "", suite: "", city: "", zipcode: "", geo: Geo(lat: "", lng: "")), phone: "", website: "", company: Company(name: "", catchPhrase: "", bs: "")))
        .preferredColorScheme(.dark)
}
