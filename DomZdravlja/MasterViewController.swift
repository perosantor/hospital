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

    private var currentChildViewController : UIViewController?
    
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

    
    private var overlayExplaner:ExplanationOverlayView?
    
    private func instantiateViewController(storyboardId: String) -> UIViewController {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        let viewController = storyboard.instantiateViewController(withIdentifier: storyboardId)
        
        // Add View Controller as Child View Controller
        add(asChildViewController: viewController)
        
        return viewController
    }
    
    
    //MARK: - Outlets
    
    
    @IBOutlet weak var buttonDrawer: UIButton!
    
    @IBOutlet weak var buttonEmergencyCall: UIButton!
    
    @IBOutlet weak var imageViewBackground: UIImageView!
    
    
    //MARK: - Public methods
    
    
    public func load(viewWithType view:String) {
        remove(asChildViewController: currentChildViewController!)
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
        default:
            print("error")
        }
        
    }
    
    
    //MARK: - Utilities
    
    
    private func add(asChildViewController viewController: UIViewController) {
        // Add Child View Controller
        addChildViewController(viewController)
        
        // Add Child View as Subview
        view.addSubview(viewController.view)
        
        // Configure Child View
        viewController.view.frame = CGRect(x: view.frame.origin.x,
                                           y: view.frame.origin.y + 210,
                                           width: view.frame.width,
                                           height: view.frame.height - 210)
        
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Notify Child View Controller
        viewController.didMove(toParentViewController: self)
        
        currentChildViewController = viewController
    }
    
    private func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParentViewController: nil)
        
        // Remove Child View From Superview
        viewController.view.removeFromSuperview()
        
        // Notify Child View Controller
        viewController.removeFromParentViewController()
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
    
    //MARK: - Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        setupView()
    }
    
    private func setupView() {
        addBackgroundOverlay()
        add(asChildViewController: mainOptionsViewController)
    }
    
    private func addBackgroundOverlay() {
        let overlay: UIView = UIView(frame: CGRect(x: self.imageViewBackground.frame.origin.x,
                                                   y: self.imageViewBackground.frame.origin.y - 20,
                                                   width: self.imageViewBackground.frame.size.width + 40,
                                                   height: self.imageViewBackground.frame.size.height))
        
        overlay.backgroundColor = Constants.Color.OverlayGrey
        self.imageViewBackground.addSubview(overlay)
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

