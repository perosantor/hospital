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
import ReachabilitySwift

struct CommunicationService {
    static let sharedInstace = CommunicationService()
    
    let newsUrl = URL.init(string: Constants.Url.newsUrl)!
    
    func fetchNews(completion: @escaping (_ response:[News]?, _ errorMessage:String?) -> ()) {
        if Reachability.init()?.currentReachabilityStatus == .notReachable {
            completion(nil, "No Internet access")
        } else {
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
                    
                } else {
                    completion(nil, "Error")
                }
            }
        }
        
    }

}
