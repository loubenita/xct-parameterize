//
//  Date+Extensions.swift
//  XCTParameterize
//
//  Created by Lenard Pop on 26/04/2025.
//

import Foundation

extension Date {
    static func from(
        year: Int,
        month: Int,
        day: Int,
        hour: Int = 0,
        minute: Int = 0,
        second: Int = 0
    ) -> Date? {
        DateComponents(
            calendar: Calendar(identifier: .gregorian),
            timeZone: TimeZone(secondsFromGMT: 0),
            year: year,
            month: month,
            day: day,
            hour: hour,
            minute: minute,
            second: second
        ).date
    }
}
