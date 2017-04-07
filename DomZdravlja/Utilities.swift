//
//  Utilities.swift
//  DomZdravlja
//
//  Created by Petar Santor on 3/31/17.
//  Copyright © 2017 Petar Santor. All rights reserved.
//

import Foundation
import UIKit

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
    
    class func isValidLBOFormat(string: String?) -> Bool {
        return Utilities.isValidFormat(string:string, regex: "^[0-9]{11}$")
    }
    
    class func isValidFormat(string: String?, regex:String) -> Bool {
        if string != nil {
            let regex = try? NSRegularExpression(pattern: regex, options: [])
            if let regex = regex {
                let match = regex.numberOfMatches(in: string!, options: [], range: NSRange(location: 0, length: string!.characters.count))
                return match == 1
            }
            return false
        } else {
            return false
        }
    }
    
    
    class func setRedButton(_ button:UIButton, title: String) {
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.backgroundColor = Constants.Color.CustomRed
        button.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
        button.titleLabel?.textAlignment = NSTextAlignment.center
    }
    
    class func setSubtitleLabel(_ label:UILabel) {
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 16)
        label.backgroundColor = UIColor.clear
    }
    
}


