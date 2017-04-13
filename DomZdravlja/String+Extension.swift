//
//  String+Extension.swift
//  DomZdravlja
//
//  Created by Petar Santor on 4/10/17.
//  Copyright © 2017 Petar Santor. All rights reserved.
//

import Foundation
import UIKit

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    
    var localizedWithNewLine:String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "") + "\n\n"
    }
    
    var bolded:NSMutableAttributedString {
        let attributes :Dictionary = [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 16),
                                      NSForegroundColorAttributeName: UIColor.white]
        
        // Create attributed string
        let attrString = NSMutableAttributedString(string: self, attributes:attributes)
        
        return attrString
    }
    
    var normal:NSMutableAttributedString {
        let attributes :Dictionary = [NSFontAttributeName : UIFont.systemFont(ofSize: 15),
                                      NSForegroundColorAttributeName: UIColor.white]
        
        // Create attributed string
        let attrString = NSMutableAttributedString(string: self, attributes:attributes)
        
        return attrString
    }
    
    //
    
    
    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: Data(utf8), options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print(error)
            return nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
    
    func extractURLs() -> [NSURL] {
        var urls : [NSURL] = []
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
            detector.enumerateMatches(in: self,
                                      options: [],
                                      range: NSMakeRange(0, self.characters.count),
                                      using: { (result, _, _) in
                                                if let match = result, let url = match.url {
                                                    urls.append(url as NSURL)
                                                }
            })
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return urls
    }


}
