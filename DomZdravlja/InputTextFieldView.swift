//
//  InputTextFieldView.swift
//  DomZdravlja
//
//  Created by Petar Santor on 4/3/17.
//  Copyright © 2017 Petar Santor. All rights reserved.
//

import UIKit

class InputTextFieldView: UIView {

    let nibName:String = "InputTextFieldView"
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
        
        setupAppearance()
        
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    func setupAppearance() {
        self.label.backgroundColor = UIColor.clear
        self.label.font = UIFont.systemFont(ofSize: 12)
        self.label.textColor = UIColor.white
        
        self.textField.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        
        self.view.backgroundColor = UIColor.clear
        self.backgroundColor = UIColor.clear
    }
}
