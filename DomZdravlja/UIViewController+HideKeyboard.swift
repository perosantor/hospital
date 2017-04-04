//
//  UIViewController+HideKeyboard.swift
//  DomZdravlja
//
//  Created by Petar Santor on 4/4/17.
//  Copyright © 2017 Petar Santor. All rights reserved.
//

import UIKit
import Foundation

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
