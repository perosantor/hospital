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
    
    private func instantiateViewController(storyboardId: String) -> UIViewController {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        let viewController = storyboard.instantiateViewController(withIdentifier: storyboardId)
        
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        return viewController
    }
    
    
    //MARK: - Outlets
    
    
    @IBOutlet weak var buttonDrawer: UIButton!
    
    @IBOutlet weak var buttonEmergencyCall: UIButton!
    
    @IBOutlet weak var imageViewBackground: UIImageView!
    
    
    //MARK: - Public methods
    
    
    public func load(viewWithType view:String) {
        self.remove(asChildViewController: currentChildViewController!)
        switch view {
        case Constants.View.Main:
            self.add(asChildViewController: mainOptionsViewController)
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
                                                y: view.frame.origin.y + 260,
                                                width: view.frame.width,
                                                height: view.frame.height - 260)
        
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
    
    
    //MARK: - Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    private func setupView() {
        self.addBackgroundOverlay()
        self.add(asChildViewController: mainOptionsViewController)
    }
    
    private func addBackgroundOverlay() {
        let overlay: UIView = UIView(frame: CGRect(x: self.imageViewBackground.frame.origin.x,
                                                   y: self.imageViewBackground.frame.origin.y - 20,
                                                   width: self.imageViewBackground.frame.size.width + 40,
                                                   height: self.imageViewBackground.frame.size.height))
        
        overlay.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.2)
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
    
    
    //MARK: - Utilities
    
    
    

}

