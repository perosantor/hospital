//
//  Utilities.swift
//  DomZdravlja
//
//  Created by Petar Santor on 3/31/17.
//  Copyright © 2017 Petar Santor. All rights reserved.
//

import Foundation

class Utilities {
    
    class func getDate(fromString string: String?) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-mm-yyyy"
        if string != nil {
            let date = dateFormatter.date(from: string!)
            return date

        } else {
            return nil
        }
    }
    
    class func getString(fromDate date: Date) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-mm-yyyy"
        let newDate = dateFormatter.string(from: date)
        return newDate
    }
    
    class func isValidIDFormat(string: String?) -> Bool {
        if string != nil {
            let regex = try? NSRegularExpression(pattern: "^[0-9]{8}$", options: [])
            if let regex = regex {
                let match = regex.numberOfMatches(in: string!, options: [], range: NSRange(location: 0, length: string!.characters.count))
                return match == 1
            }
            return false
        } else {
            return false
        }
        
        
    }
    
}


