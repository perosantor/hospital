//
//  InputTextView.swift
//  DomZdravlja
//
//  Created by Petar Santor on 4/6/17.
//  Copyright © 2017 Petar Santor. All rights reserved.
//

import UIKit

class InputTextView: CustomView {

    override func setup() {
        super.nibName = "InputTextView"
        super.setup()
        setupAppearance()
    }
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var textView: UITextView!
    
    
    public var isEmpty:Bool {
        if (self.textView.text?.characters.count)! > 0 {
            return false
        } else {
            return true
        }
    }
    
    func setupAppearance() {
        Utilities.setSubtitleLabel(label)
        
        self.textView.backgroundColor = UIColor.clear.withAlphaComponent(0.5)
        self.textView.textColor = UIColor.white
        
        self.view.backgroundColor = UIColor.clear
        self.backgroundColor = UIColor.clear
    }

}
