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
    
    @IBOutlet weak var imageViewBackground: UIImageView!
    
    //MARK: - Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let overlay: UIView = UIView(frame: CGRect(x: self.imageViewBackground.frame.origin.x,
                                                   y: self.imageViewBackground.frame.origin.y - 20,
                                                   width: self.imageViewBackground.frame.size.width + 40,
                                                   height: self.imageViewBackground.frame.size.height))
        
        overlay.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.2)
        self.imageViewBackground.addSubview(overlay)
        
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

