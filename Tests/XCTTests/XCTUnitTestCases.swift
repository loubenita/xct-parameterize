//
//  XCTTestCases.swift
//
//
//  Created by Lenard Pop on 14/02/2024.
//

import XCTest
import Foundation
import XCTParameterize

final class XCTUnitTestCases: XCTestCase {
    
    @InlineData(["www.github.com"])
    func testURLValue(value: [String]) throws {
        let url = URLRequest(url: URL(string: "www.github.com")!)
        
        XCTAssertEqual(url.url?.absoluteString, value.first)
    }
    
    @InlineData(nil)
    func testNilValue(value: String?) throws {
        XCTAssertNil(value)
    }
    
    @InlineData(["www.github.com"], label: "_verifyURL")
    func testValue(value: [String]) throws {
        let url = URLRequest(url: URL(string: "www.github.com")!)
        
        XCTAssertEqual(url.url?.absoluteString, value.first)
    }
    
    @InlineData(["www.github.com"])
    @InlineData(["www.github.com"], label: "_verifyURL")
    func testCombined(value: [String]) throws {
        let url = URLRequest(url: URL(string: "www.github.com")!)
        
        XCTAssertEqual(url.url?.absoluteString, value.first)
    }
    
    @InlineData(1745677800, Date.from(year: 2025, month: 4, day: 26, hour: 14, minute: 30))
    func testMultipleParams(timeIntervalSince1970: Int, date: Date?) throws {
        XCTAssertEqual(timeIntervalSince1970, Int(date!.timeIntervalSince1970))
    }
    
    @InlineData("www.github.com", label: "_attributeCheck")
    @MainActor
    func testAttribute(value: String) throws {
        let url = URLRequest(url: URL(string: "www.github.com")!)
        
        XCTAssertEqual(url.url?.absoluteString, value)
    }
}
