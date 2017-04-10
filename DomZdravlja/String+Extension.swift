//
//  String+Extension.swift
//  DomZdravlja
//
//  Created by Petar Santor on 4/10/17.
//  Copyright © 2017 Petar Santor. All rights reserved.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
