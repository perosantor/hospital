//
//  MainScreenViewController.swift
//  DomZdravlja
//
//  Created by Petar Santor on 3/20/17.
//  Copyright © 2017 Petar Santor. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController {

    
    //MARK: - Outlets
    
    
    @IBOutlet var buttonsOption: [UIButton]!

    @IBOutlet weak var buttonDrawer: UIButton!
    
    @IBOutlet weak var buttonEmergencyCall: UIButton!
    
    
    //MARK: - Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setOptionButtonsAppearance()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - Actions

    
    @IBAction func handleTapOnOptionButton(_ sender: UIButton) {
        
    }
    
    @IBAction func handleTapOnDrawerButton(_ sender: UIButton) {
        
    }

    @IBAction func handleTapOnEmergencyCallButton(_ sender: UIButton) {
        
    }
    
    
    //MARK: - Utilities
    
    
    func setOptionButtonsAppearance() {
        for button in self.buttonsOption {
            button.backgroundColor = Constants.Color.CustomRed
            button.alpha = 0.8
            button.setTitleColor(UIColor.white, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: UIFontWeightRegular)
        }
    }

}

