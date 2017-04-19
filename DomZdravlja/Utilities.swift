//
//  Utilities.swift
//  DomZdravlja
//
//  Created by Petar Santor on 3/31/17.
//  Copyright © 2017 Petar Santor. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD

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
    
    
    //MARK - Set UIButton appearance
    
    
    class func setRedButton(_ button:UIButton, title: String) {
        setButton(button, title: title, height: 18, color:nil)
    }
    
    class func setRedButtonSmall(_ button:UIButton, title: String) {
        setButton(button, title: title, height: 10, color: nil)
    }
    
    class func setInfoButton(_ button:UIButton) {
        setButton(button, title: nil, height: 18, color: nil)
    }
    
    class func setInfoSubtitleButton(_ button:UIButton) {
        setButton(button, title: nil, height: 18, color: UIColor.clear)
    }
    
    class func setInfoSubtitleButton(_ button:UIButton, title:String) {
        setButton(button, title: title, height: 18, color: UIColor.clear)
    }
    
    class func setButton(_ button:UIButton, title: String?, height: CGFloat, color:UIColor?) {
        button.setTitleColor(UIColor.white, for: .normal)
        if title != nil {
            button.setTitle(title, for: .normal)
        }
        button.titleLabel?.font = UIFont.systemFont(ofSize: height)
        if color == nil {
            button.backgroundColor = Constants.Color.CustomRed
        } else {
            button.backgroundColor = color
        }
        button.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
        button.titleLabel?.textAlignment = NSTextAlignment.center
    }
    
    class func setMainOptionsButtonAppearance(_ button:UIButton) {
        button.backgroundColor = Constants.Color.CustomRed
        button.alpha = 0.8
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = Constants.Font.ButtonTitle
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.titleLabel?.textAlignment = .center
    }
    
    
    //MARK: - Set UILabel appearance
    
    
    class func setSubtitleLabel(_ label:UILabel) {
        self.setLabel(label, size: 13)
    }
    
    class func setТitleLabel(_ label:UILabel) {
        self.setLabel(label, size: 18)
    }
    
    class func setLabel(_ label:UILabel, size:CGFloat) {
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: size)
        label.backgroundColor = UIColor.clear
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
    }
    
    
    //MARK: - User settings
    
    
    class func getPushEnabledFlag() -> String? {
        return UserDefaults.standard.object(forKey: Constants.UserDefaultsKey.PushEnabled) as? String ?? nil
    }
    
    class func setPushEnabledFlag(_ token:String) {
        UserDefaults.standard.set(token, forKey: Constants.UserDefaultsKey.PushEnabled)
    }
    
    class func deletePushEnabledFlag() {
        UserDefaults.standard.removeObject(forKey: Constants.UserDefaultsKey.PushEnabled)
    }
    
    class func isValidLicence() -> Bool {
        var ret = true
        let readValue = UserDefaults.standard.object(forKey: Constants.UserDefaultsKey.Licence) as? NSNumber ?? nil
        if (readValue != nil) {
            if readValue == 0 {
                ret = false
            }
        }
        return ret
    }
    
    class func setLicence(_ token:NSNumber) {
        UserDefaults.standard.set(token, forKey: Constants.UserDefaultsKey.Licence)
    }
    
    class func setAdd(withID addID:Int, title:String) {
        if isAddNew(addID: addID, addTitle: title) {
            UserDefaults.standard.set(addID, forKey: Constants.UserDefaultsKey.AddID)
            UserDefaults.standard.set(title, forKey: Constants.UserDefaultsKey.AddTitle)
            //UserDefaults.standard.set("true", forKey: Constants.UserDefaultsKey.AddSeen)
            SVProgressHUD.showInfo(withStatus: title)
        }
    }
    
    class func isAddNew(addID: Int, addTitle: String) -> Bool {
        var ret = false
        if let id = UserDefaults.standard.object(forKey: Constants.UserDefaultsKey.AddID) as? Int, let title = UserDefaults.standard.object(forKey: Constants.UserDefaultsKey.AddTitle) as? String {
            if addID != id && title != addTitle {
                ret = true
            }
        } else {
            //First time run
            UserDefaults.standard.set(addID, forKey: Constants.UserDefaultsKey.AddID)
            UserDefaults.standard.set(addTitle, forKey: Constants.UserDefaultsKey.AddTitle)
            SVProgressHUD.showInfo(withStatus: addTitle)
        }
        return ret
    }
    
}


