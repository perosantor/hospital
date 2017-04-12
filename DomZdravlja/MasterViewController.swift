//
//  MasterViewController.swift
//  DomZdravlja
//
//  Created by Petar Santor on 3/20/17.
//  Copyright © 2017 Petar Santor. All rights reserved.
//

import UIKit
import AVFoundation
import KYDrawerController

class MasterViewController: UIViewController {
    
    private lazy var mainOptionsViewController: MainOptionsViewController = {
        return self.instantiateViewController(storyboardId: "idMainOptionsViewController") as! MainOptionsViewController
    }()
    
    private lazy var newsViewController: NewsViewController = {
        return self.instantiateViewController(storyboardId: "idNewsViewController") as! NewsViewController
    } ()
    
    private lazy var appointmentFormViewController: AppointmentFormViewController = {
        return self.instantiateViewController(storyboardId: "idAppointmentFormViewController") as! AppointmentFormViewController
    } ()
    
    private lazy var insuranceCheckViewController: InsuranceCheckViewController = {
        return self.instantiateViewController(storyboardId: "idInsuranceCheckViewController") as! InsuranceCheckViewController
    } ()
    
    private lazy var bmiCalculatorViewController: BMICalculatorViewController = {
        return self.instantiateViewController(storyboardId: "idBMICalculatorViewController") as! BMICalculatorViewController
    } ()
    
    private lazy var socialViewController: SocialNetworksViewController = {
        return self.instantiateViewController(storyboardId: "idSocialNetworksViewController") as! SocialNetworksViewController
    } ()
    
    private lazy var contactViewController: ContactViewController = {
        return self.instantiateViewController(storyboardId: "idContactViewController") as! ContactViewController
    } ()
    
    private lazy var feedbackViewController: FeedbackViewController = {
        return self.instantiateViewController(storyboardId: "idFeedbackViewController") as! FeedbackViewController
    } ()
    
    private lazy var settingsViewController: SettingsViewController = {
        return self.instantiateViewController(storyboardId: "idSettingsViewController") as! SettingsViewController
    } ()
    
    private lazy var infoCenterViewController: InfoCenterViewController = {
        return self.instantiateViewController(storyboardId: "idInfoCenterViewController") as! InfoCenterViewController
    } ()
    
    private lazy var infoDetailsViewController: InfoDetailsViewController = {
        return self.instantiateViewController(storyboardId: "idInfoDetailsViewController") as! InfoDetailsViewController
    } ()
    
    private lazy var doctorsAdviceViewController: DoctorsAdviceViewController = {
        return self.instantiateViewController(storyboardId: "idDoctorsAdviceViewController") as! DoctorsAdviceViewController
    } ()
    
    private lazy var vaccinesViewController: VaccinesViewController = {
        return self.instantiateViewController(storyboardId: "idVaccinesViewController") as! VaccinesViewController
    } ()
    
    private lazy var vaccinesDetailsViewController: VaccinesDetailsViewController = {
        return self.instantiateViewController(storyboardId: "idVaccinesDetailsViewController") as! VaccinesDetailsViewController
    } ()

    
    private var overlayExplaner:ExplanationOverlayView?
    
    
    //MARK: - Outlets
    
    
    @IBOutlet weak var buttonDrawer: UIButton!
    
    @IBOutlet weak var buttonEmergencyCall: UIButton!
    
    @IBOutlet weak var imageViewBackground: UIImageView!
    
    @IBOutlet weak var imageViewLogo: UIImageView!
    
    
    //MARK: - Utilities
    
    
    private func instantiateViewController(storyboardId: String) -> UIViewController {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        let viewController = storyboard.instantiateViewController(withIdentifier: storyboardId)
        
        // Add View Controller as Child View Controller
        add(asChildViewController: viewController, type:nil)
        
        return viewController
    }
    
    public func load(viewWithType view:String) {
        remove(asChildViewController: self.childViewControllers.last!)
        
        if self.imageViewLogo.isHidden {
            self.imageViewLogo.isHidden = false
        }
        
        switch view {
        case Constants.View.Main:
            add(asChildViewController: mainOptionsViewController)
            break
        case Constants.View.News:
            add(asChildViewController: newsViewController)
            break
        case Constants.View.Scheduling:
            add(asChildViewController: appointmentFormViewController)
            break
        case Constants.View.CheckInsurance:
            add(asChildViewController: insuranceCheckViewController)
            break
        case Constants.View.BodyMass:
            add(asChildViewController: bmiCalculatorViewController)
            break
        case Constants.View.SocialNetworks:
            add(asChildViewController: socialViewController)
            break
        case Constants.View.Contact:
            add(asChildViewController: feedbackViewController)
            let contactVC = self.childViewControllers.last as! FeedbackViewController
            contactVC.setupContactAppearance()
            break
        case Constants.View.Feedback:
            add(asChildViewController: contactViewController)
            break
        case Constants.View.Settings:
            add(asChildViewController: settingsViewController)
            break
        case Constants.View.InfoCenter:
            add(asChildViewController: infoCenterViewController)
            break
        case Constants.View.MissionAndVision:
            add(asChildViewController: infoDetailsViewController, type:Constants.View.MissionAndVision)
            self.imageViewLogo.isHidden = true
            infoDetailsViewController.setMissionAndVisionText()
            break
        case Constants.View.Departments:
            add(asChildViewController: infoDetailsViewController, type:Constants.View.Departments)
            self.imageViewLogo.isHidden = true
            infoDetailsViewController.setDepartmentsText()
            break
        case Constants.View.ScreeningRectal:
            add(asChildViewController: infoDetailsViewController, type:Constants.View.ScreeningRectal)
            self.imageViewLogo.isHidden = true
            infoDetailsViewController.setColorectalScanningText()
            break
        case Constants.View.ScreeningUterus:
            add(asChildViewController: infoDetailsViewController, type:Constants.View.ScreeningUterus)
            self.imageViewLogo.isHidden = true
            infoDetailsViewController.setUterusScanningText()
            break
        case Constants.View.ScreeningTeat:
            add(asChildViewController: infoDetailsViewController, type:Constants.View.ScreeningTeat)
            self.imageViewLogo.isHidden = true
            infoDetailsViewController.setUterusScanningText()
            break
        case Constants.View.PatientRights:
            add(asChildViewController: infoDetailsViewController, type:Constants.View.PatientRights)
            self.imageViewLogo.isHidden = true
            infoDetailsViewController.setPatientRightsText()
            break
        case Constants.View.PatientDuties:
            add(asChildViewController: infoDetailsViewController, type:Constants.View.PatientDuties)
            self.imageViewLogo.isHidden = true
            infoDetailsViewController.setPatientObligationsText()
            break
        case Constants.View.DoctorsAdvice:
            add(asChildViewController: doctorsAdviceViewController)
            break
        case Constants.View.Vaccines:
            add(asChildViewController: vaccinesViewController)
            break
        default:
            print("error")
        }
        
    }
    
    
    private func add(asChildViewController viewController: UIViewController) {
        self.add(asChildViewController: viewController, type: nil)
    }
    
    public func addVaccineDetails(category:Int) {
        remove(asChildViewController: self.childViewControllers.last!)
        self.add(asChildViewController: vaccinesDetailsViewController, type: nil)
        vaccinesDetailsViewController.setAppearance(forCategory:category)
    }
    
    private func add(asChildViewController viewController: UIViewController, type:String?) {
        // Add Child View Controller
        addChildViewController(viewController)
        
        // Add Child View as Subview
        view.addSubview(viewController.view)
        
        // Configure Child View
        var offset:CGFloat = 100
        if type == nil {
            offset = 210
        }
        
        viewController.view.frame = CGRect(x: view.frame.origin.x,
                                           y: view.frame.origin.y + offset,
                                           width: view.frame.width,
                                           height: view.frame.height - offset)
        
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        //Notify Child View Controller
        viewController.didMove(toParentViewController: self)
        
        //currentChildViewController = viewController
    }
    
    private func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParentViewController: nil)
        
        // Remove Child View From Superview
        viewController.view.removeFromSuperview()
        
        // Notify Child View Controller
        viewController.removeFromParentViewController()
        
        viewController.clearScreen()
    }
    
    public func showExplanationOverlay() {
        
        self.overlayExplaner = ExplanationOverlayView(frame: CGRect.init(x: self.view.frame.origin.x,
                                                                    y: self.view.frame.origin.y,
                                                                    width: self.view.frame.size.width,
                                                                    height: self.view.frame.size.height))
        self.overlayExplaner?.dismissOverlayHandler = self.hideExplanationOverlay
        self.view.addSubview(self.overlayExplaner!)
    }
    
    func hideExplanationOverlay() {
        self.overlayExplaner?.removeFromSuperview()
    }
    
    
    private func setupView() {
        addBackgroundOverlay()
        add(asChildViewController: mainOptionsViewController, type:nil)
    }
    
    private func addBackgroundOverlay() {
        let overlay: UIView = UIView(frame: CGRect(x: self.imageViewBackground.frame.origin.x,
                                                   y: self.imageViewBackground.frame.origin.y - 20,
                                                   width: self.imageViewBackground.frame.size.width + 40,
                                                   height: self.imageViewBackground.frame.size.height))
        
        overlay.backgroundColor = Constants.Color.OverlayGrey
        self.imageViewBackground.addSubview(overlay)
    }

    
    //MARK: - Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        setupView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - Actions

    
    @IBAction func handleTapOnDrawerButton(_ sender: UIButton) {
        
        if ((self.parent as? KYDrawerController) != nil) {
            let drawer = self.parent as! KYDrawerController
            drawer.setDrawerState(KYDrawerController.DrawerState.opened, animated: true)
        }
        else {
            // obj is not a string array
        }
    }
    
    @IBAction func handleTapOnCallButton(_ sender: UIButton) {
        callNumber(phoneNumber: "381115194")
    }
    
    private func callNumber(phoneNumber:String) {
        
        if let phoneCallURL = URL(string: "tel://\(phoneNumber)") {
            
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                application.open(phoneCallURL, options: [:], completionHandler: nil)
            }
        }
    }

    

}

