//
//  DataTeamRecentResponse.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 6..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import ObjectMapper

class DataTeamRecentResponse : Mappable{
//    'year': 2017,
//    'month': 6,
//    'avg_score': 3,
//    'avg_score_against': 1
    
    
    //그래프 그릴 때 필요.
    
    
    
    
    var year : Int?
    var month : Int?
    var avg_score : Int?
    var avg_score_against : Int?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        year <- map["year"]
        month <- map["month"]
        avg_score <- map["avg_score"]
        avg_score_against <- map["avg_score_against"]
        //monty <-
    }
}
