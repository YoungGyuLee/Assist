//
//  DataTeamMonthResponse.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 6..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import ObjectMapper

class DataTeamMonthResponse : Mappable{
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
    }
}
