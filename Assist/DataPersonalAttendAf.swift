//
//  DataPersonalAttendAf.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 6..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import ObjectMapper


class DataPersonalAttendAf : Mappable{
    
//    "total_game": 55,
//    "win_game": 40,
//    "score_team": 12,
//    "score_against_team": 13
    
    var total_game : Int?
    var win_game : Int?
    var score_team : Int?
    var score_against_team : Int?
    
    
    required init?(map: Map) {
        
        
    }
    
    func mapping(map: Map) {
        total_game <- map["total_game"]
        win_game <- map["win_game"]
        score_team <- map["score_team"]
        score_against_team <- map["score_against_team"]
    }
    
}
