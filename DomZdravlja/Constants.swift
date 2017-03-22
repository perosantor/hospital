//
//  Constants.swift
//  DomZdravlja
//
//  Created by Petar Santor on 3/21/17.
//  Copyright © 2017 Petar Santor. All rights reserved.
//

import UIKit
import Foundation

struct Constants {
    struct Color {
        static let CustomRed = UIColor(colorLiteralRed: 188/255, green: 0/255, blue: 10/255, alpha: 1)
    }
    
    struct Path {
        static let Documents = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        static let Tmp = NSTemporaryDirectory()
    }
}
