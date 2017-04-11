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
        static let OverlayGrey = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.6)
    }
    
    struct Path {
        static let Documents = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        static let Tmp = NSTemporaryDirectory()
    }
    
    struct View {
        static let Main = "Главна страница"
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
        static let DoctorsAdvice = "Савети лекара"
    }
    
    struct Font {
        static let ButtonTitle = UIFont.systemFont(ofSize: 17, weight: UIFontWeightRegular)
    }
    
    struct Url {
        static let newsUrl = URL.init(string: "http://www.dzsabac.org.rs/android/droid.php")!
        static let appointmentUrl = URL.init(string: "http://www.dzsabac.org.rs/android/sender.php")!
        static let insuranceCheckUrl = URL.init(string: "http://89.216.105.89:3306/services/pzosabac.php")!
        static let patientProtectorUrl = URL.init(string: "http://www.dzsabac.org.rs/android/zastitniku.php")!
        static let patientLegalServiceUrl = URL.init(string: "http://www.dzsabac.org.rs/android/prijavi.php")!
        static let feedbackContactUrl = URL.init(string: "http://www.dzsabac.org.rs/android/kontakt.php")!
        static let askDoctorUrl = URL.init(string: "http://www.dzsabac.org.rs/android/pitaj.php")!
    }
    
    struct Messages {
        static let DefaultError = "Дошло је до грешке"
        static let Offline = "Потребно је да будете конектовани на интернет"
    }
    
    struct VaccinesCategory {
        static let First = 1
        static let Second = 2
    }
}
