//
//  iExtend+Date.swift
//  iExtend
//
//  Created by ULTLab on 21/04/19.
//  Copyright © 2019 UltranLab Engineering Pvt. Ltd. All rights reserved.
//

import Foundation

public extension Date {
    func checkGreaterDate(date toCheck: Date,
                          with components: Calendar.Component,
                          checkValue value: Int, greater bool: Bool) -> Bool {
        let componentsValue: DateComponents = Calendar.current.dateComponents([components], from: self, to: toCheck)
        switch components {
        case .day:
            if let dayCheck = componentsValue.day{
                return bool ? dayCheck > value : dayCheck < value
            } else {
                return false
            }
        case .month:
            if let monthCheck = componentsValue.month,
                monthCheck > value {
                return bool ? monthCheck > value : monthCheck < value
            } else {
                return false
            }
        case .year:
            if let yearCheck = componentsValue.year {
                return bool ? yearCheck > value : yearCheck < value
            } else {
                return false
            }
        case .hour:
            if let hourCheck = componentsValue.hour {
                return bool ? hourCheck > value : hourCheck < value
            } else {
                return false
            }
        case .minute:
            if let minuteCheck = componentsValue.minute {
                return bool ? minuteCheck > value : minuteCheck < value
            } else {
                return false
            }
        case .second:
            if let secondCheck = componentsValue.second{
                return bool ? secondCheck > value : secondCheck < value
            } else {
                return false
            }
        default:
            return false
        }
    }
    func getDateInString(seperatorStyle: String) -> String {
        let dateMonthInt = self.getMonthInt()
        let dateYearString = self.getYearString()
        let dateDayInt = self.getDayInt()
        return "\(dateYearString)\(seperatorStyle)\(dateMonthInt)\(seperatorStyle)\(dateDayInt)"
    }
    func getDayInt() -> Int {
        return Calendar.current.component(.day, from: self)
    }
    func getMonthInt() -> Int {
        return Calendar.current.component(.month, from: self)
    }
    func getYearString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter.string(from: self)
    }
    func getMonthString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        return dateFormatter.string(from: self)
    }
    func getHourInt() -> Int {
        return Calendar.current.component(.hour, from: self)
    }
    func getMinuteInt() -> Int {
        return Calendar.current.component(.minute, from: self)
    }
    func getSecondInt() -> Int {
        return Calendar.current.component(.second, from: self)
    }
    func getOnlyTime(formatter: String, timeZone: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatter
        dateFormatter.timeZone = TimeZone(identifier: timeZone)
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: self)
    }
    func getDesiredDate(monthValue month: Int) -> Date? {
        return Calendar.current.date(byAdding: .month, value: month, to: self)
    }
}
