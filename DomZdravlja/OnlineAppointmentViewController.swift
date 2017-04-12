//
//  OnlineAppointmentViewController.swift
//  DomZdravlja
//
//  Created by Petar Santor on 4/12/17.
//  Copyright © 2017 Petar Santor. All rights reserved.
//

import UIKit

class OnlineAppointmentViewController: UIViewController {

    
    // MARK: - Outlets
    
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var buttonSchedule: UIButton!
    
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
    @IBOutlet weak var buttonCheckAvailability: UIButton!
    
    
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
        
        self.label1.text = "Преко апликације Дома здравља Шабац можете да закажете преглед и електронским путем. На овај начин може да се закаже и термин за исписивање терапије. Након што исправно испуните наш формулар, бићете обавештени о прецизном термину од стране наших служби."
        Utilities.setSubtitleLabel(self.label1)
        self.label2.text = "Да бисте заказали преглед притисните дугме испод"
        Utilities.setТitleLabel(self.label2)
        self.label3.text = "Коришћењем националног система за електронску здравствену евиденцију Мој Доктор можете проверити доступност својих лекара."
        Utilities.setSubtitleLabel(self.label3)
        self.label4.text = "Проверите доступност служби и доктора"
        Utilities.setSubtitleLabel(self.label4)
        
        Utilities.setRedButton(self.buttonSchedule, title: "Закажи преглед")
        Utilities.setInfoSubtitleButton(self.buttonCheckAvailability, title:"https://www.mojdoktor.gov.rs/map")
    }
    
    @IBAction func handleTapOnScheduleButton(_ sender: Any) {
        if ((self.parent as? MasterViewController) != nil ) {
            let master = self.parent as? MasterViewController
            master?.load(viewWithType: Constants.View.ScheduleAppointment)
        }
    }
    
    @IBAction func handleTapOnCheckAvailabilityButton(_ sender: Any) {
        UIApplication.shared.open((URL(string: "https://www.mojdoktor.gov.rs/map")!), options: [:], completionHandler: nil)
    }
    
    
}
