//
//  AppointmentFormViewController.swift
//  DomZdravlja
//
//  Created by Petar Santor on 4/3/17.
//  Copyright © 2017 Petar Santor. All rights reserved.
//

import UIKit
import SVProgressHUD

class AppointmentFormViewController: UIViewController {

    @IBOutlet weak var inputFieldName: InputTextFieldView!
    @IBOutlet weak var inputFieldEmail: InputTextFieldView!
    @IBOutlet weak var inputFieldPhone: InputTextFieldView!
    @IBOutlet weak var inputFieldID: InputTextFieldView!
    @IBOutlet weak var inputFieldDoctor: InputTextFieldView!
    @IBOutlet weak var inputFieldTime: InputTextFieldView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var buttonSend: UIButton!
    @IBOutlet weak var radioButtonAppointment: UIButton!
    @IBOutlet weak var radioButtonTherapy: UIButton!
    @IBOutlet weak var labelTypeOfContact: UILabel!
    
    var therapySelected:Bool = false
    
    
    //MARK: Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.hideKeyboardWhenTappedAround()
        setup()
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

    
    //MARK: - Utilities
    
    
    func setup() {
        self.view.backgroundColor = UIColor.clear
        
        self.radioButtonAppointment.setTitle("Испис терапије", for: .normal)
        self.radioButtonTherapy.setTitle("Преглед", for: .normal)
        
        self.radioButtonAppointment.setTitleColor(UIColor.white, for: .normal)
        self.radioButtonTherapy.setTitleColor(UIColor.white, for: .normal)
        self.radioButtonAppointment.imageView?.contentMode = .scaleAspectFit
        self.radioButtonTherapy.imageView?.contentMode = .scaleAspectFit
        
        set(button: self.radioButtonAppointment, selected: true)
        set(button: self.radioButtonTherapy, selected: false)
        self.therapySelected = false
        
        self.labelTypeOfContact.text = "Тип контакта"
        self.labelTypeOfContact.textColor = UIColor.white
        
        Utilities.setRedButton(self.buttonSend, title: "ПОШАЉИ")
        
        self.inputFieldName?.label.text = "Име и презиме пацијента:"
        self.inputFieldEmail?.label.text = "И-мејл адреса:"
        self.inputFieldPhone?.label.text = "Број телефона:"
        self.inputFieldID?.label.text = "ЈМБГ:"
        self.inputFieldDoctor?.label.text = "Име и презиме изабраног лекара:"
        self.inputFieldTime?.label.text = "Оквирно време и датум прегледа:"
    }
    
    func set(button: UIButton, selected:Bool) {
        if selected {
            button.setImage(UIImage.init(named: "radio_button_selected"), for: .normal)
        } else {
            button.setImage(UIImage.init(named: "radio_button_unselected"), for: .normal)
        }
    }
    
    
    //MARK: Actions
    
    
    @IBAction func handleTapOnAppointmentButton(_ sender: UIButton) {
        set(button: self.radioButtonAppointment, selected: true)
        set(button: self.radioButtonTherapy, selected: false)
    }
    
    @IBAction func handleTapOnTherapyButton(_ sender: UIButton) {
        set(button: self.radioButtonAppointment, selected: false)
        set(button: self.radioButtonTherapy, selected: true)
    }
    
    @IBAction func handleTapOnSendButton(_ sender: UIButton) {
        if (self.inputFieldName.isEmpty ||
            self.inputFieldPhone.isEmpty ||
            self.inputFieldID.isEmpty ||
            self.inputFieldDoctor.isEmpty ||
            self.inputFieldTime.isEmpty ||
            self.inputFieldEmail.isEmpty) {
            SVProgressHUD.showError(withStatus: "Сва поља морају бити попуњена")
            return
        }
        if !Utilities.isValidIDFormat(string: self.inputFieldID.textField.text) {
            SVProgressHUD.showError(withStatus: "ЈМБГ поље мора бити исправно попуњено")
            return
        }
        

        let name = self.inputFieldName.textField.text!
        let phone = self.inputFieldPhone.textField.text!
        let id = self.inputFieldID.textField.text!
        let doctor = self.inputFieldDoctor.textField.text!
        let time = self.inputFieldTime.textField.text!
        let email = self.inputFieldEmail.textField.text!
        
        SVProgressHUD.show()
        CommunicationService.sharedInstace.registerAppointment(name: name, phone: phone, id: id, doctor: doctor, time: time, email: email, therapyAppointment: therapySelected) { (response, errorMessage) in
            print("\(response)")
        }
        
        
    }
}
