//
//  InfoDetailsViewController.swift
//  DomZdravlja
//
//  Created by Petar Santor on 4/9/17.
//  Copyright © 2017 Petar Santor. All rights reserved.
//

import UIKit

class InfoDetailsViewController: UIViewController {

    public var infoType:String?
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var textViewContent: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
