//
//  ContactViewController.swift
//  DomZdravlja
//
//  Created by Petar Santor on 4/6/17.
//  Copyright © 2017 Petar Santor. All rights reserved.
//

import UIKit

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
    
    
    @IBAction func handleTapOnSendProtector(_ sender: UIButton) {
        
    }
    
    @IBAction func handleTapOnSendLegal(_ sender: UIButton) {
        
    }
    

}
