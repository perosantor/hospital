//
//  NewsDetailsViewController.swift
//  DomZdravlja
//
//  Created by Petar Santor on 3/31/17.
//  Copyright © 2017 Petar Santor. All rights reserved.
//

import UIKit
import SDWebImage

class NewsDetailsViewController: UIViewController {

    public var selectedNews: News? = nil
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var buttonBack: UIButton!
    
    @IBOutlet weak var imageViewBackground: UIImageView!
    
    @IBOutlet weak var imageViewTop: UIImageView!
    @IBOutlet weak var labelContent: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    
    @IBOutlet var viewRedTitleOffset: [UIView]!
    
    @IBOutlet weak var constraintImageViewTopHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func handleTapOnBackButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func setup() {
        
        self.labelContent.text = self.selectedNews?.content
        Utilities.setSubtitleLabel(self.labelContent)
        
        if let urls = self.selectedNews?.imageUrls! {
            if urls.count > 0 {
                self.constraintImageViewTopHeight.constant = self.view.frame.size.width * 0.75
                self.imageViewTop.sd_setImage(with: urls[0] as URL,
                                              placeholderImage: UIImage.init(named: "ic_launcher"))
            } else {
                self.constraintImageViewTopHeight.constant = 0
            }
        }
        
        self.labelDate.text = "\(self.selectedNews?.postDate)"
        self.labelDate.textColor = UIColor.white
        self.labelDate.font = UIFont.systemFont(ofSize: 16)
        
        self.labelTitle.text = self.selectedNews?.title
        self.labelTitle.textColor = UIColor.white
        self.labelTitle.font = UIFont.systemFont(ofSize: 22)
        self.labelTitle.backgroundColor = Constants.Color.CustomRed
        
        Utilities.setRedButton(self.buttonBack, title: "ВРАТИ СЕ НАЗАД")
        
        self.view.backgroundColor = Constants.Color.CustomRed
        addBackgroundOverlay()
        
        for view in self.viewRedTitleOffset {
            view.backgroundColor = Constants.Color.CustomRed
        }

    }
    

    private func addBackgroundOverlay() {
        let overlay: UIView = UIView(frame: CGRect(x: self.imageViewBackground.frame.origin.x,
                                                   y: self.imageViewBackground.frame.origin.y - 20,
                                                   width: self.imageViewBackground.frame.size.width + 40,
                                                   height: self.imageViewBackground.frame.size.height))
        
        overlay.backgroundColor = Constants.Color.OverlayGrey
        self.imageViewBackground.addSubview(overlay)
    }
    
       
    

}
