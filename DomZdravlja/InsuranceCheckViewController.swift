//
//  InsuranceCheckViewController.swift
//  DomZdravlja
//
//  Created by Petar Santor on 4/5/17.
//  Copyright © 2017 Petar Santor. All rights reserved.
//

import UIKit
import SVProgressHUD

class InsuranceCheckViewController: UIViewController {

    
    // MARK: - Outlets
    
    
    @IBOutlet weak var inputFieldLBO: InputTextFieldView!
    @IBOutlet weak var inputFieldZK: InputTextFieldView!
    @IBOutlet weak var buttonCheck: UIButton!
    
    @IBOutlet var labels: [UILabel]!
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelSurname: UILabel!
    @IBOutlet weak var labelExpireDate: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    // MARK: - Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setup()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - Utilities
    
    
    func setup() {
        self.view.backgroundColor = UIColor.clear
        
        self.inputFieldLBO.label.text = "ЛБО (11 цифара)"
        self.inputFieldZK.label.text = "ЗК (11 цифара)"
        
        Utilities.setRedButton(self.buttonCheck, title: "ПРОВЕРИ ОСИГУРАЊЕ")
        
        for label in labels {
            
            Utilities.setSubtitleLabel(label)
            
            switch label.tag {
            case 1:
                label.text = "Име осигураника:"
                break
            case 3:
                label.text = "Презиме осигураника:"
                break
            case 5:
                label.text = "Датум до кад важи осигурање:"
                break
            default:
                label.text = ""
                break
            }
        }
    }
    
    
    // MARK: - Utilities
    

    
    // MARK: - Actions

   
    @IBAction func handleTaoOnCheckButton(_ sender: UIButton) {
        
        SVProgressHUD.show()
        CommunicationService.sharedInstace.checkInsurance(lbo: "") { (array, errorMessage) in
            if errorMessage != nil {
                SVProgressHUD.showError(withStatus: errorMessage)
            } else {
                SVProgressHUD.dismiss()
                if array?.count == 3 {
                    self.labelName.text = array?[0]
                    self.labelSurname.text = array?[1]
                    self.labelExpireDate.text = array?[2]
                    let bottomOffset = CGPoint(x: 0,
                                               y: self.scrollView.contentSize.height - self.scrollView.bounds.size.height)
                    self.scrollView.setContentOffset(bottomOffset, animated: true)
                }
            }
        }
    }
    
}
