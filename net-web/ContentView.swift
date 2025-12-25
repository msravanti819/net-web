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
    //@State private var searchText = ""
    
    let arr = [1,2,3,4,5]
    var body: some View {
        NavigationStack {
                    List(viewModel.filteredUsers) { user in
                        NavigationLink {
                            UserDetail(user: user)
                        } label: {
                            UserCell(user: user)
                        }

            }
                    .animation(.default, value: viewModel.searchText)
            .navigationTitle("Users")
            .overlay {
                if viewModel.isLoading {
                    ProgressView()
                }
            }
            .font(.largeTitle)
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $viewModel.searchText)
            .task {
                    viewModel.fetchData()
                }
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
