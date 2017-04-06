//
//  SocialMediaButtonView.swift
//  DomZdravlja
//
//  Created by Petar Santor on 4/6/17.
//  Copyright © 2017 Petar Santor. All rights reserved.
//

import UIKit

class SocialMediaButtonView: CustomView {

    override func setup() {
        super.nibName = "SocialMediaButtonView"
        super.setup()
        
        setUnselected()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SocialMediaButtonView.setSelected(gestureRecognizer:)))
        //tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
        self.view.backgroundColor = UIColor.clear
        self.backgroundColor = UIColor.clear
    }


    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var bottomBorderView: UIView!
  
    public var loginHandler:((_ tag: Int) -> Void)?
    
    public func setTwitterIcon() {
        self.imageView.image = UIImage.init(named: "twitter")
    }
    
    public func setFacebookIcon() {
        self.imageView.image = UIImage.init(named: "facebook")
    }
    
    public func setYoutubeIcon() {
        self.imageView.image = UIImage.init(named: "youtube")
    }
    
    func setSelected(gestureRecognizer: UIGestureRecognizer) {
        self.bottomBorderView.backgroundColor = Constants.Color.CustomRed
        if (loginHandler == nil) {
            return
        } else {
            loginHandler!(self.tag)
        }
    }
    
    public func setUnselected() {
        self.bottomBorderView.backgroundColor = UIColor.clear
    }
    
    
    
}
