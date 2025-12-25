//
//  net_webTests.swift
//  net-webTests
//
//  Created by Sravanti on 25/12/25.
//

import XCTest
@testable import net_web

class UserTests: XCTestCase {
    override func setUpWithError() throws {
        
    }
    override func tearDownWithError() throws {
        
    }
    func testUserName() {
        let user = User(id: 0, name: "dor", username: "", email: "", address: Address(street: "", suite: "", city: "", zipcode: "", geo: Geo(lat: "", lng: "")), phone: "", website: "", company: Company(name: "", catchPhrase: "", bs: ""))
        XCTAssertEqual(user.name, "Bret")
    }
    func testUserEmail() {
        let user = User(id: 0, name: "Bret", username: "", email: "Sincere@april.biz", address: Address(street: "", suite: "", city: "", zipcode: "", geo: Geo(lat: "", lng: "")), phone: "", website: "", company: Company(name: "", catchPhrase: "", bs: ""))
        XCTAssertEqual(user.email, "Sincere@april.biz")

    }
}
