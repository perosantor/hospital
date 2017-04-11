//
//  VaccinesDetailsViewController.swift
//  DomZdravlja
//
//  Created by Petar Santor on 4/11/17.
//  Copyright © 2017 Petar Santor. All rights reserved.
//

import UIKit

class VaccinesDetailsViewController: UIViewController {

    var category:Int = 0
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var labelName1: UILabel!
    @IBOutlet weak var labelName2: UILabel!
    @IBOutlet weak var labelName3: UILabel!
    @IBOutlet weak var labelName4: UILabel!
    
    @IBOutlet weak var labelDate1: UILabel!
    @IBOutlet weak var labelDate2: UILabel!
    @IBOutlet weak var labelDate3: UILabel!
    @IBOutlet weak var labelDate4: UILabel!
    
    @IBOutlet weak var labelContent: UILabel!
    
    @IBOutlet weak var buttonBack: UIButton!
    
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
    }
    
    
    // MARK: - Actions

    @IBAction func handleTapOnBackButton(_ sender: UIButton) {
        
    }
    
    
    
}
