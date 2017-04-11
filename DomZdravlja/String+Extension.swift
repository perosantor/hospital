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
}
