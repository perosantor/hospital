//
//  SettingsViewController.swift
//  DomZdravlja
//
//  Created by Petar Santor on 4/8/17.
//  Copyright © 2017 Petar Santor. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    // MARK: - Outlets
    
    
    @IBOutlet weak var labelNotifications: UILabel!
    @IBOutlet weak var labelVersion: UILabel!
    @IBOutlet weak var labelRate: UILabel!
    @IBOutlet weak var labelExplanation: UILabel!
    
    @IBOutlet weak var buttonRate: UIButton!
    
    @IBOutlet weak var buttonExplanation: UIButton!
    
    @IBOutlet weak var labelVersionNumber: UILabel!
    
    // MARK: - Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.labelNotifications.text = "Нотификације"
        self.labelVersion.text = "Верзија"
        self.labelRate.text = "Оцени апликацију"
        self.labelExplanation.text = "Приказ објашњења"
        
        Utilities.setТitleLabel(self.labelNotifications)
        Utilities.setТitleLabel(self.labelVersion)
        Utilities.setТitleLabel(self.labelRate)
        Utilities.setТitleLabel(self.labelExplanation)
        Utilities.setТitleLabel(self.labelVersionNumber)
        
        Utilities.setRedButtonSmall(self.buttonExplanation, title: "Прикажи објашњење")
        
        self.labelVersionNumber.text = getVersionNumber()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Utilities
    
    
    func getVersionNumber() -> String {
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            return version
        } else {
            return ""
        }
    }

    // MARK: - Actions
    
    
    @IBAction func switchNotification(_ sender: UISwitch) {
        if sender.isOn {
            Utilities.setPushEnabledFlag("true")
        } else {
            Utilities.setPushEnabledFlag("false")
        }
    }
    
    @IBAction func handleTapOnRateButton(_ sender: UIButton) {
        UIApplication.shared.open(NSURL(string: "itms://itunes.apple.com/de/app/x-gift/id839686104?mt=8&uo=4") as! URL, options: [:]) { (success) in
            if success {
                print("opened")
            } else {
                print("could not be opened")
            }
        }
        
        //UIApplication.shared.openURL(NSURL(string: "itms://itunes.apple.com/de/app/x-gift/id839686104?mt=8&uo=4")! as URL)

    }
    
    @IBAction func handleTapOnShowExplanationButton(_ sender: UIButton) {
        if let parentVC = self.parent as? MasterViewController {
            parentVC.showExplanationOverlay()
        }
    }
    
    

}
