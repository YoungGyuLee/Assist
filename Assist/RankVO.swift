//
//  RankVO.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 5..
//  Copyright © 2017년 YG. All rights reserved.
//

import ObjectMapper

class RankVO : Mappable{
    //var team
//    
//    'id': 1,
//    'teamname': 'KUCIC',
//    'total_game': 12,
//    'win_game': 7,
//    'draw_game': 3,
//    'lose_game': 2,
//    'rank': 3
    
    var id : Int?
    var teamname : String?
    var total_game : Int?
    var win_game : Int?
    var draw_game : Int?
    var lose_game : Int?
    var rank : Int?
    
    required init?(map: Map) {
        
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        teamname <- map["teamname"]
        total_game <- map["total_game"]
        win_game <- map["win_game"]
        draw_game <- map["draw_game"]
        lose_game <- map["lose_game"]
        rank <- map["rank"]
    }
    
}
