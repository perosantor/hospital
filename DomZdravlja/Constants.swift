//
//  Constants.swift
//  DomZdravlja
//
//  Created by Petar Santor on 3/21/17.
//  Copyright © 2017 Petar Santor. All rights reserved.
//

import UIKit
import Foundation

struct Constants {
    struct Color {
        static let CustomRed = UIColor(colorLiteralRed: 188/255, green: 0/255, blue: 10/255, alpha: 1)
    }
    
    struct Path {
        static let Documents = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        static let Tmp = NSTemporaryDirectory()
    }
    
    struct DrawerButtonTitle {
        static let MainPage = "Главна страница"
        static let InfoCenter = "Инфо центар"
        static let News = "Вести"
        static let Scheduling = "Електронско заказивање"
        static let CheckInsurance = "Провера здравственог осигурања"
        static let BodyMass = "Индекс телесне масе"
        static let SocialNetworks = "Друштвене мреже"
        static let Vaccines = "Вакцинација"
        static let MissionAndVision = "Мисија и визија"
        
        static let Departments = "Службе"
        static let ScreeningRectal = "Колоректални скрининг"
        static let ScreeningUterus = "Скрининг грлића материце"
        static let ScreeningTeat = "Скрининг рака дојке"
        static let Feedback = "Замерке/Похвале"
        static let PatientRights = "Права пацијената"
        static let PatientDuties = "Дужности пацијената"
        static let Contact = "Контакт"
        static let Settings = "Подешавања"
    }
    
    struct Font {
        static let ButtonTitle = UIFont.systemFont(ofSize: 17, weight: UIFontWeightRegular)
    }
}
