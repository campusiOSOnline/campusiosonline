//
//  GetDataMoviesTest.swift
//  TheBestsMoviesTests
//
//  Created by Sergio Becerril on 04/02/2020.
//  Copyright © 2020 Sergio Becerril. All rights reserved.
//


import XCTest
@testable import TheBestsMovies
@testable import RxBlocking

class GetDataMoviesTest: XCTestCase {
    func testGetListOfMoviesReceivedOK() {
        // Given
        let managerConnections = ManagerConnections()
        
        // When
        let movies = try! managerConnections.getPopularMovies().toBlocking().single()
        
        // Then
        XCTAssertTrue(movies.count != 0)
    }
}

