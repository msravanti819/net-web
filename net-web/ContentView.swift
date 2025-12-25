//
//  ContentView.swift
//  net-web
//
//  Created by Sravanti on 19/12/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = UserViewModel()
    @State private var isNavigate = false
    
    let arr = [1,2,3,4,5]
    var body: some View {
        NavigationStack {
                    List(viewModel.users) { user in
                        NavigationLink {
                            UserDetail(user: user)
                        } label: {
                            UserCell(user: user)
                        }
            }
            .navigationTitle("Users")
            .font(.largeTitle)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "minus")
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
