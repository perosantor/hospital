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
            Utilities.setMainOptionsButtonAppearance(button)
        }
    }
    
    @IBAction func handleTapOnOptionsButton(_ sender: UIButton) {
        
        var master: MasterViewController?
        if ((self.parent as? MasterViewController) != nil ) {
            master = self.parent as? MasterViewController
            switch sender.tag {
            case 1:
                master?.load(viewWithType: Constants.View.InfoCenter)
                break
            case 2:
                master?.load(viewWithType: Constants.View.News)
                break
            case 3:
                master?.load(viewWithType: Constants.View.Scheduling)
                break
            case 4:
                master?.load(viewWithType: Constants.View.CheckInsurance)
                break
            case 5:
                master?.load(viewWithType: Constants.View.SocialNetworks)
                break
            case 6:
                master?.load(viewWithType: Constants.View.DoctorsAdvice)
                break
            case 7:
                master?.load(viewWithType: Constants.View.BodyMass)
                break
            default:
                break
            }
        }
      
    }
    
}
