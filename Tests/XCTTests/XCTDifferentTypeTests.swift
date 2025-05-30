//
//  XCTDifferentTypeTests.swift
//
//
//  Created by Lenard Pop on 12/02/2024.
//

import XCTest
import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport

final class XCTDifferentTypeTests: XCTBaseTests {
    func testInlineDataMacroString() throws {
        assertMacroExpansion(
            """
            
            @InlineData("hello")
            func testingMethod(value: String) -> String { }
            
            """,
            expandedSource: """

            func testingMethod(value: String) -> String { }

            func testingMethod_hello() -> String {
                let value: String = "hello"
            }
            """,
            macros: xctParameteriseMacros
        )
    }
    
    func testInlineDataMacroInt() throws {
        assertMacroExpansion(
            """
            
            @InlineData(2)
            func testingMethod(value: Int) -> Int {
                return 0
            }
            
            """,
            expandedSource: """
            func testingMethod(value: Int) -> Int {
                return 0
            }

            func testingMethod_2() -> Int {
                let value: Int = 2

                return 0
            }
            """,
            macros: xctParameteriseMacros
        )
    }
    
    func testInlineDataMacroDouble() throws {
        assertMacroExpansion(
            """
            
            @InlineData(5.2319)
            func testingMethod(value: Double) -> Double {
                return 0.0
            }
            
            """,
            expandedSource: """
            func testingMethod(value: Double) -> Double {
                return 0.0
            }

            func testingMethod_5_2319() -> Double {
                let value: Double = 5.2319

                return 0.0
            }
            """,
            macros: xctParameteriseMacros
        )
    }
    
    func testInlineDataMacroFloat() throws {
        assertMacroExpansion(
            """
            
            @InlineData(15.0)
            func testingMethod(value: Float) -> Float {
                return 0.0
            }
            
            """,
            expandedSource: """
            func testingMethod(value: Float) -> Float {
                return 0.0
            }

            func testingMethod_15_0() -> Float {
                let value: Float = 15.0

                return 0.0
            }
            """,
            macros: xctParameteriseMacros
        )
    }
    
    func testInlineDataMacroMemberFunction() throws {
        assertMacroExpansion(
            """
            
            @InlineData("www.github.com", Date.from(year: 2025, month: 4, day: 26, hour: 14, minute: 30))
            func testMultipleParams(value: String, date: Date?) throws {
                let url = URLRequest(url: URL(string: value)!)
            }
            
            """,
            expandedSource: """
            func testMultipleParams(value: String, date: Date?) throws {
                let url = URLRequest(url: URL(string: value)!)
            }

            func testMultipleParams_www_github_com_Date_from_year_2025_month_4_day_26_hour_14_minute_30() throws {
                let value: String = "www.github.com"
                let date: Date? = Date.from(year: 2025, month: 4, day: 26, hour: 14, minute: 30)
            
                let url = URLRequest(url: URL(string: value)!)
            }
            """,
            macros: xctParameteriseMacros
        )
    }
}
