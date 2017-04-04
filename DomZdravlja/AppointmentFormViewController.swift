//
//  AppointmentFormViewController.swift
//  DomZdravlja
//
//  Created by Petar Santor on 4/3/17.
//  Copyright © 2017 Petar Santor. All rights reserved.
//

import UIKit

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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        
        self.buttonSend.setTitleColor(UIColor.white, for: .normal)
        self.buttonSend.setTitle("ПОШАЉИ", for: .normal)
        self.buttonSend.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        self.buttonSend.backgroundColor = Constants.Color.CustomRed
        
        self.inputFieldName?.label.text = "Име и презиме пацијента:"
        self.inputFieldEmail?.label.text = "И-мејл адреса:"
        self.inputFieldPhone?.label.text = "Број телефона:"
        self.inputFieldID?.label.text = "ЈМБГ:"
        self.inputFieldDoctor?.label.text = "Име и презиме изабраног лекара:"
        self.inputFieldTime?.label.text = "Оквирно време и датум прегледа:"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func set(button: UIButton, selected:Bool) {
        if selected {
            button.setImage(UIImage.init(named: "radio_button_selected"), for: .normal)
        } else {
            button.setImage(UIImage.init(named: "radio_button_unselected"), for: .normal)
        }
    }
    
    @IBAction func handleTapOnAppointmentButton(_ sender: UIButton) {
        set(button: self.radioButtonAppointment, selected: true)
        set(button: self.radioButtonTherapy, selected: false)
    }
    
    @IBAction func handleTapOnTherapyButton(_ sender: UIButton) {
        set(button: self.radioButtonAppointment, selected: false)
        set(button: self.radioButtonTherapy, selected: true)
    }
    
    @IBAction func handleTapOnSendButton(_ sender: UIButton) {
        
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registerForKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        deregisterFromKeyboardNotifications()
    }

    func dismissKeyboard() {
        for view in self.view.subviews {
            if view.isFirstResponder {
                view.resignFirstResponder()
            }
        }
//        self.textFieldEmail.resignFirstResponder()
//        self.textFieldPassword.resignFirstResponder()
    }
    
    func registerForKeyboardNotifications(){
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWasShown(notification:)),
                                               name: NSNotification.Name.UIKeyboardWillShow,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillBeHidden(notification:)),
                                               name: NSNotification.Name.UIKeyboardWillHide,
                                               object: nil)
    }
    
    func deregisterFromKeyboardNotifications(){
        NotificationCenter.default.removeObserver(self,
                                                  name: NSNotification.Name.UIKeyboardWillShow,
                                                  object: nil)
        NotificationCenter.default.removeObserver(self,
                                                  name: NSNotification.Name.UIKeyboardWillHide,
                                                  object: nil)
    }

    
    //MARK: - Notifications
    
    
    func keyboardWasShown(notification: NSNotification){
        //Need to calculate keyboard exact size
        self.scrollView.isScrollEnabled = true
        var info = notification.userInfo!
        let keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size
        let contentInsets : UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize!.height + 20, 0.0)
        
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
        
        var aRect : CGRect = self.view.frame
        aRect.size.height -= keyboardSize!.height
        
        var activeField:UIView
        for view in self.view.subviews {
            if view.isFirstResponder {
                activeField = view
                if (!aRect.contains(activeField.frame.origin)){
                    self.scrollView.scrollRectToVisible(activeField.frame, animated: true)
                }
            }
        }
    }
    
    func keyboardWillBeHidden(notification: NSNotification){
        //Once keyboard disappears, restore original positions
        var info = notification.userInfo!
        let keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size
        let contentInsets : UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, -keyboardSize!.height - 20, 0.0)
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
        self.view.endEditing(true)
        self.scrollView.isScrollEnabled = false
    }
    
    

}
