//
//  User.swift
//  net-web
//
//  Created by Sravanti on 19/12/25.
//

import Foundation
import SwiftUI
struct User: Decodable, Identifiable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: Address
    let phone: String
    let website: String
    let company: Company
    var image: ImageResource {
        switch id {
        case 0:
                .image0
        case 1:
                .image1
        case 2:
                .image2
        case 3:
                .image3
        case 4:
                .image4
        case 5:
                .image5
        case 6:
                .image6
        case 7:
                .image7
        case 8:
                .image8
        case 9:
                .image9
        default:
                .image0
        }
    }
}
struct Address: Decodable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: Geo
}
struct Geo: Decodable {
    let lat: String
    let lng: String
}
struct Company: Decodable {
    let name: String
    let catchPhrase: String
    let bs: String
}
