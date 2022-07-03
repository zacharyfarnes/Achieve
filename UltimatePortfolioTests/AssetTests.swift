//
//  AssetTests.swift
//  UltimatePortfolioTests
//
//  Created by Zachary Farnes on 02/07/2022.
//

import XCTest
@testable import UltimatePortfolio

class AssetTests: XCTestCase {
    func testColorsExist() {
        for color in Project.colors {
            XCTAssertNotNil(UIColor(named: color), "Failed to load color '\(color)' from asset catalog.")
        }
    }

    func testJSONLoadsCorrectly() {
        XCTAssertFalse(Award.allAwards.isEmpty, "Failed to load awards from JSON.")
    }
}
