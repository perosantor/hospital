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
        Utilities.setRedButton(self.buttonBack, title: "НАЗАД")
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
            self.labelContent.text = "HB\n" + "HB".localized //bcg
            
            self.viewLabel1.labelLeft.text = "BCG"
            self.viewLabel1.labelRight.text = "вакцина"
            self.viewLabel2.labelLeft.text = "HB"
            self.viewLabel2.labelRight.text = "прва доза + HBIG"
            
            self.viewLabel3.isHidden = true
            self.viewLabel4.isHidden = true
            
            break
        case 1:
            self.labelTitle.text = "vaccines-title2".localized.uppercased()
            self.labelContent.text = "HB\n" + "HB".localized
            
            self.viewLabel1.labelLeft.text = "HB"
            self.viewLabel1.labelRight.text = "друга доза"
            
            self.viewLabel2.isHidden = true
            self.viewLabel3.isHidden = true
            self.viewLabel4.isHidden = true
            
            break
            
        case 2:
            self.labelTitle.text = "vaccines-title3".localized.uppercased()
            self.labelContent.text = "HB\n" + "HB".localized
            
            self.viewLabel1.labelLeft.text = "HB"
            self.viewLabel1.labelRight.text = "друга доза"
            
            self.viewLabel2.isHidden = true
            self.viewLabel3.isHidden = true
            self.viewLabel4.isHidden = true
            
            break
            
        case 3:
            self.labelTitle.text = "vaccines-title4".localized.uppercased()
            self.labelContent.text = "DTP\n" + "DTP".localized + "\n" +
                "OPV\n" + "OPV".localized + "\n" +
                "Hib\n" + "Hib".localized
            
            self.viewLabel1.labelLeft.text = "DTP"
            self.viewLabel1.labelRight.text = "прва доза"
            
            self.viewLabel2.labelLeft.text = "OPV"
            self.viewLabel2.labelRight.text = "прва доза"
            
            self.viewLabel3.labelLeft.text = "Hib"
            self.viewLabel3.labelRight.text = "прва доза"
            
            self.viewLabel4.isHidden = true
            
            break
        
        case 4:
            self.labelTitle.text = "vaccines-title5".localized.uppercased()
            self.labelContent.text = "HB\n" + "HB".localized + "\n" +
                "DTP\n" + "DTP".localized + "\n" +
                "OPV\n" + "OPV".localized + "\n" +
                "Hib\n" + "Hib".localized
            
            self.viewLabel1.labelLeft.text = "HB"
            self.viewLabel1.labelRight.text = "трећа доза"
            
            self.viewLabel2.labelLeft.text = "DTP"
            self.viewLabel2.labelRight.text = "трећа доза"
            
            self.viewLabel3.labelLeft.text = "OPV"
            self.viewLabel3.labelRight.text = "трећа доза"
            
            self.viewLabel4.labelLeft.text = "Hib"
            self.viewLabel4.labelRight.text = "трећа доза"
            
            break

        case 5:
            self.labelTitle.text = "vaccines-title6".localized.uppercased()
            self.labelContent.text = "ММR\n" + "Вакцинација" + "\n" +
                "HB\n" + "Вакцинација" + "\n"
            
            self.viewLabel1.labelLeft.text = "MMR"
            self.viewLabel1.labelRight.text = "вакцина"
            self.viewLabel2.labelLeft.text = "HB"
            self.viewLabel2.labelRight.text = "прва доза + HBIG"
            
            self.viewLabel3.isHidden = true
            self.viewLabel4.isHidden = true
            
            break
            
        case 6:
            self.labelTitle.text = "vaccines-title7".localized.uppercased()
            self.labelContent.text = "DTP\n" + "DTP".localized + "\n" +
                "OPV\n" + "OPV".localized + "\n"
            
            self.viewLabel1.labelLeft.text = "DTP"
            self.viewLabel1.labelRight.text = "ревакцинација прва"
            self.viewLabel2.labelLeft.text = "OPV"
            self.viewLabel2.labelRight.text = "ревакцинација прва"
            
            self.viewLabel3.isHidden = true
            self.viewLabel4.isHidden = true
            
            break
            
        case 7:
            self.labelTitle.text = "vaccines-title8".localized.uppercased()
            self.labelContent.text = "DTP\n" + "DTP".localized + "\n" +
                "OPV\n" + "OPV".localized + "\n" +
                "Hib\n" + "Hib".localized
            
            self.viewLabel1.labelLeft.text = "DTP"
            self.viewLabel1.labelRight.text = "прва доза"
            
            self.viewLabel2.labelLeft.text = "OPV"
            self.viewLabel2.labelRight.text = "прва доза"
            
            self.viewLabel3.labelLeft.text = "Hib"
            self.viewLabel3.labelRight.text = "прва доза"
            
            self.viewLabel4.isHidden = true
            
            break
        
        case 8:
            self.labelTitle.text = "vaccines-title9".localized.uppercased()
            self.labelContent.text = "HB\n" + "HB".localized + "\n"
            
            self.viewLabel1.labelLeft.text = "HB"
            self.viewLabel1.labelRight.text = "три дозе (0,1,6)"
            
            self.viewLabel2.isHidden = true
            self.viewLabel3.isHidden = true
            self.viewLabel4.isHidden = true
            
            break
        
        case 9:
            self.labelTitle.text = "vaccines-title10".localized.uppercased()
            self.labelContent.text = "OPV\n" + "OPV".localized + "\n" +
                "dT\n" + "dT".localized + "\n"
            
            self.viewLabel1.labelLeft.text = "OPV"
            self.viewLabel1.labelRight.text = "трећа ревакцинација"
            self.viewLabel2.labelLeft.text = "dt"
            self.viewLabel2.labelRight.text = "трећа ревакцинација"
            
            self.viewLabel3.isHidden = true
            self.viewLabel4.isHidden = true
            
            break
            
        case 10:
            self.labelTitle.text = "vaccines-title11".localized.uppercased()
            self.labelContent.text = "TT\n" + "TT".localized + "\n"
            
            self.viewLabel1.labelLeft.text = "TT"
            self.viewLabel1.labelRight.text = "четврта ревакцинација"
            
            self.viewLabel2.isHidden = true
            self.viewLabel3.isHidden = true
            self.viewLabel4.isHidden = true
            
            break
        
        case 11:
            self.labelTitle.text = "vaccines-title12".localized.uppercased()
            self.labelContent.text = "TT\n" + "TT".localized + "\n"
            
            self.viewLabel1.labelLeft.text = "TT"
            self.viewLabel1.labelRight.text = "пета ревакцинација"
            
            self.viewLabel2.isHidden = true
            self.viewLabel3.isHidden = true
            self.viewLabel4.isHidden = true
            
            break
            
        case 12:
            self.labelTitle.text = "vaccines-title13".localized.uppercased()
            self.labelContent.text = "TT\n" + "TT".localized + "\n"
            
            self.viewLabel1.labelLeft.text = "TT"
            self.viewLabel1.labelRight.text = "шеста ревакцинација"
            
            self.viewLabel2.isHidden = true
            self.viewLabel3.isHidden = true
            self.viewLabel4.isHidden = true
            
            break
            
        case 13:
            self.labelTitle.text = "vaccines-title14".localized.uppercased()
            self.labelContent.text = "TT\n" + "TT".localized + "\n"
            
            self.viewLabel1.labelLeft.text = "TT"
            self.viewLabel1.labelRight.text = "седма ревакцинација"
            
            self.viewLabel2.isHidden = true
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
        if ((self.parent as? MasterViewController) != nil ) {
            let master = self.parent as? MasterViewController
            master?.load(viewWithType: Constants.View.Vaccines)
        }
    }
    
    
    
}
