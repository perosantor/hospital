//
//  InsuranceCheckViewController.swift
//  DomZdravlja
//
//  Created by Petar Santor on 4/5/17.
//  Copyright © 2017 Petar Santor. All rights reserved.
//

import UIKit

class InsuranceCheckViewController: UIViewController {

    
    // MARK: - Outlets
    
    
    @IBOutlet weak var inputFieldLBO: InputTextFieldView!
    @IBOutlet weak var inputFieldZK: InputTextFieldView!
    @IBOutlet weak var buttonCheck: UIButton!
    
    @IBOutlet var labels: [UILabel]!
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelSurname: UILabel!
    @IBOutlet weak var labelExpireDate: UILabel!
    
    
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
            
            label.textColor = UIColor.white
            label.font = UIFont.systemFont(ofSize: 16)
            
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
