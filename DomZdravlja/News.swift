//
//  News.swift
//  DomZdravlja
//
//  Created by Petar Santor on 3/24/17.
//  Copyright © 2017 Petar Santor. All rights reserved.
//

import UIKit

class News: NSObject {
    
    var id: String?
    var title: String?
    var content: String?
    var postDate: Date?
    var imageUrl: String?
    var type: String?
    
    init(id:String?, title: String?, content: String?, postDate: String?, type: String?) {
        self.id = id
        self.title = title
        self.content = content
        self.postDate = Utilities.getDate(fromString:postDate)
        self.type = type
    }
    
}


/*
 
 {
 "post_name" : "predavanje-o-prevenciji-kancera-u-hemofarmu",
    "post_password" : "",
    "to_ping" : "",
    "pinged" : "",
    "post_date_gmt" : "2017-03-31 09:22:12",
 "post_date" : "2017-03-31 11:22:12",
    "comment_status" : "open",
    "post_modified_gmt" : "2017-03-31 09:22:12",
    "guid" : "http:\/\/www.dzsabac.org.rs\/?p=10337",
    "post_mime_type" : "",
 "post_status" : "publish",
    "post_excerpt" : "",
 "post_content" : "Поклањајући велику пажњу спровођењу програма скрининга ",
    "post_modified" : "2017-03-31 11:22:12",
    "menu_order" : "0",
    "post_parent" : "0",
 "ID" : "10337",
 "post_title" : "Предавање о превенцији канцера у \"Хемофарму\"",
    "post_content_filtered" : "",
 "post_type" : "post",
 "post_author" : "4",
    "ping_status" : "open",
    "comment_count" : "0"
 },
 
 */
