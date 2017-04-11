//
//  LabelWithBackground.swift
//  DomZdravlja
//
//  Created by Petar Santor on 4/11/17.
//  Copyright © 2017 Petar Santor. All rights reserved.
//

import UIKit

class LabelWithBackground: CustomView {

    
    override func setup() {
        super.nibName = "LabelWithBackground"
        super.setup()
        setupAppearance()
    }
    
    @IBOutlet weak var labelLeft: UILabel!
    @IBOutlet weak var labelRight: UILabel!
    
    @IBOutlet weak var viewBackgroundLeft: UIView!
    @IBOutlet weak var viewBackgroundRight: UIView!
    
    func setupAppearance() {
//        Utilities.setSubtitleLabel(label)
//        
//        self.textView.backgroundColor = UIColor.clear.withAlphaComponent(0.5)
//        self.textView.textColor = UIColor.white
        
        self.view.backgroundColor = UIColor.clear
        self.backgroundColor = UIColor.clear
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
