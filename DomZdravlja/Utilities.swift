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
        dateFormatter.dateFormat = "dd-mm-yyyy" //Your date format
        if string != nil {
            let date = dateFormatter.date(from: string!)
            return date

        } else {
            return nil
        }
    }
}


