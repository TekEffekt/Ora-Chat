//
//  Date+TimeDifDisplay.swift
//  OraChat
//
//  Created by Kyle Zawacki on 4/4/17.
//
//

import Foundation

extension Date {
    
    func displayTime(from date: Date) -> String {
        var displayTime = ""
        let seconds = self.timeIntervalSince(date)
        let secondsInDay: Double = 86400
        
        if seconds < secondsInDay {
            let currentCalendar = Calendar.current
            let dateComponents = currentCalendar.dateComponents([.hour, .minute, .second], from: date, to: self)
            
            if let hourDif = dateComponents.hour {
                displayTime += "\(hourDif)"
                displayTime += hourDif > 1 ? "hours " : "hour "
            } else if let minuteDif = dateComponents.minute {
                displayTime += "\(minuteDif)"
                displayTime += minuteDif > 1 ? "minutes " : "minute "
            } else if let secondDif = dateComponents.second {
                displayTime += "\(secondDif)"
                displayTime += secondDif > 1 ? "seconds " : "second "
            }
            displayTime += "ago"
        } else {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .short
            dateFormatter.timeStyle = .none
            displayTime = dateFormatter.string(from: date)
        }
        
        return displayTime
    }
    
}
