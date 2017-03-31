//
//  News.swift
//  DomZdravlja
//
//  Created by Petar Santor on 3/24/17.
//  Copyright © 2017 Petar Santor. All rights reserved.
//

import UIKit

class News: NSObject {
    
    var newsId:String?
    var title:String?
    var content:String?
    var date:Date?
    var imgUrl:String?
    
    init(title: String?, content: String?, date: Date?, imgUrl:String?) {
        self.title = title
        self.content = content
        self.date = date
        self.imgUrl = imgUrl
    }
}
