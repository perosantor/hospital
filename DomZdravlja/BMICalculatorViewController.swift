//
//  BMICalculatorViewController.swift
//  DomZdravlja
//
//  Created by Petar Santor on 4/6/17.
//  Copyright © 2017 Petar Santor. All rights reserved.
//

import UIKit
import SVProgressHUD

class BMICalculatorViewController: UIViewController {

    
    //

    
    @IBOutlet weak var inputViewHeight: InputTextFieldView!
    
    @IBOutlet weak var inputViewWeight: InputTextFieldView!
    
    @IBOutlet weak var labelResult: UILabel!
    
    @IBOutlet weak var buttonCalculate: UIButton!
    
    @IBOutlet weak var buttonClear: UIButton!
    
    
    //
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
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
    
    
    //
    
    
    func setup() {
        self.view.backgroundColor = UIColor.clear
        
        self.inputViewWeight.label.text = "Тежина (кг)"
        self.inputViewHeight.label.text = "Висина (цм)"
        
        self.inputViewHeight.textField.keyboardType = .numberPad
        self.inputViewWeight.textField.keyboardType = .numberPad
        
        Utilities.setRedButton(self.buttonCalculate, title: "ИЗРАЧУНАЈ")
        Utilities.setRedButton(self.buttonClear, title: "ИЗБРИШИ")
        
        Utilities.setSubtitleLabel(labelResult)
        self.labelResult.text = ""
        
    }

    
    //
    
    
    @IBAction func handleTapOnCalculateButton(_ sender: UIButton) {
        
        var height:Double = 0
        if let enteredHeight = Double(self.inputViewHeight.textField.text!) {
            height = enteredHeight
        }
        var weight:Double = 0
        if let enteredWeight = Double(self.inputViewWeight.textField.text!) {
            weight = enteredWeight
        }
        if height == 0 || weight == 0 {
            SVProgressHUD.showError(withStatus: "Оба поља морају бити попуњена")
            return
        }
        
        var bmi:Double = 0
        var level = ""
        var idealWeight = 0
        var idealWeightDelta = 0
        var suggestedWeight = 0
        
        bmi = round(100000 * weight / height / height) / 10
        
        self.labelResult.text = "Ваш индекс телесне масе је \(bmi) \rпо коме сте ви особа \(level). \rВаша идеална тежина је \(idealWeight) килограма од које одступате \(idealWeightDelta). \rВаша препоручена тежина је \(suggestedWeight) килограма.\r"
    }
    
    @IBAction func handleTapOnClearButton(_ sender: UIButton) {
        self.inputViewHeight.textField.text = ""
        self.inputViewWeight.textField.text = ""
        self.labelResult.text = ""
    }

   
}
