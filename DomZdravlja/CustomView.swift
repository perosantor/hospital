//
//  CustomView.swift
//  DomZdravlja
//
//  Created by Petar Santor on 4/6/17.
//  Copyright © 2017 Petar Santor. All rights reserved.
//

import UIKit

class CustomView: UIView {

    var nibName:String = "CustomView"
    var view: UIView!
    //public var loginHandler:((username: String, password: String) -> Void)?
    //if(loginHandler == nil) { print(„No loginHandler defined“) return } loginHandler!( username: usernameTextfield.text! password: passwordTextfield.text!) }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        self.view = UINib(nibName: self.nibName, bundle: Bundle(for: type(of: self))).instantiate(withOwner: self, options: nil)[0] as? UIView
        
        self.view.frame = bounds
        self.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(self.view)

    }

}
