//
//  DoctorsAdviceViewController.swift
//  DomZdravlja
//
//  Created by Petar Santor on 4/10/17.
//  Copyright © 2017 Petar Santor. All rights reserved.
//

import UIKit

class DoctorsAdviceViewController: UIViewController {

    @IBOutlet weak var buttonAskDoctor: UIButton!
    @IBOutlet weak var buttonVaccination: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clear

        Utilities.setRedButton(self.buttonAskDoctor, title: "ПИТАЈ ДОКТОРА")
        Utilities.setRedButton(self.buttonVaccination, title: "ВАКЦИНАЦИЈЕ")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func handleTapOnAskDoctor(_ sender: UIButton) {
        if ((self.parent as? MasterViewController) != nil ) {
            let master = self.parent as? MasterViewController
            master?.load(viewWithType: Constants.View.Contact)
            if (master?.childViewControllers[0] as? FeedbackViewController) != nil {
                let feedback = master?.childViewControllers[0] as? FeedbackViewController
                feedback?.setupAskDoctorAppearance()
            }
        }
        
    }
    
    @IBAction func handleTapOnVaccination(_ sender: UIButton) {
        if ((self.parent as? MasterViewController) != nil ) {
            let master = self.parent as? MasterViewController
            master?.load(viewWithType: Constants.View.Vaccines)
        }
    }

}
