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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.webViewContent.loadRequest(URLRequest(url: URL(string: "http://www.dzsabac.org.rs/?p=8446")!))
        
        self.webViewContent.loadHTMLString("<html><body text=\"#FFFFFF\" face=\"Bookman Old Style, Book Antiqua, Garamond\" size=\"5\">%@</body></html>" + self.selectedNews!.content!, baseURL:nil)
        self.webViewContent.isOpaque = false
        
        self.labelTitle.text = self.selectedNews?.title
        self.labelTitle.textColor = UIColor.white
        self.labelTitle.font = UIFont.systemFont(ofSize: 22)
        self.labelTitle.backgroundColor = Constants.Color.CustomRed
        
        
        self.buttonBack.backgroundColor = Constants.Color.CustomRed
        self.buttonBack .setTitleColor(UIColor.white, for: .normal)
        self.buttonBack.setTitle("ВРАТИ СЕ НАЗАД", for: .normal)
        
        
        self.view.backgroundColor = Constants.Color.CustomRed
        
//        if let url = NSURL(string: ),
//            let html = try? String(contentsOfURL: url)  {
//            print(html)
//        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func handleTapOnBackButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

    

}