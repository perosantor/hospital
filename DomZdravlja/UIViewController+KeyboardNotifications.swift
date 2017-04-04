//
//  UIViewController+KeyboardNotifications.swift
//  DomZdravlja
//
//  Created by Petar Santor on 4/4/17.
//  Copyright © 2017 Petar Santor. All rights reserved.
//

import UIKit
import Foundation

extension UIViewController {
    
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWasShown(notification:)),
                                               name: NSNotification.Name.UIKeyboardWillShow,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillBeHidden(notification:)),
                                               name: NSNotification.Name.UIKeyboardWillHide,
                                               object: nil)
    }
    
    func deregisterFromKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self,
                                                  name: NSNotification.Name.UIKeyboardWillShow,
                                                  object: nil)
        NotificationCenter.default.removeObserver(self,
                                                  name: NSNotification.Name.UIKeyboardWillHide,
                                                  object: nil)
    }
    
    func keyboardWasShown(notification: NSNotification){
        //Need to calculate keyboard exact size
        if let scrollView = self.view.subviews[0] as? UIScrollView {
            
            scrollView.isScrollEnabled = true
            var info = notification.userInfo!
            let keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size
            let contentInsets : UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize!.height + 20, 0.0)
            
            scrollView.contentInset = contentInsets
            scrollView.scrollIndicatorInsets = contentInsets

            var aRect : CGRect = self.view.frame
            aRect.size.height -= keyboardSize!.height
            
            var activeField:UIView
            for view in self.view.subviews {
                if view.isFirstResponder {
                    activeField = view
                    if (!aRect.contains(activeField.frame.origin)){
                        scrollView.scrollRectToVisible(activeField.frame, animated: true)
                    }
                }
            }
        }
    }
    
    func keyboardWillBeHidden(notification: NSNotification){
        //Once keyboard disappears, restore original positions
        if let scrollView = self.view.subviews[0] as? UIScrollView {
            //var info = notification.userInfo!
            //let keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size
            let contentInsets : UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, 0, 0.0)
            scrollView.contentInset = contentInsets
            scrollView.scrollIndicatorInsets = contentInsets
            view.endEditing(true)
            //scrollView.isScrollEnabled = false
        }
    }

}
