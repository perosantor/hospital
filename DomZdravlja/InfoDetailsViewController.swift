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
        self.labelTitle.text = "Mission-And-Vision-Title".localizedWithNewLine
        
        let attrString:NSMutableAttributedString = "mission1".localizedWithNewLine.bolded
        attrString.append("mission2".localizedWithNewLine.normal)
        attrString.append("vision1".localizedWithNewLine.bolded)
        attrString.append("vision2".localizedWithNewLine.normal)
        
        self.textViewContent.attributedText = attrString

    }
    
    public func setDepartmentsText() {
        self.labelTitle.text = "Departments-Title".localizedWithNewLine
        
        let attrString:NSMutableAttributedString = "departments1".localizedWithNewLine.bolded
        attrString.append("departments2".localizedWithNewLine.bolded)
        attrString.append("departments3".localizedWithNewLine.bolded)
        attrString.append("departments4".localizedWithNewLine.bolded)
        attrString.append("departments5".localizedWithNewLine.bolded)
        attrString.append("departments6".localizedWithNewLine.bolded)
        attrString.append("departments7".localizedWithNewLine.bolded)
        attrString.append("departments8".localizedWithNewLine.bolded)
        attrString.append("departments9".localizedWithNewLine.bolded)
        
        self.textViewContent.attributedText = attrString
    }
    
    public func setColorectalScanningText() {
        self.labelTitle.text = "Colorectal-Scanning-Title".localizedWithNewLine
        let attrString:NSMutableAttributedString = "kolorektalni2".localizedWithNewLine.bolded
        attrString.append("kolorektalni3".localizedWithNewLine.normal)
        attrString.append("kolorektalni4".localizedWithNewLine.bolded)
        attrString.append("kolorektalni5".localizedWithNewLine.normal)
        attrString.append("kolorektalni6".localizedWithNewLine.bolded)
        attrString.append("kolorektalni7".localizedWithNewLine.normal)
        attrString.append("kolorektalni8".localizedWithNewLine.bolded)
        attrString.append("kolorektalni9".localizedWithNewLine.normal)
        attrString.append("kolorektalni10".localizedWithNewLine.bolded)
        attrString.append("kolorektalni11".localizedWithNewLine.normal)
        
        self.textViewContent.attributedText = attrString
        
    }
    
    public func setUterusScanningText() {
        self.labelTitle.text = "Uterus-Scanning-Title".localizedWithNewLine
        
        let attrString:NSMutableAttributedString = "grlic2".localizedWithNewLine.bolded
        attrString.append("grlic3".localizedWithNewLine.normal)
        attrString.append("grlic4".localizedWithNewLine.bolded)
        attrString.append("grlic5".localizedWithNewLine.normal)
        attrString.append("grlic6".localizedWithNewLine.bolded)
        attrString.append("grlic7".localizedWithNewLine.normal)
        attrString.append("grlic8".localizedWithNewLine.bolded)
        attrString.append("grlic9".localizedWithNewLine.normal)
        attrString.append("grlic10".localizedWithNewLine.bolded)
        attrString.append("grlic11".localizedWithNewLine.normal)
        
        self.textViewContent.attributedText = attrString
        
    }
    
    public func setTeatScanningText() {
        self.labelTitle.text = "Teat-Scanning-Title".localizedWithNewLine
        
        let attrString:NSMutableAttributedString = "dojka2".localizedWithNewLine.bolded
        attrString.append("dojka3".localizedWithNewLine.normal)
        attrString.append("dojka4".localizedWithNewLine.bolded)
        attrString.append("dojka5".localizedWithNewLine.normal)
        attrString.append("dojka6".localizedWithNewLine.bolded)
        attrString.append("dojka7".localizedWithNewLine.normal)
        attrString.append("dojka8".localizedWithNewLine.bolded)
        attrString.append("dojka9".localizedWithNewLine.normal)
        attrString.append("dojka10".localizedWithNewLine.bolded)
        attrString.append("dojka11".localizedWithNewLine.normal)
        
        self.textViewContent.attributedText = attrString
    }
    
    public func setPatientRightsText() {
        self.labelTitle.text = "Patient-Rights-Title".localizedWithNewLine
        
        let attrString:NSMutableAttributedString = "povelja1".localizedWithNewLine.bolded
        attrString.append("povelja2".localizedWithNewLine.bolded)
        attrString.append("povelja3".localizedWithNewLine.bolded)
        attrString.append("povelja4".localizedWithNewLine.bolded)
        attrString.append("povelja5".localizedWithNewLine.bolded)
        attrString.append("povelja6".localizedWithNewLine.bolded)
        attrString.append("povelja7".localizedWithNewLine.bolded)
        attrString.append("povelja8".localizedWithNewLine.bolded)
        attrString.append("povelja9".localizedWithNewLine.bolded)
        attrString.append("povelja10".localizedWithNewLine.bolded)
        attrString.append("povelja11".localizedWithNewLine.bolded)
        attrString.append("povelja12".localizedWithNewLine.bolded)
        attrString.append("povelja13".localizedWithNewLine.bolded)
        attrString.append("povelja14".localizedWithNewLine.bolded)
        attrString.append("povelja15".localizedWithNewLine.bolded)
        attrString.append("povelja16".localizedWithNewLine.bolded)
        attrString.append("povelja17".localizedWithNewLine.bolded)
        attrString.append("povelja18".localizedWithNewLine.bolded)
        attrString.append("povelja19".localizedWithNewLine.bolded)
        
        self.textViewContent.attributedText = attrString
    }
    
    public func setPatientObligationsText() {
        self.labelTitle.text = "Patient-Obligations-Title".localizedWithNewLine
        
        let attrString:NSMutableAttributedString = "duznost1".localizedWithNewLine.bolded
        attrString.append("duznost2".localizedWithNewLine.bolded)
        attrString.append("duznost3".localizedWithNewLine.bolded)
        
        self.textViewContent.attributedText = attrString
    }
    
    //
    


}
