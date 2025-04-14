//
//  XCTAttributeTests.swift
//  XCTParameterize
//
//  Created by Lenard Pop on 28/03/2025.
//

import XCTest
import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport

final class XCTAttributeTests: XCTBaseTests {
    func testMainActorAttribute() throws {
        assertMacroExpansion(
            """
            
            @InlineData("hello")
            @MainActor
            func testingMethod(value: String) -> String { }
            
            """,
            expandedSource: """

            @MainActor
            func testingMethod(value: String) -> String { }

            @MainActor
            func testingMethod_hello() -> String {
                let value: String = "hello"
            }
            """,
            macros: xctParameteriseMacros
        )
    }
}
