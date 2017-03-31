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
    
    let newsUrl = "http://www.dzsabac.org.rs/android/droid.php"
    
    func fetchNews(completion: @escaping (_ response:[News]?, _ errorMessage:String?) -> ()) {
        Alamofire.request(URL.init(string: newsUrl)!).responseData { (resData) -> Void in
            print(resData.result.value!)
            let strOutput = String(data : resData.result.value!, encoding : String.Encoding.utf8)
            print(strOutput!)
        }
    }
}
