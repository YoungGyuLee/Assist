//
//  DataTacticListResponse.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 6..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import ObjectMapper

class DataTacticListResponse : Mappable{
    
    //'tactic': '4-5-1',
    //'total_game': 5,
    //'win_game': 999,
    //'draw_game': 999,
    //'lose_game': 999
    var tactic : String?
    var total_game : Int?
    var win_game : Int?
    var draw_game : Int?
    var lose_game : Int?
    
    required init?(map: Map) {
        
        
    }
    
    func mapping(map: Map) {
        tactic <- map["tactic"]
        total_game <- map["total_game"]
        win_game <- map["win_game"]
        draw_game <- map["draw_game"]
        lose_game <- map["lose_game"]
    }
}

