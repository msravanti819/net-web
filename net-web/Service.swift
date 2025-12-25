//
//  Service.swift
//  net-web
//
//  Created by Sravanti on 19/12/25.
//

import Foundation
import Combine

enum NetworkError: Error {
    case badUrl
    case invalidData
}

protocol UserResponse {
    func fetchData(_ urlString: String) -> AnyPublisher<[User], Error>
}

class Service: UserResponse {
    func fetchData(_ urlString: String) -> AnyPublisher<[User], Error> {
        guard let url = URL(string: urlString) else {
            return Fail(error: NetworkError.badUrl).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [User].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    func asyncFetchData(_ urlString: String) async throws -> [User] {
        guard let url = URL(string: urlString) else {
            throw NetworkError.badUrl
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            do {
                let decodedData = try JSONDecoder().decode([User].self, from: data)
                return decodedData
            } catch {
               
                throw NetworkError.invalidData
            }
        } catch {
           
            throw NetworkError.invalidData
        }
    }
}

