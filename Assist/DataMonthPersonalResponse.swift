//
//  DataMonthPersonalResponse.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 6..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import ObjectMapper

class DataMonthPersonalResponse : Mappable{

    var year : Int?
    var month : Int?
    var total_game : Int?
    var win_game : Int?
    var score : Int?
    var assist : Int?
    var score_against : Int?
    
    required init?(map: Map) {
        
        
    }
    func mapping(map: Map) {
        year <- map["year"]
        month <- map["month"]
        total_game <- map["total_game"]
        win_game <- map["win_game"]
        score <- map["score"]
        assist <- map["assist"]
        score_against <- map["score_against"]
    }
    
}
