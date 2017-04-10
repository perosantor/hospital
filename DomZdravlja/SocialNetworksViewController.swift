//
//  SocialNetworksViewController.swift
//  DomZdravlja
//
//  Created by Petar Santor on 4/6/17.
//  Copyright © 2017 Petar Santor. All rights reserved.
//

import UIKit

class SocialNetworksViewController: UIViewController {
    
    @IBOutlet weak var labelUpper: UILabel!
    @IBOutlet weak var labelLower: UILabel!
    
    @IBOutlet weak var buttonTwitter: SocialMediaButtonView!
    @IBOutlet weak var buttonYoutube: SocialMediaButtonView!
    @IBOutlet weak var buttonFacebook: SocialMediaButtonView!
    @IBOutlet weak var buttonLink: UIButton!
    
    var currentOption = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.clear
        
        self.buttonYoutube.loginHandler = self.tap
        self.buttonTwitter.loginHandler = self.tap
        self.buttonFacebook.loginHandler = self.tap
        
        self.buttonTwitter.setTwitterIcon()
        self.buttonTwitter.setSelected(gestureRecognizer: UIGestureRecognizer.init())
        self.labelUpper.text = NSLocalizedString("drustvene_mreze_opis", comment: "")
        
        self.buttonFacebook.setFacebookIcon()
        self.buttonYoutube.setYoutubeIcon()
        self.labelLower.text = NSLocalizedString("twitter", comment: "")
        
        Utilities.setSubtitleLabel(self.labelLower)
        Utilities.setSubtitleLabel(self.labelUpper)
        
        setLinkButtonAppearance(imageName: "twitter")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tap(tag:Int) -> Void {
        print(tag)
        switch tag {
        case 1:
            self.buttonFacebook.setUnselected()
            self.buttonYoutube.setUnselected()
            self.labelLower.text = NSLocalizedString("twitter", comment: "")
            setLinkButtonAppearance(imageName: "twitter")
            currentOption = 1
        case 2:
            self.buttonTwitter.setUnselected()
            self.buttonYoutube.setUnselected()
            self.labelLower.text = NSLocalizedString("facebook", comment: "")
            setLinkButtonAppearance(imageName: "facebook")
            currentOption = 2
        case 3:
            self.buttonFacebook.setUnselected()
            self.buttonTwitter.setUnselected()
            self.labelLower.text = NSLocalizedString("youtube", comment: "")
            setLinkButtonAppearance(imageName: "youtube")
            currentOption = 3
        default:
            self.buttonFacebook.setUnselected()
            self.buttonYoutube.setUnselected()
            self.buttonTwitter.setUnselected()
            self.labelLower.text = ""
        }
    }
    
    func setLinkButtonAppearance(imageName:String) {
        self.buttonLink.setBackgroundImage(UIImage.init(named: imageName), for: .normal)
    }
    
    @IBAction func handleTapOnLinkButton(_ sender: UIButton) {
        var link = URL.init(string: "https://twitter.com/dzsabac")!
        switch currentOption {
        case 1:
            link = URL.init(string: "https://twitter.com/#!/dzsabac")!
            break
        case 2:
            link = URL.init(string: "https://m.facebook.com/dzsabac")!
            break
        case 3:
            link = URL.init(string: "https://m.youtube.com/user/dzsabac")!
            break
        default:
            break
        }
        
        //UIApplication.shared.openURL(link)
        UIApplication.shared.open(link, options: [:], completionHandler: nil)
    }
    

}
