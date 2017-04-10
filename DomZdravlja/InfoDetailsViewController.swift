//
//  InfoDetailsViewController.swift
//  DomZdravlja
//
//  Created by Petar Santor on 4/9/17.
//  Copyright © 2017 Petar Santor. All rights reserved.
//

import UIKit

class InfoDetailsViewController: UIViewController {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var textViewContent: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func setMissionAndVisionText() {
        self.labelTitle.text = NSLocalizedString("Mission-And-Vision-Title", comment: "")
        self.textViewContent.text = NSLocalizedString("Mission-And-Vision-Content", comment: "")
    }
    
    public func setDepartmentsText() {
        self.labelTitle.text = NSLocalizedString("Departments-Title", comment: "")
        self.textViewContent.text = NSLocalizedString("Departments-Content", comment: "")
    }
    
    public func setColorectalScanningText() {
        self.labelTitle.text = NSLocalizedString("Colorectal-Scanning-Title", comment: "")
        self.textViewContent.text = NSLocalizedString("Colorectal-Scanning-Content", comment: "")
    }
    
    public func setUterusScanningText() {
        self.labelTitle.text = NSLocalizedString("Uterus-Scanning-Title", comment: "")
        self.textViewContent.text = NSLocalizedString("Uterus-Scanning-Content", comment: "")
    }
    
    public func setTeatScanningText() {
        self.labelTitle.text = NSLocalizedString("Teat-Scanning-Title", comment: "")
        self.textViewContent.text = NSLocalizedString("Teat-Scanning-Content", comment: "")
    }
    
    public func setPatientRightsText() {
        self.labelTitle.text = NSLocalizedString("Patient-Rights-Title", comment: "")
        self.textViewContent.text = NSLocalizedString("Patient-Rights-Content", comment: "")
    }
    
    public func setPatientObligationsText() {
        self.labelTitle.text = NSLocalizedString("Patient-Obligations-Title", comment: "")
        self.textViewContent.text = NSLocalizedString("Patient-Obligations-Content", comment: "")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
