//
//  VaccinesDetailsViewController.swift
//  DomZdravlja
//
//  Created by Petar Santor on 4/11/17.
//  Copyright © 2017 Petar Santor. All rights reserved.
//

import UIKit

class VaccinesDetailsViewController: UIViewController {
    
    // MARK: - Outlets
    
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelContent: UILabel!
    
    @IBOutlet weak var viewLabel1: LabelWithBackground!
    @IBOutlet weak var viewLabel2: LabelWithBackground!
    @IBOutlet weak var viewLabel4: LabelWithBackground!
    @IBOutlet weak var viewLabel3: LabelWithBackground!
    
    @IBOutlet weak var buttonBack: UIButton!
    
    
    // MARK: - Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        self.hideKeyboardWhenTappedAround()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    
    public func setAppearance(forCategory category:Int) {
        switch category {
        case 0:
            self.labelTitle.text = "vaccines-title1".localized.uppercased()
            self.labelContent.text = "HB\n\n" + "HB".localized
            
            self.viewLabel1.labelLeft.text = "BCG"
            self.viewLabel1.labelRight.text = "вакцина"
            self.viewLabel2.labelLeft.text = "HB"
            self.viewLabel2.labelRight.text = "прва доза + HBIG"
            
            self.viewLabel3.isHidden = true
            self.viewLabel4.isHidden = true
            
            break
        default:
            break
        }
    }
    
    func setup() {
        self.view.backgroundColor = UIColor.clear
    }
    
    
    // MARK: - Actions

    @IBAction func handleTapOnBackButton(_ sender: UIButton) {
        
    }
    
    
    
}
