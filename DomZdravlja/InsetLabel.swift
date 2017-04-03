//
//  InsetLabel.swift
//  DomZdravlja
//
//  Created by Petar Santor on 4/1/17.
//  Copyright © 2017 Petar Santor. All rights reserved.
//

import UIKit

class InsetLabel: UILabel {

    override func drawText(in rect: CGRect) {
        super.drawText(in:UIEdgeInsetsInsetRect(rect, UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)))
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
