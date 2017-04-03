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
    
    

}
