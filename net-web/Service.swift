//
//  Service.swift
//  net-web
//
//  Created by Sravanti on 19/12/25.
//

import Foundation
import Combine

protocol UserResponse {
    func fetchData(_ urlString: String) -> AnyPublisher<[User], Error>
}

class Service: UserResponse {
    func fetchData(_ urlString: String) -> AnyPublisher<[User], Error> {
        let url = URL(string: urlString)!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [User].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
