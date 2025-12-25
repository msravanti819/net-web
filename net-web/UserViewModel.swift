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
    
    init(service: UserResponse = Service()) {
        self.service = service
        fetchData()
    }
    func fetchData() {
        service.fetchData(Contstants.url)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {completion in
                switch completion {
                case .finished:
                    print("Success")
                case .failure(let error):
                    print("\(error.localizedDescription)")
                }
            }, receiveValue: {  user in
                self.users = user
            })
            .store(in: &cancellable)
    }
}
