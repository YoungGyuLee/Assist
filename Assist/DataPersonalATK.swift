//
//  DataPersonalATK.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 6..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import ObjectMapper

class DataPersonalATK : Mappable{
    var total_game : Int?
    var score : Int?
    var assist : Int?
    var score_team : Int?
    var score_against_team : Int?
    var no_score_against : Int?
    var win_game : Int?
    
    required init?(map: Map) {
        
        
    }
    
    func mapping(map: Map) {
        total_game <- map["total_game"]
        score <- map["score"]
        assist <- map["assist"]
        score_team <- map["score_team"]
        score_against_team <- map["score_against_team"]
        no_score_against <- map["no_score_against"]
        win_game <- map["win_game"]
    }
    
    
}
