//
//  CommunicationService.swift
//  DomZdravlja
//
//  Created by Petar Santor on 3/27/17.
//  Copyright © 2017 Petar Santor. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire


struct CommunicationService {
    static let sharedInstace = CommunicationService()
    
    let newsUrl = URL.init(string: "http://www.dzsabac.org.rs/android/droid.php")!
    
    func fetchNews(completion: @escaping (_ response:[News], _ errorMessage:String?) -> ()) {
        Alamofire.request(newsUrl).responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let jsonArray = JSON(responseData.result.value!)
                //print(swiftyJsonVar)
                var newsArray: [News] = []
                for item in jsonArray.arrayValue {
                    let newPost = News.init(id: item["ID"].stringValue,
                                            title: item["post_title"].stringValue,
                                            content: item["post_content"].stringValue,
                                            postDate: item["post_date"].stringValue,
                                            type: item["post_type"].stringValue)
                    newsArray.append(newPost)
                }
                completion(newsArray, nil)
                
            }
        }
    }

}
