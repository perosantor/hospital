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

    
    // MARK: - Outlets

    
    @IBOutlet weak var inputViewHeight: InputTextFieldView!
    
    @IBOutlet weak var inputViewWeight: InputTextFieldView!
    
    @IBOutlet weak var labelResult: UILabel!
    
    @IBOutlet weak var buttonCalculate: UIButton!
    
    @IBOutlet weak var buttonClear: UIButton!
    
    
    // MARK: - Lifecycle
    
    
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
    
    
    // MARK: - Utilities
    
    
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
    
    public override func clearScreen() {
        self.inputViewHeight.textField.text = ""
        self.inputViewWeight.textField.text = ""
        self.labelResult.text = ""
    }

    
    // MARK: - Actions
    
    
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
        
        let bmi = round(weight / (height*height*(1/10000)))
        
        var level:String
        switch bmi {
            case (0...14): level = "која је тешко потхрањена"
            case (14...18): level = "која је потхрањена"
            case (18...21): level = "нормалне тежине"
            case (21...23): level = "идеалне тежине"
            case (23...25): level = "нормалне тежине"
            case (25...30): level = "која је гојазна"
            case (30...100): level = "која је тешко гојазна"
        default:
            level = ""
            SVProgressHUD.showError(withStatus: "Проверите унете податке")
            return
        }
        
        let min = round( 18.5 * height * height / 1000 ) / 10
        let max = round( 25.0 * height * height / 1000 ) / 10
        let idealWeight = round( 10 * ( min + max ) / 2 ) / 10
        
        let idealWeightDelta = abs(round(100 * (weight - idealWeight) / idealWeight))
        let suggestedWeight = idealWeight
        
        self.labelResult.text = "Ваш индекс телесне масе је \(bmi) \rпо коме сте ви особа \(level). \rВаша идеална тежина је \(idealWeight) килограма од које одступате \(idealWeightDelta)%. \rВаша препоручена тежина је \(suggestedWeight) килограма.\r"
    }
    
    @IBAction func handleTapOnClearButton(_ sender: UIButton) {
        clearScreen()
    }
    

   
}
