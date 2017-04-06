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
    
    func fetchNews(completion: @escaping (_ response:[News]?, _ errorMessage:String?) -> ()) {
        if Reachability.init()?.currentReachabilityStatus == .notReachable {
            completion(nil, Constants.Messages.Offline)
        } else {
            Alamofire.request(Constants.Url.newsUrl).responseJSON { (responseData) -> Void in
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
                    completion(nil, Constants.Messages.DefaultError)
                }
            }
        }
    }
    
    func registerAppointment(name:String,
                             phone:String,
                             id:String,
                             doctor:String,
                             time:String,
                             email:String,
                             therapyAppointment:Bool,
                             completion: @escaping (_ response:Any?, _ errorMessage:String?) -> ()) {
        if Reachability.init()?.currentReachabilityStatus == .notReachable {
            completion(nil, Constants.Messages.Offline)
        } else {
            Alamofire.request(Constants.Url.appointmentUrl).responseJSON { (responseData) -> Void in
                if((responseData.result.value) != nil) {
                    //let jsonArray = JSON(responseData.result.value!)
                    //print(swiftyJsonVar)
                    
                    completion(nil, nil)
                    
                } else {
                    completion(nil, Constants.Messages.DefaultError)
                }
            }
        }
    }

    func checkInsurance(lbo:String,
                        completion: @escaping (_ response:Array<String?>?, _ errorMessage:String?) -> ()) {
        
        if Reachability.init()?.currentReachabilityStatus == .notReachable {
            completion(nil, Constants.Messages.Offline)
        } else {
            Alamofire.request(Constants.Url.insuranceCheckUrl, method: .post, parameters: ["lbo":lbo])
                .responseJSON { responseData in
                    if((responseData.result.value) != nil) {
                        let jsonArray = JSON(responseData.result.value!)
                        let name = jsonArray["ime"].stringValue
                        let surname = jsonArray["prezime"].stringValue
                        let expireDate = jsonArray["overena_do"].stringValue
                        
                        if name == "" && surname == "" && expireDate == "" {
                            completion(nil, "Дошло је до грешке, вероватно сте унели погрешан ЛБО")
                        } else {
                            completion([name, surname, expireDate], nil)
                        }
                        
                    } else {
                        completion(nil, Constants.Messages.DefaultError)
                    }
            }
        }
    }


}
