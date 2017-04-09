//
//  InfoCenterViewController.swift
//  DomZdravlja
//
//  Created by Petar Santor on 4/9/17.
//  Copyright © 2017 Petar Santor. All rights reserved.
//

import UIKit

class InfoCenterViewController: UIViewController {

    
    // MARK: - Outlets
    
    
    @IBOutlet var buttons: [UIButton]!
    
    @IBOutlet var constraintFirstDropdown: [NSLayoutConstraint]!
    
    // MARK: - Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        self.hideKeyboardWhenTappedAround()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registerForKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        deregisterFromKeyboardNotifications()
    }
    

    // MARK: - Utilities
    
    
    func setup() {
        self.view.backgroundColor = UIColor.clear
        for button in buttons {
            switch button.tag {
            case 1, 4, 8:
                Utilities.setInfoButton(button)
                break
            default:
                Utilities.setInfoSubtitleButton(button)
                break
            }
        }
    }
    
    private func toggleDropdown(buttonTags values: Array<Int>) {
        
        for button in buttons {
            if values.contains(button.tag) {
                if button.isHidden {
                    button.isHidden = false
                } else {
                    button.isHidden = true
                }
                
            }
        }
    }
    
    
    // MARK: - Actions
    
    
    @IBAction func handleTapOnButton(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            toggleDropdown(buttonTags: [2,3])
            break

        case 4:
            toggleDropdown(buttonTags: [5,6,7])
            break
        case 8:
            toggleDropdown(buttonTags: [9,10,11])
            break
        default:
            break
        }
    }
    
}
