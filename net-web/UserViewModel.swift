//
//  UserViewModel.swift
//  net-web
//
//  Created by Sravanti on 20/12/25.
//

import Foundation
import Combine

class UserViewModel: ObservableObject {
    @Published  var users: [User] = []
    var service: UserResponse
    var cancellable = Set<AnyCancellable>()
    @Published var isLoading: Bool = false
    @Published var error = ""
    @Published var searchText = ""
    var filteredUsers: [User] {
        if searchText.isEmpty {
            return users
        } else {
            return users.filter{
                $0.username.localizedCaseInsensitiveContains(searchText) || $0.name.localizedCaseInsensitiveContains(searchText) || $0.email.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    init(service: UserResponse = Service()) {
        self.service = service
    }
    func fetchData() {
        isLoading = true
        
        service.fetchData(Contstants.url)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {completion in
                switch completion {
                case .finished:
                    print("Success")
                case .failure(let error):
                    self.error = error.localizedDescription
                }
            }, receiveValue: { [weak self]  user in
                self?.users = user
               
                self?.isLoading = false
                
            })
            .store(in: &cancellable)
    }
}
