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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.textViewContent.setContentOffset(.zero, animated: false)
    }
    
    public func setMissionAndVisionText() {
        self.labelTitle.text = "Mission-And-Vision-Title".localized
        self.textViewContent.text = "Mission-And-Vision-Content".localized
    }
    
    public func setDepartmentsText() {
        self.labelTitle.text = "Departments-Title".localized
        self.textViewContent.text = "Departments-Content".localized
    }
    
    public func setColorectalScanningText() {
        self.labelTitle.text = "Colorectal-Scanning-Title".localized
        let attrString:NSMutableAttributedString = "kolorektalni2".localized.bolded
        attrString.append("kolorektalni3".localized.normal)
        attrString.append("kolorektalni4".localized.bolded)
        attrString.append("kolorektalni5".localized.normal)
        attrString.append("kolorektalni6".localized.bolded)
        attrString.append("kolorektalni7".localized.normal)
        attrString.append("kolorektalni8".localized.bolded)
        attrString.append("kolorektalni9".localized.normal)
        attrString.append("kolorektalni10".localized.bolded)
        attrString.append("kolorektalni11".localized.normal)
        
        self.textViewContent.attributedText = attrString
        
    }
    
    public func setUterusScanningText() {
        self.labelTitle.text = "Uterus-Scanning-Title".localized
        
        let attrString:NSMutableAttributedString = "grlic2".localized.bolded
        attrString.append("grlic3".localized.normal)
        attrString.append("grlic4".localized.bolded)
        attrString.append("grlic5".localized.normal)
        attrString.append("grlic6".localized.bolded)
        attrString.append("grlic7".localized.normal)
        attrString.append("grlic8".localized.bolded)
        attrString.append("grlic9".localized.normal)
        attrString.append("grlic10".localized.bolded)
        attrString.append("grlic11".localized.normal)
        
        self.textViewContent.attributedText = attrString
        
    }
    
    public func setTeatScanningText() {
        self.labelTitle.text = "Teat-Scanning-Title".localized
        let attrString:NSMutableAttributedString = "dojka2".localized.bolded
        attrString.append("dojka3".localized.normal)
        attrString.append("dojka4".localized.bolded)
        attrString.append("dojka5".localized.normal)
        attrString.append("dojka6".localized.bolded)
        attrString.append("dojka7".localized.normal)
        attrString.append("dojka8".localized.bolded)
        attrString.append("dojka9".localized.normal)
        attrString.append("dojka10".localized.bolded)
        attrString.append("dojka11".localized.normal)
        
        self.textViewContent.attributedText = attrString
    }
    
    public func setPatientRightsText() {
        self.labelTitle.text = "Patient-Rights-Title".localized
        self.textViewContent.text = "Patient-Rights-Content".localized
    }
    
    public func setPatientObligationsText() {
        self.labelTitle.text = "Patient-Obligations-Title".localized
        self.textViewContent.text = "Patient-Obligations-Content".localized
    }
    
    //
    


}
