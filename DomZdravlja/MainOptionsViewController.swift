//
//  MainOptionsViewController.swift
//  DomZdravlja
//
//  Created by Petar Santor on 3/22/17.
//  Copyright © 2017 Petar Santor. All rights reserved.
//

import UIKit

class MainOptionsViewController: UIViewController {
    
    @IBOutlet var buttonsOption: [UIButton]!
    
    override func viewDidLoad() {
        setOptionButtonsAppearance()
    }
    
    func setOptionButtonsAppearance() {
        for button in self.buttonsOption {
            button.backgroundColor = Constants.Color.CustomRed
            button.alpha = 0.8
            button.setTitleColor(UIColor.white, for: .normal)
            button.titleLabel?.font = Constants.Font.ButtonTitle
        }
    }
    
}
