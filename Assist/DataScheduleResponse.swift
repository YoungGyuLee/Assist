//
//  DataScheduleResponse.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 5..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import ObjectMapper

class DataScheduleResponse : Mappable{
    
    
    var id : Int?
    var game_dt : String?
    var place : String?
    var against_team : String?
    var message : String?
    var score_team : Int?
    var score_against_team : Int?
    var tactic : String?
    
    
    
    required init?(map: Map) {
        
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        game_dt <- map["game_dt"]
        place <- map["place"]
        against_team <- map["against_team"]
        message <- map["message"]
        score_team <- map["score_team"]
        score_against_team <- map["score_against_team"]
        tactic <- map["tactic"]
        
    }
    
    
}
