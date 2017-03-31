//
//  NewsTableViewCell.swift
//  DomZdravlja
//
//  Created by Petar Santor on 3/24/17.
//  Copyright © 2017 Petar Santor. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelText: UILabel!
    
    @IBOutlet weak var buttonShowMore: UIButton!
    @IBOutlet weak var imageViewPostImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.buttonShowMore.backgroundColor = UIColor.red
        self.buttonShowMore.setTitleColor(UIColor.white, for: .normal)
        self.buttonShowMore.setTitle("САЗНАЈ ВИШЕ", for: .normal)
        self.buttonShowMore.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        
        labelTitle.font = UIFont.boldSystemFont(ofSize: 15)
        labelText.font = UIFont.systemFont(ofSize: 13)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
