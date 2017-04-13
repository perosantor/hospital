//
//  NewsDetailsViewController.swift
//  DomZdravlja
//
//  Created by Petar Santor on 3/31/17.
//  Copyright © 2017 Petar Santor. All rights reserved.
//

import UIKit

class NewsDetailsViewController: UIViewController {

    public var selectedNews: News? = nil
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var webViewContent: UIWebView!
    @IBOutlet weak var buttonBack: UIButton!
    
    @IBOutlet weak var imageViewBackground: UIImageView!
    
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
        //self.webViewContent.loadHTMLString("<html><body text=\"#FFFFFF\" face=\"Bookman Old Style, Book Antiqua, Garamond\" size=\"25\"></body></html>" + self.selectedNews!.content!, baseURL:nil)
        
        
        //parseHtml()
        let urls = self.selectedNews!.content!.extractURLs()
        let string = self.selectedNews!.content!.html2String
        print(string)
        
        
        
        self.webViewContent.isOpaque = false
        
        self.labelTitle.text = self.selectedNews?.title
        self.labelTitle.textColor = UIColor.white
        self.labelTitle.font = UIFont.systemFont(ofSize: 22)
        self.labelTitle.backgroundColor = Constants.Color.CustomRed
        
        Utilities.setRedButton(self.buttonBack, title: "ВРАТИ СЕ НАЗАД")
        
        self.view.backgroundColor = Constants.Color.CustomRed
        addBackgroundOverlay()

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
