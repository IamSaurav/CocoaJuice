//
//  NSDate+Utility.swift
//  Medtronic
//
//  Created by Saurav Satpathy on 15/11/16.
//  Copyright © 2016 Medtronic. All rights reserved.
//

import UIKit

let kDays = "Days"
let kHours = "Hours"
let kMins = "Minutes"
let kSecs = "Seconds"
let secondsInMinute = 60
let minuteInHour = 60
let hourInDay = 24

extension NSDate {

    public static func toUTC(date : NSDate) -> NSDate {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZ"
        formatter.timeZone = NSTimeZone(abbreviation: "UTC")
        let dateStr = formatter.stringFromDate(date)
        return formatter.dateFromString(dateStr)!
    }
    
    public static func timeAgo (toDate : NSDate = NSDate(), fromDate : NSDate) -> String
    {
        var ago : String = String()
        let fromDateUTC = toUTC(fromDate)
        let toDateUTC = toUTC(toDate)
        if(fromDateUTC.compare(toDateUTC) == .OrderedDescending)
        {
            return ago
        }
        let secsAgo = abs(Int(toDateUTC.timeIntervalSinceDate(fromDateUTC)))
        let daysAgo = secsAgo/(secondsInMinute*minuteInHour*hourInDay)
        let hoursAgo = secsAgo/(secondsInMinute*minuteInHour)
        let minsAgo = secsAgo/(secondsInMinute)
        if (daysAgo >= 1) {
            ago = String.localizedStringWithFormat(NSLocalizedString(kDays, comment: ""),daysAgo)
        } else if (hoursAgo >= 1) {
            ago = String.localizedStringWithFormat(NSLocalizedString(kHours, comment: ""),hoursAgo)
        } else if (minsAgo >= 1) {
            ago = String.localizedStringWithFormat(NSLocalizedString(kMins, comment: ""),minsAgo)
        } else {
            ago = String.localizedStringWithFormat(NSLocalizedString(kSecs, comment: ""),secsAgo)
        }
        return ago;
    }
}
