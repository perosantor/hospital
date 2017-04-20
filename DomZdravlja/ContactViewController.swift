//
//  ContactViewController.swift
//  DomZdravlja
//
//  Created by Petar Santor on 4/6/17.
//  Copyright © 2017 Petar Santor. All rights reserved.
//

import UIKit
import SVProgressHUD

class ContactViewController: UIViewController {
    
    
    // MARK: - Outlets
    
    
    @IBOutlet weak var inputViewName: InputTextFieldView!
    @IBOutlet weak var inputViewEmail: InputTextFieldView!
    @IBOutlet weak var inputViewContactReason: InputTextFieldView!
    @IBOutlet weak var inputViewMessage: InputTextView!

    @IBOutlet weak var buttonSendProtector: UIButton!
    @IBOutlet weak var buttonSendLegal: UIButton!
    
    
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

    public override func clearScreen() {
        self.inputViewName?.textField.text = ""
        self.inputViewEmail?.textField.text = ""
        self.inputViewContactReason?.textField.text = ""
        self.inputViewMessage?.textView.text = ""
    }
    

    // MARK: - Utilities
    
    
    func setup() {
        self.view.backgroundColor = UIColor.clear
        
        Utilities.setRedButton(self.buttonSendLegal, title: "ПОШАЉИ КОМЕНТАР ЗАШТИТНИКУ ПРАВА ПАЦИЈЕНАТА")
        Utilities.setRedButton(self.buttonSendProtector, title: "ПОШАЉИ КОМЕНТАР ПРАВНОЈ СЛУЖБИ")
        
        self.inputViewName.label.text = "Ваше име (обавезно)"
        self.inputViewEmail.label.text = "Ваша е-пошта (обавезно)"
        self.inputViewMessage.label.text = "Ваша порука"
        self.inputViewContactReason.label.text = "Разлог обраћања"
        self.inputViewContactReason.textField.text = "Пример добре праксе"
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
        var reason:String = ""
        if let entered = self.inputViewContactReason.textField.text {
            reason = entered
        }
        var message:String = ""
        if let entered = self.inputViewMessage.textView.text {
            message = entered
        }
        
        if name == "" || email == "" || reason == "" || message == "" {
            SVProgressHUD.showError(withStatus: "All fields must be filled".localized)
            return
        }
        
        let msg =  "Име: " + name + "\rЕ-пошта: " + email + "\rРазлог обраћања: " + reason + "\rПорука: " + message
        
        var url:URL? = nil
        switch sender.tag {
        case 1:
            url = Constants.Url.patientProtectorUrl
            break
        case 2:
            url = Constants.Url.patientLegalServiceUrl
            break
        default:
            break
        }
        
        if url != nil {
            SVProgressHUD.show()
            CommunicationService.sharedInstace.sendInquiry(forUrl: url!, withMessage: msg, completion: { (success, errorMessage) in
                if success {
                    SVProgressHUD.showInfo(withStatus: "Form sent successfully".localized)
                } else {
                    SVProgressHUD.showError(withStatus: errorMessage)
                }
            })
        }
        
    }

}
