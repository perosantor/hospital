//
//  FeedbackViewController.swift
//  DomZdravlja
//
//  Created by Petar Santor on 4/8/17.
//  Copyright © 2017 Petar Santor. All rights reserved.
//

import UIKit
import SVProgressHUD

class FeedbackViewController: UIViewController {

    
    // MARK: - Outlets
    
    
    @IBOutlet weak var inputViewName: InputTextFieldView!
    @IBOutlet weak var inputViewEmail: InputTextFieldView!
    @IBOutlet weak var inputViewMessage: InputTextView!
    
    @IBOutlet weak var buttonSend: UIButton!
    @IBOutlet weak var labelAdress: UILabel!
    
    var url:URL = Constants.Url.feedbackContactUrl
    
    // MARK: - Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        self.hideKeyboardWhenTappedAround()
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
        
        Utilities.setRedButton(self.buttonSend, title: "ПОШАЉИ")
        
        
        self.inputViewName.label.text = "Ваше име (обавезно)"
        self.inputViewEmail.label.text = "Ваша е-пошта (обавезно)"
        self.inputViewMessage.label.text = "Ваша порука"
        
        self.labelAdress.text = "Hospital-adress".localized
        Utilities.setSubtitleLabel(self.labelAdress)
    }
    
    public func setupAskDoctorAppearance() {
        self.labelAdress.text = "Expect-Answer".localized
        url = Constants.Url.askDoctorUrl
    }
    
    public func setupContactAppearance() {
        self.labelAdress.text = "Hospital-adress".localized
        url = Constants.Url.feedbackContactUrl
    }
    
    // MARK: - Actions
    
    
    @IBAction func handleTapOnSendButton(_ sender: UIButton) {
        
        var name:String = ""
        if let entered = self.inputViewName.textField.text {
            name = entered
        }
        var email:String = ""
        if let entered = self.inputViewEmail.textField.text {
            email = entered
        }
        
        var message:String = ""
        if let entered = self.inputViewMessage.textView.text {
            message = entered
        }
        
        if name == "" || email == "" || message == "" {
            SVProgressHUD.showError(withStatus: "All fields must be filled".localized)
            return
        }
        
        let msg =  "Име: " + name + "\rЕ-пошта: " + email + "\rПорука: " + message
        
        SVProgressHUD.show()
        CommunicationService.sharedInstace.sendInquiry(forUrl: self.url, withMessage: msg) { (success, errorMessage) in
            if success {
                SVProgressHUD.showInfo(withStatus: "Form sent successfully".localized)
            } else {
                SVProgressHUD.showError(withStatus: errorMessage)
            }

        }

    }

}
